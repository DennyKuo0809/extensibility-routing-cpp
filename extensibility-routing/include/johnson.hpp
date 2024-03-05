#ifndef JOHNSON_HPP
#define JOHNSON_HPP
#include <stack>
#include <iostream>
#include "graph.hpp"


class Circuit_finding{
private:
    Graph origin_graph;
    Graph graph;

    int Source;
    std::vector<int> stack_;
    std::vector<bool> blocked;
    std::vector<std::vector<int> > B;

    double trim_factor = 0.0;
    int backtrack = -1;
    bool startup_backtrack = false;

    // std::vector<std::vector<int> > cycle_pool;
    std::vector<int> cycle_pool;

public:
    Circuit_finding() = delete;
    Circuit_finding(Graph g, double trim): origin_graph{g}, graph{g}, trim_factor{trim} {
        int n = g.vertex_num;
        Source = 0;
        blocked = std::vector<bool>(n, false);
        B = std::vector<std::vector<int> >(n, std::vector<int>());
    }

    void unblock(int node);
    bool circuit(int node);
    void johnson();
    // std::vector<std::vector<int> > get_cycle_pool(){
    //     return cycle_pool;
    // }
    std::vector<int> get_cycle_pool(){
        return cycle_pool;
    }
};

/* Tarjan's Algorithm to find Stronly Connected Component*/
class SCC{
private:
    Graph graph;
    int Time;
    std::vector<int> low_value;
    std::vector<int> discover_time;
    std::stack<int> stack_;
    std::vector<bool> in_stack;
    std::vector<std::vector<int> > SCCs;
public:
    SCC() = delete;
    SCC(Graph& g): graph{g} {
        int n = g.get_vertex_num();
        low_value = std::vector<int>(n, -1);
        discover_time = std::vector<int>(n, -1);
        in_stack = std::vector<bool>(n, false);
        SCCs = std::vector<std::vector<int> >();
        Time = 0;
    }
    
    void dfs(int node);
    void tarjan();
    std::vector<std::vector<int> > get_scc() const{
        return SCCs;
    }
};

#endif
