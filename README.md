# extensibility-routing-cpp


## Scenario
#### Data structure and API
* [detail](https://github.com/DennyKuo0809/extensibility-routing-cpp/tree/main/include#readme)
#### Simple demo
* Use the testcase file `input/demo.in`
* Create demo.cpp
```cpp=
#include <iostream>
#include "include/scenario.hpp"

int main(){
  Scenario S;
  cin >> S;
  cout << S;
}
```
* compile
```sh=
g++ -std=c++11 demo.cpp src/scenario.cpp -o scenario_demo
```
* run
```sh=
./scenario_ < input/demo.in
```

## Solution
#### Data structure and API
* [detail](https://github.com/DennyKuo0809/extensibility-routing-cpp/tree/main/include#readme)
#### Usage
* Create main.cpp
```cpp=
#include <iostream>
#include "include/scenario.hpp"
#include "include/solution.hpp"

int main(){
  Scenario S;
  std::cin >> S;
  Solution solver(S);
  
  solver.solve_type1("shortest_path");
  std::vector<std::vector<int> > type1_solution = solver.get_type1_path();
  ...
}
```
* compile
```sh=
g++ -std=c++11 main.cpp src/scenario.cpp src/solution.cpp -o solver
```
* run
```sh=
./solver < [input file]
```
