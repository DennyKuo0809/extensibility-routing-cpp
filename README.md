# extensibility-routing-cpp


## Scenario
#### Data structure and API
* [detail](https://github.com/DennyKuo0809/extensibility-routing-cpp/tree/main/include#readme)
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
