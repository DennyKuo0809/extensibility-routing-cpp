import pickle
import math
from enum import Enum
import random
import pprint
import configparser
import json

class Stream_switch():
    def __init__(self, Lambda=0.5, period=100):
        self.Lambda = Lambda
        self.period = period # unit: us

    def poisson_reverse(self, probability):
        return -math.log(1 - probability) / self.Lambda

    def on_off_schedule(self, sim_time=10000):
        t = 0
        on = False
        schedule = []

        index = 0

        while t < sim_time // self.period:
            r = random.random()
            if on:
                if r <= self.Lambda:
                    ### Turn off
                    on = False
                    schedule[index][1] = t
                    index += 1
                    # print(f"Turn off on time {t}")
                    # print(schedule, "\n")
                else:
                    ### Keep on
                    t += 1
            else: # off
                interval = max(int(self.poisson_reverse(r)), 0)
                if t + interval >= sim_time // self.period:
                    break
                if interval > 0 or len(schedule) == 0:
                    schedule.append([t + interval, -1])
                else:
                    index -= 1

                # print("poisson result ", self.poisson_reverse(r), " \n")
                # print(f"Turn on on time {t + interval}")
                # print(schedule, "\n")
                t = t + interval + 1
                on = True
        if on:
            schedule[index][1] = sim_time // self.period
        return schedule
    
class Route():
    def __init__(self, T):
        self.topology = T
        self.app = [[] for _ in range(T.host_num)]
        self.port = [1000 for _ in range(T.host_num)]
        self.type1_route = []
        self.type2_route = []
        self.app_statics = {}

        self.poisson = Stream_switch()
        self.config = None
        self.module_2_stream = {}
        self.stream_info = {}

    def parseStream(self):
        for id, (src, dst, util) in enumerate(self.topology.type1):
            new_src_app = {
                "role": "send", 
                "destport": self.port[dst],
                "dst": self.topology.hosts[dst].name,
                "util": util,
                "type": int(1),
                "flow-id" : int(id),
            }
            self.app[src].append(new_src_app)

            new_dst_app = {
                "role": "recv", 
                "localport": self.port[dst],
                "type": int(1),
                "flow-id" : int(id),
            }
            self.app_statics[f"1-{id}"] = 100
            self.port[dst] += 1
            self.app[dst].append(new_dst_app)
            self.module_2_stream[f'host{dst}-app{len(self.app[dst])-1}'] = f'1-{id}'
            self.stream_info[f'1-{id}'] = {
                'module': f'host{dst}-app{len(self.app[dst])-1}',
                'bitrate': self.topology.type1[id][2],
                'number': 100
            }

        for id, (src, dst, util, lambda_) in enumerate(self.topology.type2):
            # poisson = Stream_switch(Lambda=(random.randint(1, 9)/10))
            poisson = Stream_switch(Lambda=float(lambda_))
            poisson_schedule = poisson.on_off_schedule()
            for interval in poisson_schedule:
                new_src_app = {
                    "role": "send", 
                    "destport": self.port[dst],
                    "dst": self.topology.hosts[dst].name,
                    "util": util,
                    "type": int(2),
                    "flow-id" : int(id),
                    "start": interval[0] * 100,
                    "stop": interval[1] * 100
                }
                self.app[src].append(new_src_app)
                if f"2-{id}" not in self.app_statics:
                    self.app_statics[f"2-{id}"] = interval[1] - interval[0]
                else:
                    self.app_statics[f"2-{id}"] += (interval[1] - interval[0])
            new_dst_app = {
                "role": "recv", 
                "localport": self.port[dst],
                "type": int(2),
                "flow-id" : int(id)
            }
            self.port[dst] += 1
            self.app[dst].append(new_dst_app)
            self.module_2_stream[f'host{dst}-app{len(self.app[dst])-1}'] = f'2-{id}'
            self.stream_info[f'2-{id}'] = {
                'module': f'host{dst}-app{len(self.app[dst])-1}',
                'bitrate': self.topology.type2[id][2],
                'lambda': self.topology.type2[id][3],
                'number': self.app_statics[f"2-{id}"]
            }
        
    def fromFile(self, file_name):
        with open(file_name, 'r') as in_f:
            num_type1 = int(in_f.readline().strip())
            for _ in range(num_type1):
                p = in_f.readline().split()
                p = [int(e) for e in p]
                self.type1_route.append(p)

            num_type2 = int(in_f.readline().strip())
            for _ in range(num_type2):
                p = in_f.readline().split()
                p = [int(e) for e in p]
                self.type2_route.append(p)
    
    def parseRouting(self, type1_route, type2_cycle):
        self.type1_route = [r[0] for r in type1_route]
        
        for (src, dst, _, _) in self.topology.type2:
            ls = [i for i, n in enumerate(type2_cycle) if n == src]
            ld = [i for i, n in enumerate(type2_cycle) if n == dst]
            
            min_dis = self.topology.host_num * 2
            s_idx = -1
            d_idx = -1
            for i in ld:
                for j in ls:
                    if j < i:
                        if i - j < min_dis:
                            min_dis = i - j
                            s_idx = j
                            d_idx = i
                    elif j > i:
                        if i + len(type2_cycle) - j - 1 < min_dis:
                            min_dis = i + len(type2_cycle) - j - 1
                            s_idx = j
                            d_idx = i
            if d_idx > s_idx:
                self.type2_route.append(type2_cycle[s_idx:d_idx+1])
            else:
                self.type2_route.append(type2_cycle[s_idx:] + type2_cycle[1: d_idx+1])

        return

    def gen_scenario(self):
        self.config = configparser.RawConfigParser()
        self.config.optionxform = str

        self.config.add_section('General')
        self.config.set("General", "network", "TSN_multipath")
        self.config.set("General", "sim-time-limit", "10ms")

        # disable automatic MAC forwarding table configuration
        self.config.set("General", "*.macForwardingTableConfigurator.typename", "\"\"")
        
        # enable frame replication and elimination
        self.config.set("General", "*.*.hasStreamRedundancy", "true")
        
        # enable stream policing in layer 2
        self.config.set("General", "*.*.bridging.streamRelay.typename", "\"StreamRelayLayer\"")
        self.config.set("General", "*.*.bridging.streamCoder.typename", "\"StreamCoderLayer\"")
        
        # enable automatic stream redundancy configurator
        self.config.set("General", "*.streamRedundancyConfigurator.typename", "\"StreamRedundancyConfigurator\"")

        ### Bit rate of edges
        for device in self.topology.hosts:
            for i, br in enumerate(device.host_gates_bitrate):
                self.config.set("General", f"*.{device.name}.eth[{i}].bitrate", f"{int(100 * br)}Mbps")
            for i, br in enumerate(device.switch_gates_bitrate):
                self.config.set("General", f"*.{device.switch_name}.eth[{i}].bitrate", f"{int(100 * br)}Mbps")

    def make_route_str(self, routes):
        num_route = len(routes)
        route_str = "[\n"
        for i, route in enumerate(routes):
            route_str += '{\n'
            for j, (k, v) in enumerate(route.items()):
                if j == 4:
                    route_str += f'\t{k}: {v}\n'
                else:
                    route_str += f'\t{k}: {v},\n'
            if i == num_route - 1:
                route_str += '}]\n'
            else:
                route_str += '},\n'
        return route_str

    def gen_routing(self):
        single_quote = "'"
        double_quote = '"'
        # Generate route str
        routes = []
        for i, p in enumerate(self.type1_route):
            # print(p)
            src_ = self.topology.hosts[p[0]].name
            dst_ = self.topology.hosts[p[-1]].name
            tree_ = [src_] + [self.topology.hosts[j].switch_name for j in p] + [dst_]
            routes.append(
                {
                    'name': f'\"S1-{i}\"',
                    'packetFilter': f'\"*-type1_{i}-*\"',
                    'source': f'\"{src_}\"',
                    'destination': f'\"{dst_}\"',
                    'trees': f'[[{pprint.pformat(tree_).replace(single_quote, double_quote)}]]'
                }
            )
        for i, p in enumerate(self.type2_route):
            # print(p)
            src_ = self.topology.hosts[p[0]].name
            dst_ = self.topology.hosts[p[-1]].name
            tree_ = [src_] + [self.topology.hosts[j].switch_name for j in p] + [dst_]
            routes.append(
                {
                    'name': f'\"S2-{i}\"',
                    'packetFilter': f'\"*-type2_{i}-*\"',
                    'source': f'\"{src_}\"',
                    'destination': f'\"{dst_}\"',
                    'trees': f'[[{pprint.pformat(tree_).replace(single_quote, double_quote)}]]'
                }
            )
        return self.make_route_str(routes)

    def genINI(self, outFile):
        ### Basic configuration and setting + Capacity of edges
        self.config = None
        self.gen_scenario()

        ### Apps
        for i in range(self.topology.host_num):
            name = self.topology.hosts[i].name
            num = len(self.app[i])
            self.config.set("General", f"*.{name}.numApps", f"{num}")
            for j, app in enumerate(self.app[i]):
                if app['role'] == "send":
                    if app['type'] == 1:
                        self.config.set("General", f"*.{name}.app[{j}].typename", "\"UdpSourceApp\"")
                        self.config.set("General", f"*.{name}.app[{j}].io.destAddress", f"\"{app['dst']}\"")
                        self.config.set("General", f"*.{name}.app[{j}].source.packetNameFormat", "\"%M-%m-%c\"")
                        self.config.set("General", f"*.{name}.app[{j}].source.displayStringTextFormat", "\"sent %p pk (%l)\"")
                        self.config.set("General", f"*.{name}.app[{j}].source.packetLength", f"{int(10000*app['util'])}B")
                        self.config.set("General", f"*.{name}.app[{j}].source.productionInterval", "1ms")
                        self.config.set("General", f"*.{name}.app[{j}].display-name", f"\"type{app['type']}_{app['flow-id']}\"")
                        self.config.set("General", f"*.{name}.app[{j}].io.destPort", f"{app['destport']}")
                    elif app['type'] == 2:
                        self.config.set("General", f"*.{name}.app[{j}].typename", "\"UdpBasicApp\"")
                        self.config.set("General", f"*.{name}.app[{j}].destAddresses", f"\"{app['dst']}\"")
                        self.config.set("General", f"*.{name}.app[{j}].source.packetNameFormat", "\"%M-%m-%c\"")
                        self.config.set("General", f"*.{name}.app[{j}].source.displayStringTextFormat", "\"sent %p pk (%l)\"")
                        self.config.set("General", f"*.{name}.app[{j}].messageLength", f"{int(10000*app['util'])}B")
                        self.config.set("General", f"*.{name}.app[{j}].sendInterval", "1ms")
                        self.config.set("General", f"*.{name}.app[{j}].startTime", f"{app['start']}us")
                        self.config.set("General", f"*.{name}.app[{j}].stopTime", f"{app['stop']}us")
                        self.config.set("General", f"*.{name}.app[{j}].display-name", f"\"type{app['type']}_{app['flow-id']}\"")
                        self.config.set("General", f"*.{name}.app[{j}].destPort", f"{app['destport']}")
                else:
                    self.config.set("General", f"*.{name}.app[{j}].typename", "\"UdpSinkApp\"")
                    self.config.set("General", f"*.{name}.app[{j}].io.localPort", f"{app['localport']}")

        ### Routing
        routing_content = self.gen_routing()
        self.config.set("General", "*.streamRedundancyConfigurator.configuration", routing_content)

        ### Write to file
        with open(outFile, "w") as f:
            self.config.write(f)

    def genINI_shortest_path(self, info_file, out_dir):  
        single_quote = "'"
        double_quote = '"'
        with open(info_file, 'r') as info_f:
            lines = info_f.readlines()
            for line in lines:
                infos = line.split()
                type_, id_ = [int(infos[0]), int(infos[1])]
                
                if type_ == 1:
                    src, dst, util = self.topology.type1[id_]
                else:
                    src, dst, util, _ = self.topology.type2[id_]
                rout = [int(n) for n in infos[4:]]

                src_name = self.topology.hosts[src].name
                dst_name = self.topology.hosts[dst].name
                tree_ = [src_name] + [self.topology.hosts[n].switch_name for n in rout] + [dst_name]
                
                ### Basic configuration and setting + Capacity of edges
                self.config = None
                self.gen_scenario()

                ### Apps
                packetNameFormat = '\"%M-%m-%c\"'
                self.config.set("General", f"*.{src_name}.numApps", "1")
                self.config.set("General", f"*.{src_name}.app[0].typename", "\"UdpSourceApp\"")
                self.config.set("General", f"*.{src_name}.app[0].io.destAddress", f"\"{dst_name}\"")
                self.config.set("General", f"*.{src_name}.app[0].source.packetNameFormat", packetNameFormat)
                self.config.set("General", f"*.{src_name}.app[0].source.displayStringTextFormat", "\"sent %p pk (%l)\"")
                self.config.set("General", f"*.{src_name}.app[0].source.packetLength", f"{int(10000*util)}B")
                self.config.set("General", f"*.{src_name}.app[0].source.productionInterval", "1ms")
                self.config.set("General", f"*.{src_name}.app[0].display-name", f"\"type{type_}_{id_}\"")
                self.config.set("General", f"*.{src_name}.app[0].io.destPort", "1000")

                self.config.set("General", f"*.{dst_name}.numApps", "1")
                self.config.set("General", f"*.{dst_name}.app[0].typename", "\"UdpSinkApp\"")
                self.config.set("General", f"*.{dst_name}.app[0].io.localPort", "1000")

                ### Routes
                routes = [
                    {
                        "name": '\"shortest_path\"', 
                        "packetFilter": f'\"*-type{type_}_{id_}-*\"', 
                        "source": f'\"{src_name}\"', 
                        "destination": f'\"{dst_name}\"',
                        "trees": f"[[{pprint.pformat(tree_).replace(single_quote, double_quote)}]]"
                    }
                ]
                route_str = self.make_route_str(routes)
                self.config.set("General", "*.streamRedundancyConfigurator.configuration", route_str)
                
                ### Write out the configure
                with open(f'{out_dir}/shortest-{type_}-{id_}.ini', 'w') as out_f:
                    self.config.write(out_f)

    def genINFO(self, file_name):
        with open(file_name, 'wb') as info_f:
                pickle.dump([self.module_2_stream, self.stream_info], info_f)
