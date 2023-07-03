import pandas as pd
import pickle
import re
from argparse import ArgumentParser, Namespace
from matplotlib import pyplot as plt

def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "--dir",
        type=str,
        help="Path to output dirctory."
    )
    args = parser.parse_args()
    return args

def d_from_s(str_):
    return re.findall(r'\d+', str_)[0]

def parse_csv(input_file):
    data = pd.read_csv(input_file)
    vector_data = data[data['type'] == 'vector']
    module_names = list(vector_data['module'])
    modules = ['host'+d_from_s(n.split('.')[1])+'-app'+d_from_s(n.split('.')[2]) for n in module_names]
    
    vecvalues = list(vector_data['vecvalue'])
    vecvalues = [[float(i) for i in l.split()] for l in vecvalues]

    vecs = {}
    for m, vecv in zip(modules, vecvalues):
        vecs[m] = vecv
    return vecs

def parse_module_info(input_file):
    with open(input_file, 'rb') as f:
        return pickle.load(f)

def parse_shortest_path_info(input_file, m2s, s2m):
    with open(input_file, 'r') as f:
        lines = f.readlines()
        for i, line in enumerate(lines):
            type_, id_, hop, total_cap = [n for n in line.split(' ')[:4]]
            module_ = s2m[f'type{type_}-{id_}']['module']
            s2m[f'type{type_}-{id_}']['sp-hop'] = int(hop)
            s2m[f'type{type_}-{id_}']['sp-cap'] = float(total_cap)
            m2s[module_]['sp-hop'] = int(hop)
            m2s[module_]['sp-cap'] = float(total_cap)
        return 

def main(args):
    ### Parse routing result
    for m in ['shortest_path', 'min_max_percentage', 'least_used_capacity_percentage', 'least_conflict_value']:
        try:
            ### Parse shortest path reult
            m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
            # print(m2s)
            # print(s_info)
            streams = list(s_info.keys())
            for k in streams:
                file_name = f'{args.dir}/result/shortest-{k}.csv'
                shortest_delay = list(parse_csv(file_name).values())[0][0]
                if k[0] == '2':
                    s_info[k]['shortest_delay'] = shortest_delay * s_info[k]['lambda']
                    s_info[k]['deadline'] = s_info[k]['shortest_delay'] * 2
                else:
                    s_info[k]['shortest_delay'] = shortest_delay
                    s_info[k]['deadline'] = s_info[k]['shortest_delay'] * 3
                    sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
            print(f"\n({m.replace('_', ' ')})")
            print("\t\tDeadline     | Average Delay | Total | Meet | Feasible Rate")
            delay_items = sorted(list(sim_delays.items()), key=lambda x: m2s[x[0]][0])
            for k, v in delay_items:
                total_package = len(v)
                avg_delay = sum(v)/len(v)
                deadline = s_info[m2s[k][0]]['deadline']
                num_meet = len([i for i in v if i <= deadline])
                print(f"({m2s[k][0]})\t \t{deadline:e} | {avg_delay:e}  | {total_package:<5} | {num_meet:<4} | {100 * num_meet/total_package:0.3f}%")

        except FileNotFoundError as e:
            print(str(e))
            pass

if __name__ == "__main__":
    args = parse_args()
    main(args)
