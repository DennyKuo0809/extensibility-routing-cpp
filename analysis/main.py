import pandas as pd
import pickle
import re
from argparse import ArgumentParser, Namespace
from matplotlib import pyplot as plt

def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "--result",
        type=str,
        help="Path to result dirctory."
    )
    parser.add_argument(
        "--info",
        type=str,
        help="Path to directory contains information."
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
    sim_delays = parse_csv(args.result + '/result.csv')
    m2s, s2m = parse_module_info(args.info + '/modules.info')
    parse_shortest_path_info(args.info + '/shortest_path_info.txt', m2s, s2m)
    
    for k, v in sim_delays.items():
        stream_name = m2s[k]['stream'].replace('type', '')
        shortest_path_delay = parse_csv(args.result + f'/result{stream_name}.csv').values()
        shortest_path_delay = list(shortest_path_delay)[0]
        print(f"({k}) shortest delay: {shortest_path_delay[0]:e} | avg delay: {(sum(v)/len(v)):e}")
        plt.plot(v, label=f"sp{stream_name}")
        plt.plot(shortest_path_delay, label=f"sim{stream_name}")
        plt.legend(loc="upper right")
        plt.show()
    # print(m2s)
    # print(delays)

if __name__ == "__main__":
    args = parse_args()
    main(args)
