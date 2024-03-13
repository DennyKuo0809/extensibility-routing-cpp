import pandas as pd
import pickle
import re
from argparse import ArgumentParser, Namespace
from matplotlib import pyplot as plt

def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "--inDir",
        type=str,
        help="Path to simulation result dirctory."
    )
    parser.add_argument(
        "--outDir",
        type=str,
        help="Path to simulation result dirctory."
    )
    parser.add_argument(
        "--num",
        type=int,
        help="Path to simulation result dirctory."
    )
    parser.add_argument(
        "--prefix",
        type=str,
        help="Path to simulation result dirctory."
    )
    args = parser.parse_args()
    return args

def statistic_dir(dir):
    res = {}
    tmp = {}
    methods = {
        'shortest_path', 
        'min_max_percentage',
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    }
    for m in methods:
        res[m] = {
            'avg': 0,
            'max': 0,
            'feasible': 0
        }
        tmp[m] = {
            'package-cnt': 0,
            'total-delay': 0.0,
            'max-delay': 0.0,
            'testcase-cnt': 0,
            'solve-cnt': 0,
        }

    for i in range(50):
        try:
            file_name = f'{dir}/{i}.csv'
            df = pd.read_csv(file_name)
            for m in methods:
                if m in df.columns:
                    data_list = list(df[m])
                    solve = True
                    total_cnt = 0
                    total_delay = 0.0
                    max_delay = -1
                    for d in data_list:
                        avg, maxi, cnt, total = [float(v) for v in d.split(' / ')]
                        # print(avg, maxi, cnt)
                        if cnt == total:
                            total_cnt += cnt
                            total_delay += cnt * avg
                            max_delay = max(max_delay, maxi)
                        else:
                            solve = False
                            break
                    if solve:
                        tmp[m]['solve-cnt'] += 1
                        tmp[m]['package-cnt'] += total_cnt
                        tmp[m]['total-delay'] += total_delay
                        tmp[m]['max-delay'] = max(tmp[m]['max-delay'], max_delay)

                tmp[m]['testcase-cnt'] += 1
                        
        except FileNotFoundError:
            pass
    
    for m in methods:
        res[m]['avg'] = tmp[m]['total-delay'] / tmp[m]['package-cnt'] if tmp[m]['package-cnt'] != 0 else -1
        res[m]['max'] = tmp[m]['max-delay']
        res[m]['feasible'] =  tmp[m]['solve-cnt'] / tmp[m]['testcase-cnt'] if tmp[m]['testcase-cnt'] != 0 else -1
        # print(m, tmp[m]['solve-cnt'],  tmp[m]['testcase-cnt'])
    # print(res)
    return res


def convert(args):
    methods = {
        'shortest_path', 
        'min_max_percentage',
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    }
    s_v_ratio = [1, 1.25, 1.5, 1.75, 2]
    s2_s1_ratio = [1, 2, 3, 4]

    for svr in s_v_ratio:
        result = {}
        for m in methods:
            result[m] = {
                'avgs': [],
                'maxs': [],
                'feasibles': []
            }
        for s21_r in s2_s1_ratio:
            dir_ = f'{args.inDir}/{args.num}-{svr}-{s21_r}'
            res = statistic_dir(dir_)
            for m in methods:
                result[m]['avgs'].append(res[m]['avg'])
                result[m]['maxs'].append(res[m]['max'])
                result[m]['feasibles'].append(res[m]['feasible'])
                
        avg_file = f'{args.outDir}/Average/{args.num}/SVR{svr}.csv'
        max_file = f'{args.outDir}/Maximum/{args.num}/SVR{svr}.csv'
        feasible_file = f'{args.outDir}/Feasible/{args.num}/SVR{svr}.csv'

        avg_df = {}
        max_df = {}
        feasible_df = {}

        for m in methods:
            avg_df[m] = pd.Series(result[m]['avgs'], index=s2_s1_ratio)
            max_df[m] = pd.Series(result[m]['maxs'], index=s2_s1_ratio)
            feasible_df[m] = pd.Series(result[m]['feasibles'], index=s2_s1_ratio)

        avg_df = pd.DataFrame(avg_df)
        max_df = pd.DataFrame(max_df)
        feasible_df = pd.DataFrame(feasible_df)

        avg_df.to_csv(avg_file)
        max_df.to_csv(max_file)
        feasible_df.to_csv(feasible_file)



    for s21_r in s2_s1_ratio:
        result = {}
        for m in methods:
            result[m] = {
                'avgs': [],
                'maxs': [],
                'feasibles': []
            }
        for svr in s_v_ratio:
            dir_ = f'{args.inDir}/{args.num}-{svr}-{s21_r}'
            res = statistic_dir(dir_)
            for m in methods:
                result[m]['avgs'].append(res[m]['avg'])
                result[m]['maxs'].append(res[m]['max'])
                result[m]['feasibles'].append(res[m]['feasible'])

        avg_file = f'{args.outDir}/Average/{args.num}/S21_R{s21_r}.csv'
        max_file = f'{args.outDir}/Maximum/{args.num}/S21_R{s21_r}.csv'
        feasible_file = f'{args.outDir}/Feasible/{args.num}/S21_R{s21_r}.csv'

        avg_df = {}
        max_df = {}
        feasible_df = {}

        for m in methods:
            avg_df[m] = pd.Series(result[m]['avgs'], index=s_v_ratio)
            max_df[m] = pd.Series(result[m]['maxs'], index=s_v_ratio)
            feasible_df[m] = pd.Series(result[m]['feasibles'], index=s_v_ratio)

        avg_df = pd.DataFrame(avg_df)
        max_df = pd.DataFrame(max_df)
        feasible_df = pd.DataFrame(feasible_df)

        avg_df.to_csv(avg_file)
        max_df.to_csv(max_file)
        feasible_df.to_csv(feasible_file)

def convert_multidir(args):
    methods = [
        'shortest_path', 
        'min_max_percentage',
        'least_used_capacity_percentage', 
        'least_conflict_value', 
        'ILP'
    ]
    suffix = [1, 2, 3, 4]
    # data = {"row_1": [3, 2, 1, 0], "row_2": ["a", "b", "c", "d"]}
    # pd.DataFrame.from_dict(data, orient="index", columns=["A", "B", "C", "D"])

    avg_df = {}
    max_df = {}
    feasible_df = {}

    
    for suf in suffix:
        s = f'{suf}'
        dir_ = args.prefix + s
        res = statistic_dir(dir_)
        avg_df[s] = []
        max_df[s] = []
        feasible_df[s] = []
        for m in methods:
            avg_df[s].append(res[m]['avg'])
            max_df[s].append(res[m]['max'])
            feasible_df[s].append(res[m]['feasible'])
    
    avg_df = pd.DataFrame.from_dict(avg_df, orient="index", columns=methods)
    max_df = pd.DataFrame.from_dict(max_df, orient="index", columns=methods)
    feasible_df = pd.DataFrame.from_dict(feasible_df, orient="index", columns=methods)
    print(avg_df)
    print(max_df)
    print(feasible_df)

    avg_df.to_csv(f'{args.outDir}/avg.csv')
    max_df.to_csv(f'{args.outDir}/max.csv')
    feasible_df.to_csv(f'{args.outDir}/feasible.csv')



if __name__ == "__main__":
    args = parse_args()
    # print(args.list)
    convert_multidir(args)
    # statistic_dir(args.inDir)