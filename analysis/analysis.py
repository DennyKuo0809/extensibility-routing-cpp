import pandas as pd
import pickle
import re

input_file = 'output/demo.csv'
info_file = 'output/demo.info'

def d_from_s(str_):
    return re.findall(r'\d+', str_)[0]

def parse_csv():
    data = pd.read_csv(input_file)
    vector_data = data[data['type'] == 'vector']
    module_names = list(vector_data['module'])
    modules = [d_from_s(n.split('.')[1])+'-'+d_from_s(n.split('.')[2]) for n in module_names]
    
    vecvalues = list(vector_data['vecvalue'])
    vecvalues = [[float(i) for i in l.split()] for l in vecvalues]

    vecs = {}
    for m, vecv in zip(modules, vecvalues):
        vecs[m] = vecv
    return vecs

def main():
    delays = parse_csv()
    with open(info_file, 'rb') as f:
        info = pickle.load(f)
    print(info)
    print(delays)

if __name__ == "__main__":
    main()
