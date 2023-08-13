# extensibility routing

### Platform
* ubuntu 20.04

### Gurobi
This project is based on gurobi.
* Install gurobi and get license
    * Refer to [this video](https://www.youtube.com/watch?v=yNmeG6Wom1o&ab_channel=GurobiOptimization)
    * Remember to set the enviroment parameter `$GUROBI_HOME`

### Compiling
* Cmake to link gurobi
`cmake -H. -Bbuild`
* Build
`cmake --build build`
