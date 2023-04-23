#ifndef SOLUTION_HPP
#define SOLUTION_HPP
#include <iostream>
#include <vector>
#include <string>
#include "scenario.hpp"


class Solution{
private:
    Scenario scenario;

    std::vector<std::vector<int> > type1_path;
    bool type1_solved;
    std::string type1_method;

    std::vector<std::vector<int> > type2_path;
    bool type2_solved;


public:
    /* Constructor */
    Solution() = delete;
    Solution(Scenario S): 
        scenario{S}, type1_solved{false}, type2_solved{false}, type1_method{""} {}

    /* API */
    /* API: getter */
    std::vector<std::vector<int> > get_type1_path() const;

    /* API: caller */
    void solve_type1(std::string method);
    void solve_type2();

    /* Member Function: type-1 solver */
    void shortest_path();
    void least_used_capacity_percentage();
    void min_max_percentage();
    void least_conflict_value();
};

#endif
