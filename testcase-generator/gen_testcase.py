import get_topo
import bisect
import random
import itertools

class testcase:
    def __init__(
            self, 
            real_world_topo=True, 
            topo_name="Abilene",  # for real world toptology
            num_vertex=10, # for random topoloty
            cap_utl_ratio=0.5,
            type1_type2_ratio=2,
            type1_num=10,
        ):

        ### Member variables
        self.topology = None
        self.cap_matrix = None
        self.num_vertex = None
        self.type1_num = type1_num
        self.type2_num = 0
        self.cap_utl_ratio = cap_utl_ratio
        self.type1_type2_ratio = type1_type2_ratio
        self.type1 = []
        self.type2 = []
        self.trans_ratio_list = []

        ### Topology: Nodes & Edges
        if real_world_topo:
            self.num_vertex, self.topology = get_topo.get_top(topo_name)
        else:
            self.gen_topo(num_vertex)

        ### Edge capacity
        self.cap_matrix = [[0]*self.num_vertex for _ in range(self.num_vertex)]
        self.gen_capacity()

        ### Streams
        self.gen_streams()
        
    
    def gen_topo(self, num_vertex: int):
        self.num_vertex = num_vertex
        self.topology = []

        for src in range(num_vertex):
            num_edge = random.randrange(1, num_vertex-1)
            
            dst_pool = list(range(num_vertex))
            dst_pool.remove(src)

            dsts = sorted(random.sample(dst_pool, num_edge))

            self.topology.append(dsts)
    
    def gen_capacity(self):
        for src in range(self.num_vertex):
            for dst in self.topology[src]:
                self.cap_matrix[src][dst] = random.randrange(12, 25)
    
    def gen_streams(self):
        all_pair = list(itertools.permutations(range(self.num_vertex), 2))
        
        ### Type-1
        for _ in range(self.type1_num):
            src, dst = random.sample(all_pair, k=1)[0]
            self.type1.append([src, dst, random.randrange(1, 7)])

        ### Type-2
        sum_type2_lambda = 0.0
        while sum_type2_lambda < self.type1_num * self.type1_type2_ratio:
            src, dst = random.sample(all_pair, k=1)[0]
            util = random.randrange(1, 7)
            lambda_ = random.random()
            self.type2.append([src, dst, util, lambda_])
            sum_type2_lambda += lambda_

        self.type2_num = len(self.type2)
            

    def dump(self, path="./testcase.in"):
        with open(path, 'w') as f:
            ### topology
            f.write(f"{self.num_vertex}\n")
            for src in range(self.num_vertex):
                f.write(f"{len(self.topology[src])}")
                for dst in self.topology[src]:
                    f.write(f" {dst} {self.cap_matrix[src][dst]}")
                f.write("\n")
            
            ### type-1 streams
            f.write(f"{self.type1_num}\n")
            for s in self.type1:
                f.write(f"{s[0]} {s[1]} {s[2]}\n")

            ### type-2 streams
            f.write(f"{self.type2_num}\n")
            for s in self.type2:
                f.write(f"{s[0]} {s[1]} {s[2]} {s[3]}\n")

if __name__ == "__main__":
    T = testcase()
    T.dump(path='input/Abilene.in')

            
