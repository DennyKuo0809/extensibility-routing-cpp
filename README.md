# extensibility-routing-cpp


## Scenario
#### Data structure
* `std::vector<std::vector<int> > adj_list`
  * 2d vector
  * Adjencency list
* `std::vector<std::vector<double> > capacity`
  * 2d vector (Matrix)
  * capacity of edges
* `std::vector<type_1> Type_1`
  * type_1 詳見 `src/scenario.hpp`
  * All type-1 streams
* `std::vector<type_2> Type_2`
  * type-2 詳見 `src/scenario.hpp`
  * All type-2 streams

#### API
* `get_vertex_num()`
  * 回傳 vertex 個數 (`int`)
* `get_neighbor(int index)` 
  * 回傳 node `index` 的所有 neighbor (`vector<int>`)
* `get_capacity(int src, int dst)`
  * 回傳 edge `src` $\to$ `dst` 的 capacity (`double`)
* `get_graph()`
  * 回傳 adjancency list (`vector<vector<int> >`)
* `get_type_1()`
  * 回傳 type-1 的所有 streams (`vector<type_1>`)
* `get_type_2()`
  * 回傳 type-2 的所有 streams (`vector<type_2>`)


#### Simple demo
* Use the testcase file `input/demo.in`
* Create demo.cpp
```cpp=
#include <iostream>
#include "src/scenario.hpp"

int main(){
  Scenario S;
  cin >> S;
  cout << S;
}
```
* compile
```sh=
g++ demo.cpp src/scenario.cpp -o scenario_demo
```
* run
```sh=
./scenario_ < input/demo.in
```
