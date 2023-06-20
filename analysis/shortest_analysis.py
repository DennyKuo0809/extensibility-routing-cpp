import pandas as pd
import pickle
import re
from argparse import ArgumentParser, Namespace
from matplotlib import pyplot as plt

def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "--csv",
        type=str,
        help="Path to result csv."
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
            type_, id_, hop, total_cap = [n for n in line.split(' ')]
            module_ = s2m[f'type{type_}-{id_}']['module']
            s2m[f'type{type_}-{id_}']['sp-hop'] = int(hop)
            s2m[f'type{type_}-{id_}']['sp-cap'] = float(total_cap)
            m2s[module_]['sp-hop'] = int(hop)
            m2s[module_]['sp-cap'] = float(total_cap)
        return 

def main(args):
    delays = parse_csv(args.csv)
    m2s, s2m = parse_module_info(args.info + '/module.info')
    parse_shortest_path_info(args.info + '/shortest_path_info.txt', m2s, s2m)
    
    for k, v in delays.items():
        expected_time = (m2s[k]['bitrate'] * m2s[k]['sp-hop']) / (m2s[k]['sp-cap'] * 1000)
        print(f"({k}) expected time: {expected_time} | avg delay: {sum(v)/len(v)}")
        x = [i for i in range(len(v))]
        expe = [expected_time for _ in range(len(v))]
        plt.plot(x, expe)
        plt.plot(x, v)
    plt.show()
    # print(m2s)
    # print(delays)

if __name__ == "__main__":
    args = parse_args()
    main(args)
