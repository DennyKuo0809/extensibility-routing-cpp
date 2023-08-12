#ifndef SCENARIO_HPP
#define SCENARIO_HPP
#include <iostream>
#include <vector>
#include "graph.hpp"


struct type_2{
    int src;
    int dst;
    double data_rate;
    double Lambda;
    type_2(int _src, int _dst, double _data_rate, double _Lambda): src(_src), dst(_dst), data_rate(_data_rate), Lambda(_Lambda) {}
};

struct type_1{
    int src;
    int dst;
    double data_rate;
    type_1(int _src, int _dst, double _data_rate): src(_src), dst(_dst), data_rate(_data_rate) {}
    type_1(type_2 s): src(s.src), dst(s.dst), data_rate(s.data_rate) {}
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
