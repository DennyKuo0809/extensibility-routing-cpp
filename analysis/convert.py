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
            'stream-cnt': 0,
            'solve-cnt': 0
        }

    for i in range(50):
        try:
            file_name = f'{dir}/{i}.csv'
            df = pd.read_csv(file_name)
            for m in methods:
                if m in df.columns:
                    data_list = list(df[m])
                    unsolve_cnt = 0
                    for d in data_list:
                        avg, maxi, cnt = [float(v) for v in d.split(' / ')]
                        # print(avg, maxi, cnt)
                        if avg > 5 or maxi > 5 or avg < 0 or maxi < 0:
                            unsolve_cnt += 1
                        else:
                            tmp[m]['package-cnt'] += cnt
                            tmp[m]['total-delay'] += cnt * avg
                            tmp[m]['max-delay'] = max(tmp[m]['max-delay'], maxi)
                        
                    tmp[m]['stream-cnt'] += len(data_list)
                    tmp[m]['solve-cnt'] += len(data_list) - unsolve_cnt
                        
        except FileNotFoundError:
            pass
    
    for m in methods:
        res[m]['avg'] = tmp[m]['total-delay'] / tmp[m]['package-cnt'] if tmp[m]['package-cnt'] != 0 else -1
        res[m]['max'] = tmp[m]['max-delay']
        res[m]['feasible'] =  tmp[m]['solve-cnt'] / tmp[m]['stream-cnt'] if tmp[m]['stream-cnt'] != 0 else -1

    print(res)
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







if __name__ == "__main__":
    args = parse_args()
    convert(args)
    # statistic_dir(args.dir)