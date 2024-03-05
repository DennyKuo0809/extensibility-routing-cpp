#ifndef SOLUTION_HPP
#define SOLUTION_HPP
#include <iostream>
#include <vector>
#include <unordered_map>
#include <string>
#include <map>
#include <set>
#include "scenario.hpp"
#include "johnson.hpp"

class Solution;
class Enhance_Graph: public Graph {
private:
    int vertex_num;
    std::vector<std::vector<int> > adj_list;
    std::vector<std::vector<double> > capacity;
    std::vector<Edge> edge_list;

    std::vector<std::vector<int> > sorted_adj_list;
    std::vector<double> sorted_edge_prefix_sum;
    std::vector<std::vector<int> > map2edgeidx;
    int max_avg_len = 1;
    double max_avg_sum = 0.0;
    double max_avg = 0.0;
    int num_cut = 0;

public:
    /* Constructor */
    Enhance_Graph() = delete;
    Enhance_Graph(Graph g);

    /* BFS to find shortest path in the network */
    std::vector<int> shortest_path(int src, int dst, int data_rate);

    /* DFS to find all path from src to dst in the network */
    void heuristic_dfs_max_avg(int current, int dst, int dist, int sum, int data_rate, int* cur_path, bool* visited, std::vector<int>& path, std::vector<std::vector<double> >& max_sum);
    void heuristic_search_max_avg(int src, int dst, int data_rate, std::vector<int>& path);


    /* For Type-1 solution */
    std::vector<int> prims_max_min_edge(int src, int dst);
    std::vector<int> dijk_least_conflict_value(int src, int dst, std::vector<std::vector<double> >& occupy);
    
    
    friend class Solution;
};


struct mergeCandidate{
    int group1;
    int group2;
    std::vector<int> cycle;
    int newServe = 0;
};

class Solution{
private:
    Scenario scenario;
    Enhance_Graph e_graph;

    /* Type-1 */
    std::vector<std::vector<int> > type1_path;
    bool type1_solved;
    std::string type1_method;

    /* Type-2 */
    std::vector<std::vector<int> > type2_path;
    bool type2_solved;

    std::vector<int> group;
    std::map<int, std::vector<int> > members;
    std::map<int, std::vector<int> > serveStreams;
    std::map<int, std::vector<int> > cycles;
    std::map<int, int> numFail;
    std::vector<mergeCandidate> mergeResult;

    /* Shortest path -- for analysis */
    std::vector<std::vector<int> > shortest_path_routing;

    /* About cycle */
    std::vector<std::vector<int> > cycle_pool;
    std::vector<std::set<int> > cycle_set;

    std::vector<std::vector<int> > result;
    std::set<int> full_set;

public:
    /* Constructor */
    Solution() = delete;
    Solution(Scenario S): 
        scenario{S}, 
        type1_solved{false}, 
        type2_solved{false}, 
        type1_method{""},
        e_graph{S.graph} {}

    /* API */
    /* API: getter */
    std::vector<std::vector<int> > get_type1_path() const;
    std::vector<std::vector<int> > get_type2_path() const;
    std::vector<std::vector<int> > get_cycle_pool() const;
    
    /* API: setter */
    void set_type1_path(std::vector<std::vector<int> > t1_path);

    /* API: caller */
    void solve_type1(std::string method);
    void solve_type2(int trim);
    void perform_shortest_path();

    /* Member Function: type-1 solver */
    void shortest_path();
    void least_used_capacity_percentage();
    void min_max_percentage();
    void least_conflict_value();

    /* Member Function: type-2 utilization */
    void Grouping();
    void Merging();
    void greedy_merge(int start);
    void cycle_selection();

    /* Member Function: ILP */
    std::vector<std::vector<int>> ILP_routing_util(int vertex_cnt, std::vector<Edge> edge, std::vector<type_1> stream);
    void ILP_routing();

    /* Util */
    void print2dvec(std::string name, std::vector<std::vector<int> > vec);

    /* IO */
    friend std::ostream& operator<< (std::ostream& os, Solution& sol);
    void output_shortest_path(std::ostream& os);
};

#endif
