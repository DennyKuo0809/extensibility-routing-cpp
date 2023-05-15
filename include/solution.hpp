#ifndef SOLUTION_HPP
#define SOLUTION_HPP
#include <iostream>
#include <vector>
#include <unordered_map>
#include <string>
#include <set>
#include "scenario.hpp"
#include "johnson.hpp"

class Solution{
private:
    Scenario scenario;

    std::vector<std::vector<int> > type1_path;
    bool type1_solved;
    std::string type1_method;

    std::vector<std::vector<int> > type2_path;
    bool type2_solved;

    /* About cycle */
    std::vector<std::vector<int> > cycle_pool;
    std::vector<std::set<int> > cycle_set;

    std::vector<std::vector<int> > result;
    std::set<int> full_set;

public:
    /* Constructor */
    Solution() = delete;
    Solution(Scenario S): 
        scenario{S}, type1_solved{false}, type2_solved{false}, type1_method{""} {}

    /* API */
    /* API: getter */
    std::vector<std::vector<int> > get_type1_path() const;
    std::vector<std::vector<int> > get_type2_path() const;
    std::vector<std::vector<int> > get_cycle_pool() const;
    
    /* API: setter */
    void set_type1_path(std::vector<std::vector<int> > t1_path);

    /* API: caller */
    void solve_type1(std::string method);
    void solve_type2();

    /* Member Function: type-1 solver */
    void shortest_path();
    void least_used_capacity_percentage();
    void min_max_percentage();
    void least_conflict_value();

    /* Member Function: type-2 utilization */
    void greedy_merge(int start);
    void cycle_selection();
};

#endif
