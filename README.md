# extensibility-routing-cpp


## Scenario

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
