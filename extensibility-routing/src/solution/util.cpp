#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include <numeric>
#include "../../include/solution.hpp"

void Solution::print2dvec(std::string name, std::vector<std::vector<int> > vec){
    std::cerr << "[I] " << name << "\n";
    for(int i = 0 ; i < vec.size() ; i ++){
        std::cerr << "\t{" << i << "} ";
        if(vec[i].size()){
            std::cerr << vec[i][0];
        }
        for(int j = 1 ; j < vec[i].size() ; j ++){
            std::cerr << " --> " << vec[i][j];
        }
        if(name == "Cycle Pool"){
            std::cerr << " --> " << vec[i][0];
        }
        std::cerr << "\n";
    }
}

/* API: setter */
void Solution::set_type1_path(std::vector<std::vector<int> > t1_path){
    if(!type1_solved && type2_solved){
        type1_path = t1_path;
        type1_solved = true;
    }
}

void Solution::perform_shortest_path(){
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        shortest_path_routing.push_back( 
            scenario.graph.shortest_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate)
        );
    }
    for(int i = 0 ; i < scenario.Type_2.size() ; i ++){
        shortest_path_routing.push_back( 
            scenario.graph.shortest_path(scenario.Type_2[i].src, scenario.Type_2[i].dst, scenario.Type_2[i].data_rate)
        );
    }
}

/* IO */
std::ostream& operator<< (std::ostream& os, Solution& sol){
    if(/*sol.type1_path.size() && sol.type2_path.size()*/ true){
        os << sol.type1_path.size() << "\n";
        for(int i = 0 ; i < sol.type1_path.size() ; i ++){
            for(int j = 0 ; j < sol.type1_path[i].size() ; j ++){
                os << sol.type1_path[i][j] << " ";
            }
            os << "\n";
        }
        os << sol.type2_path.size() << "\n";
        for(int i = 0 ; i < sol.type2_path.size() ; i ++){
            for(int j = 0 ; j < sol.type2_path[i].size() ; j ++){
                os << sol.type2_path[i][j] << " ";
            }
            os << "\n";
        }
    }
    return os;
}
void Solution::output_shortest_path(std::ostream& os){
    if(shortest_path_routing.size()){
        for(int i = 0 ; i < shortest_path_routing.size() ; i ++){
            int stream_type = (i < scenario.Type_1.size())? 1: 2;
            int stream_id = (i < scenario.Type_1.size())? i: i-scenario.Type_1.size();

            int hop_cnt = shortest_path_routing[i].size()-1;
            double total_cap = 0.0;
            for(int j = 0 ; j < shortest_path_routing[i].size()-1 ; j ++){
                total_cap += scenario.graph.get_capacity(shortest_path_routing[i][j], shortest_path_routing[i][j+1]);
            }
            os << stream_type << " " << stream_id << " " << hop_cnt << " " << total_cap;

            for(int j = 0 ; j < shortest_path_routing[i].size() ; j ++){
                os << " " << shortest_path_routing[i][j];
            }

            os << "\n";
        }
    }
}
