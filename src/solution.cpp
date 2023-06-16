#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include "../include/solution.hpp"
// void printvec(std::vector<int> vec){
//     // for(int i = 0 ; i < vec.size() ; i ++){
//     //     std::cout << vec[i] << " ";
//     // }
//     // std::cout << "\n";
// }

void print2dvec(std::string name, std::vector<std::vector<int> > vec){
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

/* API */
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

/* API: setter */
void Solution::set_type1_path(std::vector<std::vector<int> > t1_path){
    if(!type1_solved && type2_solved){
        type1_path = t1_path;
        type1_solved = true;
    }
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
void Solution::solve_type2(){
    /* Remove the capacity which occupy by type-1 streams */
    for(int i = 0 ; i < type1_path.size() ; i ++){
        for(int j = 0 ; j < type1_path[i].size() - 1 ; j ++){
            double new_cap = scenario.graph.get_capacity(type1_path[i][j], type1_path[i][j+1]) - scenario.Type_1[i].data_rate;
            scenario.graph.set_capacity(type1_path[i][j], type1_path[i][j+1], new_cap);
        }
    }
    
    /* Construct cycle pool */
    Circuit_finding Cf(scenario.graph);
    Cf.johnson();
    cycle_pool = Cf.get_cycle_pool();
    std::cerr << "[I] Construction of cycle pool completed.\n" << std::flush;
    print2dvec("Cycle Pool", cycle_pool);

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

/* Member Function: type-1 solver */
void Solution::shortest_path(){
    type1_path = std::vector<std::vector<int> >();
    for(int i = 0 ; i < scenario.Type_1.size() ; i ++){
        type1_path.push_back(scenario.graph.shortest_path(scenario.Type_1[i].src, scenario.Type_1[i].dst, scenario.Type_1[i].data_rate));
        if(type1_path[i].size() == 0){
            /* Fail to solve type-1 streams */
            std::cerr << "[W] Fail to solve type-1 by the method \"Shortest Path\"." << std::endl;
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
            std::cerr << "[W] Fail to solve type-1 by the method \"Least Used Capacity Percentage\"." << std::endl;
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
            std::cerr << "[W] Fail to solve type-1 by the method \"Min Max Percentage\"." << std::endl;
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
            std::cerr << "[W] (least conflct value) The type-2 streams are un-solvable by using shortest path." << std::endl;
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
            std::cerr << "[W] Fail to solve type-1 by the method \"Least Conflict Value\"." << std::endl;
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


/* Member Function: type-2 utilization */
void Solution::greedy_merge(int start){
    std::vector<int> curr; /* Current cycle being merged */
    std::set<int> curr_set = cycle_set[start]; /* nodes have been covered */
    std::set<int> uncover; /* nodes have not been covered */

    curr.push_back(start);
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
    int vertex_num = scenario.graph.get_vertex_num();
    std::vector<int> reverse_map_(vertex_num, 0);
    for(int i = 0 ; i < vertex_num ; i ++) reverse_map_[i] = i;
    
    // print2dvec("cycle_pool", cycle_pool);
    // print2dvec("result", result);
    int min_cost = 2147483647;
    int min_cost_result = 0;
    for(int i = 0 ; i < result.size() ; i ++){
        /***********************************************************************
        * Construct a new graph.
        *   1. Duplicate the nodes that occur in multiple cycle.
        *   2. Capacity of edges between the duplicated node set to ?(maybe 10)
        *   3. Capacity of edges between the 
        ************************************************************************/

        /* Copy the cycles */
        std::vector<std::vector<int> > CP;
        for(int j = 0 ; j < result[i].size() ; j ++) CP.push_back(cycle_pool[result[i][j]]);
        // std::cout << "CP.size() "  << CP.size() << "\n";
        // print2dvec("CP", CP);
        
        /* New graph */
        Graph g = Graph();

        /* Calculate the number of duplicate nodes */
        std::vector<int> freq(vertex_num, 0);
        std::vector<int> reverse_map = reverse_map_;
        std::vector< std::vector<int> > dup(vertex_num, std::vector<int>());
        int total_vertex_num = vertex_num;

        for(int j = 0 ; j < CP.size() ; j ++){
            for(int nid = 0 ; nid < CP[j].size() ; nid ++){
                int node = CP[j][nid];
                freq[node] ++;
                if(freq[node] > 1){
                    dup[node].push_back(total_vertex_num); 
                    reverse_map.push_back(node);
                    CP[j][nid] = total_vertex_num;
                    total_vertex_num ++;
                }
                else{
                    dup[node].push_back(node);
                }
            }
        }
        // print2dvec("dup", dup);
        /* Set new graph */
        g.set_vertex_num(total_vertex_num+1);

        /* Duplicated nodes formed complete graph */
        for(int node = 0 ; node < vertex_num ; node ++){
            for(int i = 0 ; i < dup[node].size() ; i ++){
                for(int j = i+1 ; j < dup[node].size() ; j ++){
                    g.set_neighbor(dup[node][i], dup[node][j], 100);
                }
            }
        }

        /* The edge in cycles */
        for(int j = 0 ; j < CP.size() ; j ++){
            for(int nid = 0 ; nid < CP[j].size() - 1 ; nid ++){
                g.set_neighbor(CP[j][nid], CP[j][nid+1], 1);
            }
            g.set_neighbor(CP[j][CP[j].size() - 1], CP[j][0], 1);
        }

        /***********************************************************************
         *  Shortest Path Routing
         *      Using Dijkstra
         ***********************************************************************/
        int cost = 0;
        std::vector<std::vector<int> > sol_path;
        for(auto stream: scenario.Type_2){
            g.clear_neighbor(total_vertex_num);
            for(auto d: dup[stream.src]) g.set_neighbor(total_vertex_num, d, 0.01);
            std::vector<int> tmp = g.dijk(total_vertex_num, dup[stream.dst], &cost);
            for(int e = 0 ; e < tmp.size() ; e ++){
                if(tmp[e] >= total_vertex_num) tmp[e] = reverse_map[tmp[e]];
            }
            sol_path.push_back(tmp);
            // printvec(tmp);
        }
        if(cost < min_cost){
            min_cost = cost;
            min_cost_result = i;
            type2_path = std::vector<std::vector<int> >();
            for(int ns = 0 ; ns < sol_path.size() ; ns ++){
                type2_path.push_back(std::vector<int> ());
                for(int nn = 0 ; nn < sol_path[ns].size() ; nn ++){
                    int no = sol_path[ns][nn];
                    if(no >= vertex_num) no = reverse_map[no];
                    if(nn == 0 || no != type2_path[ns][nn-1]){
                        type2_path[ns].push_back(no);
                    }
                }
            }
        }
    }

    std::cerr << "[I] Cycle Selection completed. Type-2 solution is ready.\n";
    print2dvec("Type-2 solution", type2_path);
}

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
            int hop_cnt = shortest_path_routing[i].size()-1;
            double total_cap = 0.0;
            for(int j = 0 ; j < shortest_path_routing[i].size()-1 ; j ++){
                total_cap += scenario.graph.get_capacity(shortest_path_routing[i][j], shortest_path_routing[i][j+1]);
            }
            os << hop_cnt << " " << total_cap << "\n";
        }
    }
}