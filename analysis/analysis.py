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

# def main_deadline(args):
#     ### Parse routing result
#     for m in ['shortest_path', 'min_max_percentage', 'least_used_capacity_percentage', 'least_conflict_value', 'ILP']:
#         try:
#             ### Parse shortest path reult
#             m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
#             # print(m2s)
#             # print(s_info)
#             streams = list(s_info.keys())
#             for k in streams:
#                 file_name = f'{args.dir}/result/shortest-{k}.csv'
#                 shortest_delay = list(parse_csv(file_name).values())[0][0]
#                 if k[0] == '2':
#                     s_info[k]['shortest_delay'] = shortest_delay * s_info[k]['lambda']
#                     s_info[k]['deadline'] = s_info[k]['shortest_delay'] * 2
#                 else:
#                     s_info[k]['shortest_delay'] = shortest_delay
#                     s_info[k]['deadline'] = s_info[k]['shortest_delay'] * 3
#                     sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
#             print(f"\n({m.replace('_', ' ')})")
#             # print("\t\t| Expected | Total | Feasible Rate")
#             delay_items = sorted(list(sim_delays.items()), key=lambda x: m2s[x[0]][0])
#             import prettytable as pt
#             tb = pt.PrettyTable()
#             tb.field_names = ['Stream', 'Expected', 'Deliver', 'Deliver Rate']
#             for k, v in delay_items:
#                 expected_package = s_info[m2s[k][0]]["number"]
#                 total_package = len(v)
#                 avg_delay = sum(v)/len(v)
#                 deadline = s_info[m2s[k][0]]['deadline']
#                 num_meet = len([i for i in v if i <= deadline])
#                 tb.add_row([m2s[k][0], expected_package, total_package, f"{100 * total_package/expected_package:0.3f}"])
#                 # print(f"({m2s[k][0]}) | {expected_package:<5} | {total_package:<4} | {100 * total_package/expected_package:0.3f}%")
#             print(tb)
#         except FileNotFoundError as e:
#             # print(str(e))
#             pass

def main_deadline_avg(args):
    ### TODO: Box Plot
    ### Parse routing result
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    import numpy as np
    width = 1 / (len(method_list) + 1)
    streams = None
    for i, m in enumerate(method_list):
        try:
            ### Parse shortest path reult
            m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
            # print(m2s)
            # print(s_info)
            if streams is None:
                streams = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))
            for k in streams:
                file_name = f'{args.dir}/result/shortest-{k}.csv'
                shortest_delay_list = list(parse_csv(file_name).values())[0]
                s_info[k]['shortest_delay'] = sum(shortest_delay_list) / len(shortest_delay_list)

            sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
            # print(f"\n({m.replace('_', ' ')})")
            # print("\t\tDeadline     | Average Delay | Total | Meet | Feasible Rate")
            # print(sim_delays)
            # delay_items = sorted(list(sim_delays.items()), key=lambda x: m2s[x[0]][0])
            delays = []
            labels = []

            for s in streams:
                if s_info[s]['module'] in sim_delays:
                    avg_delay = sum(sim_delays[s_info[s]['module']]) / len(sim_delays[s_info[s]['module']])
                else:
                    avg_delay = 0
                
                print(f"{s} | {avg_delay} | {s_info[s]['shortest_delay']}")
                delays.append(avg_delay / s_info[s]['shortest_delay'])
                labels.append(s)
            x = np.arange(len(streams))
            plt.bar(x + i * width , delays, label=f"{m.replace('_', ' ')}", width=width)

            # plt.boxplot(delays, labels=labels, widths=width, positions=x + i * width)
            

        except FileNotFoundError as e:
            print(str(e))
            pass
    plt.xticks(x + (len(method_list)-1) * width/2, streams)
    plt.title('50 nodes')
    plt.ylabel('Delay / (delay of shortest path)')
    plt.grid(axis='y', linestyle='--')
    plt.legend()
    plt.show()

def main_deadline_lu_cut(args):
    ### TODO: Box Plot
    ### Parse routing result
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    import numpy as np
    width = 1 / 3
    streams = None
    m = 'least_used_capacity_percentage'
    ### Parse shortest path reult
    m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
    m2s_cut, s_info_cut = parse_module_info(args.dir + f'-cut/info/module_stream_{m}.pickle')
    # print(m2s)
    # print(s_info)
    if streams is None:
        streams = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))
    for k in streams:
        file_name = f'{args.dir}/result/shortest-{k}.csv'
        shortest_delay_list = list(parse_csv(file_name).values())[0]
        
        shortest_delay = sum(shortest_delay_list)/len(shortest_delay_list)
        s_info[k]['shortest_delay'] = shortest_delay
            

        print(f"{k} | {shortest_delay_list} | {s_info[k]['lambda']}")
            

    cut_sim_delays = parse_csv(f'{args.dir}-cut/result/{m}.csv')
    sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
    delays = []
    cut_delays = []
    labels = []

    for s in streams:
        if s_info[s]['module'] in sim_delays:
            avg_delay = sum(sim_delays[s_info[s]['module']]) / len(sim_delays[s_info[s]['module']])
        else:
            avg_delay = 0
        if s_info_cut[s]['module'] in cut_sim_delays:
            cut_avg_delay = sum(cut_sim_delays[s_info_cut[s]['module']]) / len(cut_sim_delays[s_info_cut[s]['module']])
        else:
            cut_avg_delay = 0
        print(f"{s} | {avg_delay} | {s_info[s]['shortest_delay']}")
        delays.append(avg_delay / s_info[s]['shortest_delay'])
        cut_delays.append(cut_avg_delay / s_info[s]['shortest_delay'])
        labels.append(s)
    x = np.arange(len(streams))
    # print(delays)
    # print(cut_delays)
    plt.bar(x , delays, label=f"No cut", width=width)
    plt.bar(x +width , cut_delays, label=f"Cut", width=width)

    start, end = plt.ylim()
    plt.title('20 nodes')
    plt.ylabel('Delay / (delay of shortest path)')
    plt.yticks(np.arange(start, end, 0.5))
    plt.xticks(x + width/2, streams)
    plt.grid(axis='y', linestyle='--')
    plt.legend()
    plt.show()

def main_deliver(args):
    ### Parse routing result
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    import numpy as np
    width = 1 / (len(method_list) + 1)
    streams = None
    for i, m in enumerate(method_list):
        try:
            m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
            if streams is None:
                streams = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))
            # print(streams)
            sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
            delay_items = sorted(list(sim_delays.items()), key=lambda x: m2s[x[0]][0])
            print(f"\n({m.replace('_', ' ')})")
            # print(delay_items)
            deliver_rates = []
            for s in streams:
                expected_package = s_info[s]["number"]
                if s_info[s]['module'] in sim_delays:
                    deliver_package = len(sim_delays[s_info[s]['module']])
                else:
                    deliver_package = 0
                deliver_rates.append(100 * (deliver_package/expected_package))
            x = np.arange(len(streams))
            plt.bar(x + i * width , deliver_rates, label=f"{m.replace('_', ' ')}", width=width)

        except FileNotFoundError as e:
            # print(str(e))
            pass
    plt.xticks(x + (len(method_list)-1) * width/2, streams)
    plt.legend()
    plt.show()

def main_deliver_lu_cut(args):
    ### Parse routing result
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    import numpy as np
    width = 1 / 3
    streams = None
    m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_least_used_capacity_percentage.pickle')
    m2s_cut, s_info_cut = parse_module_info(args.dir + f'-cut/info/module_stream_least_used_capacity_percentage.pickle')
    if streams is None:
        streams = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))
    # print(streams)
    sim_delays = parse_csv(f'{args.dir}/result/least_used_capacity_percentage.csv')
    cut_sim_delays = parse_csv(f'{args.dir}-cut/result/least_used_capacity_percentage.csv')
    delay_items = sorted(list(sim_delays.items()), key=lambda x: m2s[x[0]][0])
    cut_delay_items = sorted(list(cut_sim_delays.items()), key=lambda x: m2s_cut[x[0]][0])
    # print(f"\n({m.replace('_', ' ')})")
    # print(delay_items)
    deliver_rates = []
    cut_deliver_rates = []
    x = np.arange(len(streams))
    for s in streams:
        expected_package = s_info[s]["number"]
        if s_info[s]['module'] in sim_delays:
            deliver_package = len(sim_delays[s_info[s]['module']])
        else:
            deliver_package = 0

        if s_info_cut[s]['module'] in cut_sim_delays:
            cut_deliver_package = len(cut_sim_delays[s_info_cut[s]['module']])
        else:
            cut_deliver_package = 0
        
        deliver_rates.append(100 * (deliver_package/expected_package))
        cut_deliver_rates.append(100 * (cut_deliver_package/expected_package))

    plt.bar(x, deliver_rates, label=f"No cut", width=width)
    plt.bar(x + width, cut_deliver_rates, label=f"Cut", width=width)
    

    # except FileNotFoundError as e:
    #     print(str(e))
    #     pass
    plt.xticks(x + width/2, streams)
    plt.legend()
    plt.show()


def worst_avg_table(args):
    ### TODO: Box Plot
    ### Parse routing result
    method_list = [
        'shortest_path', 
        'min_max_percentage', 
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    import prettytable as pt
    tb = pt.PrettyTable()
    tb.field_names = ['Stream', 'Expected', 'Deliver', 'Deliver Rate']
    for i, m in enumerate(method_list):
        try:
            ### Parse shortest path reult
            m2s, s_info = parse_module_info(args.dir + f'/info/module_stream_{m}.pickle')
            # print(m2s)
            # print(s_info)
            if streams is None:
                streams = sorted(list(s_info.keys()), key=lambda x: (x[0],int(x[2:])))
            for k in streams:
                file_name = f'{args.dir}/result/shortest-{k}.csv'
                shortest_delay_list = list(parse_csv(file_name).values())[0]
                s_info[k]['shortest_delay'] = sum(shortest_delay_list) / len(shortest_delay_list)

            sim_delays = parse_csv(f'{args.dir}/result/{m}.csv')
            # print(f"\n({m.replace('_', ' ')})")
            # print("\t\tDeadline     | Average Delay | Total | Meet | Feasible Rate")
            # print(sim_delays)
            # delay_items = sorted(list(sim_delays.items()), key=lambda x: m2s[x[0]][0])
            delays = []
            labels = []

            for s in streams:
                if s_info[s]['module'] in sim_delays:
                    avg_delay = sum(sim_delays[s_info[s]['module']]) / len(sim_delays[s_info[s]['module']])
                else:
                    avg_delay = 0
                
                print(f"{s} | {avg_delay} | {s_info[s]['shortest_delay']}")
                delays.append(avg_delay / s_info[s]['shortest_delay'])
                labels.append(s)
            x = np.arange(len(streams))
            plt.bar(x + i * width , delays, label=f"{m.replace('_', ' ')}", width=width)

            # plt.boxplot(delays, labels=labels, widths=width, positions=x + i * width)
            

        except FileNotFoundError as e:
            print(str(e))
            pass
    plt.xticks(x + (len(method_list)-1) * width/2, streams)
    plt.title('50 nodes')
    plt.ylabel('Delay / (delay of shortest path)')
    plt.grid(axis='y', linestyle='--')
    plt.legend()
    plt.show()

if __name__ == "__main__":
    args = parse_args()
    worst_avg_table(args)