#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include <numeric>
#include "../../include/solution.hpp"

/* API: getter */
std::vector<std::vector<int> > Solution::get_type1_path() const{
    return type1_path;
}

std::vector<std::vector<int> > Solution::get_type2_path() const{
    return type2_path;
}

std::vector<std::vector<int> > Solution::get_cycle_pool() const{
    return cycle_pool;
}

/* API: caller */
void Solution::solve_type1(std::string method){
    if(method == "shortest_path"){
        shortest_path();
    }
    else if(method == "least_used_capacity_percentage"){
        least_used_capacity_percentage();
    }
    else if(method == "min_max_percentage"){
        min_max_percentage();
    }
    else if(method == "least_conflict_value"){
        least_conflict_value();
    }

    if(type1_path.size() != 0){
        std::cerr << "[I] Solve type-1 by method \"" << method << "\" successfully." << std::endl;
        print2dvec("Type-1 solution", type1_path);
        type1_method = method;
        type1_solved = true;
    }
}

/* Member Function: type-1 solver */
void Solution::shortest_path(){
    type1_path = std::vector<std::vector<int> >();
    /* TODO: sort Type-1 streams by their data rate */
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        type1_path.push_back(e_graph.shortest_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate));
        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Warning] Fail to solve type-1 by the method \"Shortest Path\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
    }
}

// void Solution::enhanced_shortest_path(){
//     type1_path = std::vector<std::vector<int>>();
//     int n = scenario.Type_1.size();
//     std::vector<int> ord(n);
//     iota(ord.begin(), ord.end(), 0);
//     sort(ord.begin(), ord.end(), [&](int i, int j){
//         return scenario.Type_1[i].data_rate > scenario.Type_1[j].data_rate;
//     });

//     for (int _i = 0, i = ord[_i]; _i < n; _i++, i = ord[_i]){
//         type1_path.push_back(scenario.graph.shortest_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate));
//         if(type1_path[i].size() == 0){
//             /* Fail to solve type-1 streams */
//             std::cerr << "[W] Fail to solve type-1 by the method \"Enhanced Shortest Path\"." << std::endl;
//             type1_path = std::vector<std::vector<int> >();
//             return;
//         }
//     }
// }


void Solution::min_max_percentage(){
    // Find the path whose minimum weight edge has the biggest weight
    // Perform a transformed dijkstra algoritm
    for(int i = 0 ; i <  scenario.Type_1.size() ; i ++){
        type1_path.push_back(
            e_graph.prims_max_min_edge(
                scenario.Type_1[i].src, 
                scenario.Type_1[i].dst
            )
        );

        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[WARNING] Fail to solve type-1 by the method \"Min Max Percentage\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
    }
}

void Solution::least_conflict_value(){
    // Find the path who is least conflict with heuristic route of type-2 streams
    // Perform a transformed dijkstra algoritm

    std::vector<std::vector<double> > occupy(scenario.graph.get_vertex_num(), std::vector<double>(scenario.graph.get_vertex_num(), 0.0));

    /* Find shortest path for type-2 */
    for(int i = 0 ; i < scenario.Type_2.size() ; i ++){
        std::vector<int> path = e_graph.shortest_path(scenario.Type_2[i].src, scenario.Type_2[i].dst, scenario.Type_2[i].data_rate);
        if(path.size() == 0){
            /* Fail to solve type-2 streams */
            std::cerr << "[WARNING] (least conflct value) The type-2 streams are un-solvable by using shortest path." << std::endl;
            return;
        }
        for(int j = 0 ; j < path.size()-1 ; j ++){
            occupy[path[j]][path[j+1]] += scenario.Type_2[i].data_rate;
        }
    }

    for(int i = 0 ; i <  scenario.Type_1.size() ; i ++){
        type1_path.push_back(
            e_graph.dijk_least_conflict_value(
                scenario.Type_1[i].src, 
                scenario.Type_1[i].dst,
                occupy
            )
        );

        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[WARNING] Fail to solve type-1 by the method \"Min Max Percentage\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
    }
}


void Solution::least_used_capacity_percentage(){
    for(int i = 0 ; i <  scenario.Type_1.size() ; i ++){
        type1_path.push_back(std::vector<int>());
        e_graph.heuristic_search_max_avg(
            scenario.Type_1[i].src, 
            scenario.Type_1[i].dst,
            scenario.Type_1[i].data_rate,
            type1_path[i]
        );

        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[WARNING] Fail to solve type-1 by the method \"Least Used Capacity Percentage\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
    }
}