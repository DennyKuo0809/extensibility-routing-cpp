# extensibility-routing-cpp

## Platfrom
* Ubuntu 20.04

## 3rd Party Library
This project is based on [gurobi](https://www.gurobi.com/).
* Install gurobi and get your license
    * Refer to [this video](https://www.youtube.com/watch?v=yNmeG6Wom1o&ab_channel=GurobiOptimization)

## Build and Compile
* To find gurobi
    * Set enviroment variable
    ```
    # Do not just copy this command.
    export GUROBI_HOME={gurobi_root_directory}/linux64
    ```
    * Cmake to find it.
    ```
    cmake -H. -Bbuild
    ```
* Building
```
cmake --build build
```
* Get the executable
```
cp build/solver ./
```

## Usage
The simulation part employ omnet++ and INET framework.
Specify `do_sim`, `omnet_dir`, `inet_dir` and `sim_dir` if you want to do the simulation.
* **NOTE**
    1. `sim_dir` is the directory where to place your simulation input file.
    2. `sim_dir` should be a sub-direrctory of `inet_dir`
    3. option for `-m`
        * `shortest_path`
        * `min_max_percentage`
        * `least_used_capacity_percentage`
        * `least_conflict_value`
        * `simplex`

#### Command
```bash=
bash run.sh \
-s [input file of scenario] \
-o [path to output directory] \
-m [Routing method] \
--omnet_dir [Path to omnet directory] \
--inet_dir  [Path to inet directory] \
--sim_dir   [Path to simulation directory] \
--do_sim
```

#### Output directory
```bash=
.
├── sim-conf
│   ├── shortest-{stream type}-{stream id}.ini
│   ├── ...
│   ├── shortest-{stream type}-{stream id}.ini
│   ├── {type-1 method}.ini
│   ├── ...
│   └── {type-1 method}.ini
├── result
│   ├── shortest-{stream type}-{stream id}.csv
│   ├── ...
│   ├── shortest-{stream type}-{stream id}.csv
│   ├── {type-1 method}.csv
│   ├── ...
│   └── {type-1 method}.csv
├── route
│   ├── {type-1 method}.txt
│   ├── ...
│   └── {type-1 method}.txt
├── info
│   ├── shortest_path.txt
│   ├── module_stream_{type-1 method}.pickle
│   ├── ...
│   └── module_stream_{type-1 method}.pickle
├── log
└── scenario.ned
```


## About simulation
1. Download [Omnet++](https://omnetpp.org/download/)
2. Download and install [INET](https://inet.omnetpp.org/Installation.html)
3. Create a simulation directory under INET root directory

## TODO
* simulation generator module name
* demo
* clean up