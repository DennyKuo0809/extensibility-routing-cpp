#ifndef SCENARIO_HPP
#define SCENARIO_HPP
#include <iostream>
#include <vector>
#include "graph.hpp"

struct type_1{
    int src;
    int dst;
    double data_rate;
};

struct type_2{
    int src;
    int dst;
    double data_rate;
    double Lambda;
};


class Solution;
class Scenario{
private:
    Graph graph;
    std::vector<type_1> Type_1;
    std::vector<type_2> Type_2;

public:
    /* Constructor */
    Scenario() {}

    /* API */
    /* API: setter */
    void add_type_1(int src, int dst, double data_rate);
    void add_type_2(int src, int dst, double data_rate, double Lambda);

    /* API: getter */
    std::vector<type_1> get_type_1() const;
    std::vector<type_2> get_type_2() const;
    Graph get_graph() const;

    /* IO */
    friend std::istream& operator>> (std::istream& is, Scenario& S);
    friend std::ostream& operator<< (std::ostream& os, Scenario& S);

    friend class Solution;
};

#endif
