class Tsn_Device():
    def __init__(self, name="", switch_name = ""):
        # There always is a switch for amy device (host)
        self.name = name 
        self.switch_name = switch_name
        self.host_gates_bitrate = []
        self.switch_gates_bitrate = []


class Link():
    def __init__(self, src, dst, cap):
        self.src = src
        self.dst = dst
        self.cap = cap
        
class Topology():
    def __init__(self):
        self.input_file = ""
        self.output_file = ""

        self.host_num = 0
        self.edge_num = 0
        self.hosts = []
        self.edges = []

        self.type1_num = 0
        self.type2_num = 0
        self.type1 = []
        self.type2 = []

        self.trans_num = 0
        

    def fromFile(self, file_name):
        self.input_file = file_name
        with open(file_name, "r") as input_file:
            # parse number of vertex
            self.host_num = int(input_file.readline().strip())

            # parse graph
            for i in range(self.host_num):
                self.hosts.append(Tsn_Device("host" + str(i), "switch" + str(i)))
                
                line = input_file.readline().strip().split(" ")
                for dst, cap in zip(line[1::2], line[2::2]):
                    self.edges.append(Link(int(i), int(dst), float(cap)))

            # parse input to be routed: type1
            self.type1_num = int(input_file.readline().strip())
            for _ in range(self.type1_num):
                src, dst, util = input_file.readline().strip().split(" ")
                self.type1.append((int(src), int(dst), float(util)))

            # parse expected utilizations: type2 (util, edge constraint)
            self.type2_num = int(input_file.readline().strip())
            for _ in range(self.type2_num):
                src, dst, util, Lambda = input_file.readline().strip().split(" ")
                self.type2.append((int(src), int(dst), float(util), float(Lambda)))

            # parse constraint 2: max number of transfer
            # self.trans_num = int(input_file.readline().strip())

    def genNed(self, file_name):
        # if file_name were not specified, output the result to stdout
        with open(file_name, "w+") as f:
            ### header
            content = '''
package inet.tutorials.extensibility_routing;
import inet.networks.base.TsnNetworkBase;
import inet.node.ethernet.EthernetLink;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnSwitch;

module LocalTsnSwitch extends TsnSwitch
{
    @defaultStatistic(\"gateStateChanged:vector\"; module=\"eth[0].macLayer.queue.gate[0]\");
}
network TSN_multipath extends TsnNetworkBase
{'''
            f.write(content)

            ### submodule (host & switch)
            content = '''
    submodules:'''

            for device in self.hosts:
                content += f'''
        {device.name}: TsnDevice {{
            @display("p=300,200");
        }}
        {device.switch_name}: LocalTsnSwitch {{
            @display("p=300,200");
        }}
'''
            f.write(content)

            ### connection (edge)
            content = '''
    connections:'''

            for device in self.hosts:
                content += f'''
        {device.name}.ethg++ <--> EthernetLink <--> {device.switch_name}.ethg++;'''
                device.host_gates_bitrate.append(10)
                device.switch_gates_bitrate.append(10)

            for edge in self.edges:
                content += f'''
        {self.hosts[edge.src].switch_name}.ethg++ <--> EthernetLink <--> {self.hosts[edge.dst].switch_name}.ethg++;'''
                self.hosts[edge.src].switch_gates_bitrate.append(edge.cap)
                self.hosts[edge.dst].switch_gates_bitrate.append(edge.cap)

            content += "\n}\n"
            f.write(content)

if __name__ == "__main__":
    T = Topology()
    import sys
    T.fromFile(sys.argv[1])
    T.genNed(sys.argv[2])
