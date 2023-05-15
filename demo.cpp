#include "include/solution.hpp"


int main(){
    /* Scenario */
    Scenario scenario;
    std::cin >> scenario;
    // std::cout << scenario;

    /* Solution */
    Solution solution(scenario);
    solution.solve_type1("least_conflict_value");
    // std::vector<std::vector<int> > type1_path = solution.get_type1_path();
    solution.solve_type2();
    // std::vector<std::vector<int> > type2_path = solution.get_type2_path();
    
}

