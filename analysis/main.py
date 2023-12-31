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
        help="Path to simulation result dirctory."
    )
    parser.add_argument(
        "--out",
        type=str,
        help="Path to output csv."
    )
    parser.add_argument(
        "--dir_list",
        nargs="*",
        type=str,
        default=[]
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
    
    vecvalues = []
    if 'vecvalue' in vector_data:
        vecvalues = list(vector_data['vecvalue'])
    if len(vecvalues) and isinstance(vecvalues[0], str):
        vecvalues = [[float(i) for i in l.split()] for l in vecvalues ]
    else:
        vecvalues = [vecvalues]

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

# def worst_avg_table(args):
#     ### Methods and Streams
#     method_list = [
#         'shortest_path', 
#         'min_max_percentage', 
#         'least_used_capacity_percentage', 
#         'least_conflict_value', 
#         'ILP'
#     ]
#     _, s_info = parse_module_info(args.dir + f'/info/module_stream_{method_list[0]}.pickle')
#     stream_list = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))

#     ### Parse the latency of shortest path routing without other streams
#     shortest_latency = {}
#     for s in stream_list:
#         file_name = f'{args.dir}/result/shortest-{s}.csv'
#         d = list(parse_csv(file_name).values())
#         shortest_latency[s] = d[0][0]

#     ### Construct Tables
#     statistic = {
#         'type1_min': [],
#         'type1_max': [],
#         'type1_mean': [],
#         'type1_stddev': [],
#         'type2_min': [],
#         'type2_max': [],
#         'type2_mean': [],
#         'type2_stddev': [],
#     }
#     import prettytable as pt
#     tb = pt.PrettyTable()
#     tb.add_column("Streams", stream_list)

#     for i, m in enumerate(method_list):
#         try:
#             column = []
#             m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
#             sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
#             for s in stream_list:
#                 if s_info[s]['module'] in sim_delays:
#                     avg_delay = sum(sim_delays[s_info[s]['module']]) / len(sim_delays[s_info[s]['module']])
#                     max_delay = max(sim_delays[s_info[s]['module']])
#                     # avg_delay *= 1e4
#                     # max_delay *= 1e4
#                     avg_delay /= shortest_latency[s]
#                     max_delay /= shortest_latency[s]
#                 else:
#                     avg_delay = -1
#                     max_delay = -1
#                 column.append(f'{avg_delay:0.3f} / {max_delay:0.3f}')
#             tb.add_column(m, column)
#         except FileNotFoundError as e:
#             # print(str(e))
#             pass
#     print()
#     print(tb)

def worst_avg_table(args):
    ### Methods and Streams
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    _, s_info = parse_module_info(args.dir + f'/info/module_stream_{method_list[0]}.pickle')
    print('[s_info in analysis]\n', s_info)
    stream_list = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))

    ### Parse the latency of shortest path routing without other streams
    shortest_latency = {}
    for s in stream_list:
        file_name = f'{args.dir}/result/shortest-{s}.csv'
        d = list(parse_csv(file_name).values())
        shortest_latency[s] = d[0][0]

    df = pd.DataFrame({'stream': stream_list})
    
    ### Construct Tables
    import prettytable as pt
    tb = pt.PrettyTable()
    tb.add_column("Streams", stream_list)

    for i, m in enumerate(method_list):
        try:
            column = []
            m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
            
            sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
            for s in stream_list:
                if s_info[s]['module'] in sim_delays:
                    avg_delay = sum(sim_delays[s_info[s]['module']]) / len(sim_delays[s_info[s]['module']])
                    max_delay = max(sim_delays[s_info[s]['module']])
                    # avg_delay *= 1e4
                    # max_delay *= 1e4
                    avg_delay /= shortest_latency[s]
                    max_delay /= shortest_latency[s]
                    length = len(sim_delays[s_info[s]['module']])
                else:
                    avg_delay = -1
                    max_delay = -1
                    length = 0

                column.append(f'{avg_delay:0.3f} / {max_delay:0.3f} / {length} / {s_info[s]["number"]}')
            df[m] = column
            tb.add_column(m, column)
        except FileNotFoundError as e:
            # print(str(e))
            pass
    print()
    print(tb)
    df.to_csv(args.out)

def multiple_dir_analysis(args):
    ### Methods and Streams
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    _, s_info = parse_module_info(args.dir + f'/info/module_stream_{method_list[0]}.pickle')
    stream_list = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))

    ### Parse the latency of shortest path routing without other streams
    shortest_latency = {}
    for s in stream_list:
        file_name = f'{args.dir}/result/shortest-{s}.csv'
        d = list(parse_csv(file_name).values())
        shortest_latency[s] = d[0][0]

    ### Construct Tables
    import prettytable as pt
    tb = pt.PrettyTable()
    tb.add_column("Streams", stream_list)

    for i, m in enumerate(method_list):
        try:
            column = []
            m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
            sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
            for s in stream_list:
                if s_info[s]['module'] in sim_delays:
                    avg_delay = sum(sim_delays[s_info[s]['module']]) / len(sim_delays[s_info[s]['module']])
                    max_delay = max(sim_delays[s_info[s]['module']])
                    # avg_delay *= 1e4
                    # max_delay *= 1e4
                    avg_delay /= shortest_latency[s]
                    max_delay /= shortest_latency[s]
                else:
                    avg_delay = -1
                    max_delay = -1
                column.append(f'{avg_delay:0.3f} / {max_delay:0.3f}')
            tb.add_column(m, column)
        except FileNotFoundError as e:
            # print(str(e))
            pass
    print()
    print(tb)


if __name__ == "__main__":
    args = parse_args()
    if len(args.dir_list) == 0:
        worst_avg_table(args)
    else:
        multiple_dir_analysis(args)