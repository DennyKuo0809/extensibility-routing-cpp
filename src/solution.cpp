#include <vector>
#include <string>
#include <queue>
#include <algorithm>
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
    std::vector<type_1> streams = scenario.get_type_1();
    type1_path = std::vector<std::vector<int> >();
    for(int i = 0 ; i < streams.size() ; i ++){
        type1_path.push_back(scenario.shortest_path(streams[i].src, streams[i].dst, streams[i].data_rate));
        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Info] Fail to solve type-1 by the method \"Shortest Path\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
    }
}

void Solution::least_used_capacity_percentage(){
    std::vector<type_1> streams = scenario.get_type_1();

    for(int i = 0 ; i < streams.size() ; i ++){
        std::vector<std::vector<int> > all_path;
        scenario.all_path(streams[i].src, streams[i].dst, streams[i].data_rate, all_path);
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
                total_capacity += scenario.get_capacity(all_path[j][k], all_path[j][k+1]);
            }
            if(streams[i].data_rate * (all_path[j].size() - 1) / total_capacity < least_p){
                least_p = streams[i].data_rate * (double)(all_path[j].size() - 1) / total_capacity;
                least_id = j;
            }
        }
        type1_path.push_back(all_path[least_id]);
    }
}

void Solution::min_max_percentage(){
    std::vector<type_1> streams = scenario.get_type_1();

    for(int i = 0 ; i < streams.size() ; i ++){
        std::vector<std::vector<int> > all_path;
        scenario.all_path(streams[i].src, streams[i].dst, streams[i].data_rate, all_path);
        if(all_path.size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[Info] Fail to solve type-1 by the method \"Min Max Percentage\"." << std::endl;
            type1_path = std::vector<std::vector<int> >();
            return;
        }
        double least_p = 1.0;
        int least_id = 0;
        for(int j = 0 ; j < all_path.size() ; j ++){
            double least_capacity = scenario.get_capacity(all_path[j][0], all_path[j][1]);
            for(int k = 1 ; k < all_path[j].size()-1 ; k ++){
                least_capacity = std::min(least_capacity, scenario.get_capacity(all_path[j][k], all_path[j][k+1]));
            }
            if(streams[i].data_rate * (all_path[j].size() - 1) / least_capacity < least_p){
                least_p = streams[i].data_rate * (double)(all_path[j].size() - 1) / least_capacity;
                least_id = j;
            }
        }
        type1_path.push_back(all_path[least_id]);
    }
}

void Solution::least_conflict_value(){
    std::vector<type_1> Type_1 = scenario.get_type_1();
    std::vector<type_2> Type_2 = scenario.get_type_2();

    std::vector<std::vector<double> > occupy(scenario.get_vertex_num(), std::vector<double>(scenario.get_vertex_num(), 0.0));

    /* Find shortest path for type-2 */
    for(int i = 0 ; i < Type_2.size() ; i ++){
        std::vector<int> path = scenario.shortest_path(Type_2[i].src, Type_2[i].dst, Type_2[i].data_rate);
        if(path.size() == 0){
            /* Fail to solve type-2 streams */
            std::cerr << "[Info] The type-2 streams are un-solvable." << std::endl;
            return;
        }
        for(int j = 0 ; j < path.size()-1 ; j ++){
            occupy[path[j]][path[j+1]] += Type_2[i].data_rate;
        }
    }

    /* Find path for type-1 */
    for(int i = 0 ; i < Type_1.size() ; i ++){
        std::vector<std::vector<int> > all_path;
        scenario.all_path(Type_1[i].src, Type_1[i].dst, Type_1[i].data_rate, all_path);
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
