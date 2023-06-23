# extensibility-routing-cpp


## Scenario
#### Data structure and API
* [detail](https://github.com/DennyKuo0809/extensibility-routing-cpp/tree/main/include#readme)

#### Usage
```bash=
bash run.sh \
-s [input file of scenario] \
-o [path to output directory] \
-m [(Optional) Method for type-1 routing]
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
├── route
│   ├── {type-1 method}.txt
│   ├── ...
│   └── {type-1 method}.txt
├── info
│   ├── shortest_path.txt
│   └── module_stream.pickle
├── log
└── scenario.ned
```

#### Demo
```bash=
bash run.sh \
-s input/demo.in \
-o output/ \
-m shortest_path
```

