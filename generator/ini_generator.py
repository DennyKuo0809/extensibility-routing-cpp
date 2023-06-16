# import enum
# import ned_generator
# import sys
import pickle
import math
from enum import Enum
import random
import pprint

class Stream_switch():
    def __init__(self, Lambda=0.5, period=100):
        self.Lambda = Lambda
        self.period = period

    def poisson_reverse(self, probability):
        return -math.log(1 - probability) / self.Lambda

    def on_off_schedule(self, sim_time=2000):
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

        self.poisson = Stream_switch()

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
            self.port[dst] += 1
            self.app[dst].append(new_dst_app)

        for id, (src, dst, util, _) in enumerate(self.topology.type2):
            poisson = Stream_switch(Lambda=(random.randint(1, 9)/10))
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
            new_dst_app = {
                "role": "recv", 
                "localport": self.port[dst],
                "type": int(2),
                "flow-id" : int(id),
            }
            self.port[dst] += 1
            self.app[dst].append(new_dst_app)

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

    def genINI(self, outFile, info_file):
        stream_mapping = {}

        with open(outFile, "w+") as f:
            ### Basic configuration and setting
            content = '''
[General]
network = TSN_multipath
sim-time-limit = 2ms

# disable automatic MAC forwarding table configuration
*.macForwardingTableConfigurator.typename = ""

# enable frame replication and elimination
*.*.hasStreamRedundancy = true

# enable stream policing in layer 2
*.*.bridging.streamRelay.typename = "StreamRelayLayer"
*.*.bridging.streamCoder.typename = "StreamCoderLayer"

# enable automatic stream redundancy configurator
*.streamRedundancyConfigurator.typename = "StreamRedundancyConfigurator"

'''
            f.write(content)

            ### Bit rate of edges
            content = ''
            for device in self.topology.hosts:
                for i, br in enumerate(device.host_gates_bitrate):
                    content += f"*.{device.name}.eth[{i}].bitrate = {int(10 * br)}Mbps\n"
                for i, br in enumerate(device.switch_gates_bitrate):
                    content += f"*.{device.switch_name}.eth[{i}].bitrate = {int(10 * br)}Mbps\n"
            f.write(content)

            ### Apps
            content = '''
# apps
            '''
            for i in range(self.topology.host_num):
                name = self.topology.hosts[i].name
                num = len(self.app[i])
                content += f"\n*.{name}.numApps = {num}\n"

                for j, app in enumerate(self.app[i]):
                    if app['role'] == "send":
                        if app['type'] == 1:
                            content += f'''
*.{name}.app[{j}].typename = "UdpSourceApp"
*.{name}.app[{j}].io.destAddress = "{app['dst']}"
*.{name}.app[{j}].source.packetNameFormat = "%M-%m-%c"
*.{name}.app[{j}].source.displayStringTextFormat = "sent %p pk (%l)"
*.{name}.app[{j}].source.packetLength = {int(500*app['util'])}B
*.{name}.app[{j}].source.productionInterval = 100us
*.{name}.app[{j}].display-name = "type{app['type']}_{app['flow-id']}"
*.{name}.app[{j}].io.destPort = {app['destport']}
                            '''
                        elif app['type'] == 2:
                            content += f'''
*.{name}.app[{j}].typename = "UdpBasicApp"
*.{name}.app[{j}].destAddresses = "{app['dst']}"
*.{name}.app[{j}].source.packetNameFormat = "%M-%m-%c"
*.{name}.app[{j}].source.displayStringTextFormat = "sent %p pk (%l)"
*.{name}.app[{j}].messageLength = {int(500*app['util'])}B
*.{name}.app[{j}].sendInterval = 100us
*.{name}.app[{j}].startTime = {app['start']}us
*.{name}.app[{j}].stopTime = {app['stop']}us
*.{name}.app[{j}].display-name = "type{app['type']}_{app['flow-id']}"
*.{name}.app[{j}].destPort = {app['destport']}
                            '''
                    else:
                        content += f'''
*.{name}.app[{j}].typename = "UdpSinkApp"
*.{name}.app[{j}].io.localPort = {app['localport']}
                        '''

                        ### Mapping destination module --> type + flow ID
                        stream_mapping[f'{i}-{j}'] = {
                            'stream-type': app['type'],
                            'stream-id': app['flow-id'],
                        }
            f.write(content)

            ### Routing
            content = '''
# seamless stream redundancy configuration
*.streamRedundancyConfigurator.configuration = ['''
            for i, p in enumerate(self.type1_route):
                src_ = self.topology.hosts[p[0]].name
                dst_ = self.topology.hosts[p[-1]].name
                tree_ = [self.topology.hosts[p[j]].switch_name for j in p[1:-1]]

                content += f'''
    {{
        name: "S1-{i}", 
        packetFilter: "*-type1_{i}-*", 
        source: "{self.topology.hosts[p[0]].name}", 
        destination: "{self.topology.hosts[p[-1]].name}"
        trees: [[{pprint.pformat(tree_)}]]
    }},
                '''
            for i, p in enumerate(self.type2_route):
                src_ = self.topology.hosts[p[0]].name
                dst_ = self.topology.hosts[p[-1]].name
                tree_ = [self.topology.hosts[p[j]].switch_name for j in p[1:-1]]

                content += f'''
    {{
        name: "S1-{i}", 
        packetFilter: "*-type1_{i}-*", 
        source: "{self.topology.hosts[p[0]].name}", 
        destination: "{self.topology.hosts[p[-1]].name}"
        trees: [[{pprint.pformat(tree_)}]]
    }}'''
                if i != len(self.type2_route) - 1:
                    content += ','
            content += "\n]"
            f.write(content)

            with open(info_file, 'wb') as info_f:
                pickle.dump(stream_mapping, info_f)
            '''
            *.streamRedundancyConfigurator.configuration = [
                {
                    name: "S1", 
                    packetFilter: "*-app1-*", 
                    source: "source", 
                    destination: "destination",
                    trees: [[["source", "s1", "s2a", "s3a", "destination"]]]
                },
                {
                    name: "S2", 
                    packetFilter: "*-app0-*", 
                    source: "source", 
                    destination: "destination",
                    trees: [[["source", "s1", "s2b", "s3b", "destination"]]]
                }
            ]
            '''


