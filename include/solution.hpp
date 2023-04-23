#ifndef SOLUTION_HPP
#define SOLUTION_HPP
#include <iostream>
#include <vector>
#include <string>
#include "scenario.hpp"


class Solution{
private:
    Scenario scenario;

public:
    /* Constructor */
    Solution() = delete;
    Solution(Scenario S): scenario{S} {}

    /* API */
    // void avaiable_method();

    /* API: caller */
    std::vector<std::vector<int> > type1_solver(std::string method);
    std::vector<std::vector<int> > type2_solver();

    /* Member Function: solver */
    std::vector<std::vector<int> > shortest_path();
    std::vector<std::vector<int> > least_used_capacity_percentage();
    std::vector<std::vector<int> > min_max_percentage();
    std::vector<std::vector<int> > least_conflict_value();
};

#endif
