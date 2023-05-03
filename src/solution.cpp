#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include "../include/solution.hpp"


std::vector<std::vector<int> > Solution::get_type1_path() const{
    return type1_path;
}


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
        std::cerr << "[Info] Solve type-1 by method \"" << method << "\" successfully." << std::endl;
        type1_method = method;
        type1_solved = true;
    }
}

void Solution::shortest_path(){
    type1_path = std::vector<std::vector<int> >();
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        type1_path.push_back(scenario.graph.shortest_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate));
        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Info] Fail to solve type-1 by the method \"Shortest Path\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
    }
}

void Solution::least_used_capacity_percentage(){
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        std::vector<std::vector<int> > all_path;
        scenario.graph.all_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate, all_path);
        if(all_path.size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Info] Fail to solve type-1 by the method \"Least Used Capacity Percentage\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
        double least_p = 1.0;
        int least_id = 0;
        for(int j = 0 ; j < all_path.size() ; j ++){
            double total_capacity = 0.0;
            for(int k = 0 ; k < all_path[j].size()-1 ; k ++){
                total_capacity += scenario.graph.get_capacity(all_path[j][k], all_path[j][k+1]);
            }
            if(scenario.Type_1[i].data_rate * (all_path[j].size() - 1) / total_capacity < least_p){
                least_p = scenario.Type_1[i].data_rate * (double)(all_path[j].size() - 1) / total_capacity;
                least_id = j;
            }
        }
        type1_path.push_back(all_path[least_id]);
    }
}

void Solution::min_max_percentage(){
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        std::vector<std::vector<int> > all_path;
        scenario.graph.all_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate, all_path);
        if(all_path.size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Info] Fail to solve type-1 by the method \"Min Max Percentage\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
        double least_p = 1.0;
        int least_id = 0;
        for(int j = 0 ; j < all_path.size() ; j ++){
            double least_capacity = scenario.graph.get_capacity(all_path[j][0], all_path[j][1]);
            for(int k = 1 ; k < all_path[j].size()-1 ; k ++){
                least_capacity = std::min(least_capacity, scenario.graph.get_capacity(all_path[j][k], all_path[j][k+1]));
            }
            if(scenario.Type_1[i].data_rate * (all_path[j].size() - 1) / least_capacity < least_p){
                least_p = scenario.Type_1[i].data_rate * (double)(all_path[j].size() - 1) / least_capacity;
                least_id = j;
            }
        }
        type1_path.push_back(all_path[least_id]);
    }
}

void Solution::least_conflict_value(){
    std::vector<std::vector<double> > occupy(scenario.graph.get_vertex_num(), std::vector<double>(scenario.graph.get_vertex_num(), 0.0));

    /* Find shortest path for type-2 */
    for(int i = 0 ; i < scenario.Type_2.size() ; i ++){
        std::vector<int> path = scenario.graph.shortest_path(scenario.Type_2[i].src, scenario.Type_2[i].dst, scenario.Type_2[i].data_rate);
        if(path.size() == 0){
            /* Fail to solve type-2 streams */
            std::cerr << "[Info] The type-2 streams are un-solvable." << std::endl;
            return;
        }
        for(int j = 0 ; j < path.size()-1 ; j ++){
            occupy[path[j]][path[j+1]] += scenario.Type_2[i].data_rate;
        }
    }

    /* Find path for type-1 */
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        std::vector<std::vector<int> > all_path;
        scenario.graph.all_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate, all_path);
        if(all_path.size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Info] Fail to solve type-1 by the method \"Least Conflict Value\"." << std::endl;
            type1_path =  std::vector<std::vector<int> >();
        }
        double least_c = 0.0;
        int least_id = 0;
        for(int j = 0 ; j < all_path.size() ; j ++){
            double total_conflict = 0.0;
            for(int k = 0 ; k < all_path[j].size()-1 ; k ++){
                total_conflict += occupy[all_path[j][k]][all_path[j][k+1]];
            }
            if(j == 0){
                least_c = total_conflict;
            }
            else if(total_conflict < least_c){
                least_c = total_conflict;
                least_id = j;
            }
        }
        type1_path.push_back(all_path[least_id]);
    }
}


void Solution::solve_type2(){
    /* Remove the capacity which occupy by type-1 streams */

    
    /* Construct cycle pool */
    Circuit_finding Cf(scenario.graph);
    Cf.johnson();
    cycle_pool = Cf.get_cycle_pool();

    /* Cycle Merge */
    for(int i = 0 ; i < cycle_pool.size() ; i ++){
        cycle_set.push_back(std::set<int>(cycle_pool[i].begin(), cycle_pool[i].end()));
    }

    for(int i = 0 ; i < scenario.graph.get_vertex_num() ; i ++){
        full_set.insert(i);
    }

    for(int start = 0 ; start < cycle_pool.size() ; start ++){
        greedy_merge(start);
    }
    
    /* Cycle Seclection */
    cycle_selection();

}


void Solution::greedy_merge(int start){
    std::vector<int> curr = cycle_pool[start]; /* Current cycle being merged */
    std::set<int> curr_set = cycle_set[start]; /* nodes have been covered */
    std::set<int> uncover; /* nodes have not been covered */

    std::set_difference(full_set.begin(), full_set.end(),
                        cycle_set[start].begin(), cycle_set[start].end(),
                        std::inserter(uncover, uncover.begin()));

    while(uncover.size()){
        /* select the cycle that contains the most uncover nodes */
        int max_uncover_num = 0;
        int repeat_node_num = -1;
        int repeat_node_id = -1;
        int max_uncover_id = start;
        
        for(int i = start + 1 ; i < cycle_pool.size() ; i ++){
            /* Check whether the cycle contains uncovered nodes */
            std::set<int> has_uncover;
            std::set_intersection(uncover.begin(), uncover.end(), cycle_set[i].begin(), cycle_set[i].end(), std::inserter(has_uncover, has_uncover.begin()));
            if(!has_uncover.size()) continue;

            /* Check whether the cycle contains coverd nodes (for orbit transition) */
            std::set<int> has_intersect;
            std::set_intersection(curr_set.begin(), curr_set.end(), cycle_set[i].begin(), cycle_set[i].end(), std::inserter(has_intersect, has_intersect.begin()));
            if(!has_intersect.size()) continue;

            /* Select the cycle which contains more uncovered nodes and less covered nodes */
            if(int(has_uncover.size()) > max_uncover_num || (int(has_uncover.size()) == max_uncover_num && has_intersect.size() < repeat_node_num)){
                max_uncover_num = has_uncover.size();
                repeat_node_num = has_intersect.size();
                repeat_node_id = *(has_intersect.begin());
                max_uncover_id = i;
            }
        }
        
        if(max_uncover_num > 0){
            std::set_union(curr_set.begin(), curr_set.end(), cycle_set[max_uncover_id].begin(), cycle_set[max_uncover_id].end(), std::inserter(curr_set, curr_set.begin()));
            std::set<int> uncover_tmp;
            std::set_difference(uncover.begin(), uncover.end(), cycle_set[max_uncover_id].begin(), cycle_set[max_uncover_id].end(), std::inserter(uncover_tmp, uncover_tmp.begin())); 
            uncover = uncover_tmp;

            
            curr.push_back(max_uncover_id);
            for(int i = 0 ; i < curr.size() - 1 ; i ++){

            }
        }
        else{
            break;
        }
    }

    if(!uncover.size()) { /* Cover all nodes */
        result.push_back(curr);
    }
}

void Solution::cycle_selection(){
    /******************************************************************
     * To minimize:
     *  1. Total/Average number of orbit transition of type-2 streams
     *  2. Total/Average length of routing path of type-2 streams
     ******************************************************************/

    // for(int i = 0 ; i < result.size() ; i ++){
    //     int total_transition = 0;
    //     int total_length = 0;
    //     /* Route every type-2 streams */
    //     for(auto stream: scenario.Type_2){
    //         stream.src;
    //         stream.dst;
    //     }
    // }
}