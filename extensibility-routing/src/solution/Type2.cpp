#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include <numeric>
#include "../../include/solution.hpp"

/* API: caller */
void Solution::solve_type2(int trim){
    /* Remove the capacity which occupy by type-1 streams */
    for(int i = 0 ; i < type1_path.size() ; i ++){
        for(int j = 0 ; j < type1_path[i].size() - 1 ; j ++){
            double new_cap = scenario.graph.get_capacity(type1_path[i][j], type1_path[i][j+1]) - scenario.Type_1[i].data_rate;
            scenario.graph.set_capacity(type1_path[i][j], type1_path[i][j+1], new_cap);
        }
    }
    
    /* Construct cycle pool */
    Circuit_finding Cf(scenario.graph, trim);
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
    print2dvec("result", result);
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

        /* Duplicated nodes forme a complete graph */
        for(int node = 0 ; node < vertex_num ; node ++){
            for(int i = 0 ; i < dup[node].size() ; i ++){
                for(int j = i+1 ; j < dup[node].size() ; j ++){
                    g.set_neighbor(dup[node][i], dup[node][j], 100);
                    g.set_neighbor(dup[node][j], dup[node][i], 100);
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
        bool fail = false;
        int path_len = 0;
        std::vector<std::vector<int> > sol_path;
        for(auto stream: scenario.Type_2){
            g.clear_neighbor(total_vertex_num);
            for(auto d: dup[stream.src]) g.set_neighbor(total_vertex_num, d, 0.01);
            std::vector<int> tmp = g.dijk(total_vertex_num, dup[stream.dst], &cost);
            path_len = tmp.size();
            if(path_len == 0){
                fail = true;
                break;
            }
            for(int e = 0 ; e < path_len ; e ++){
                if(tmp[e] >= total_vertex_num) tmp[e] = reverse_map[tmp[e]];
            }
            sol_path.push_back(tmp);
            // printvec(tmp);
        }
        if(!fail && cost < min_cost){
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
