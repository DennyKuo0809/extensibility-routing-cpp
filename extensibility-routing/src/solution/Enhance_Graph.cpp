#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include <numeric>
#include <cstring>
#include "../../include/solution.hpp"


Enhance_Graph::Enhance_Graph(Graph g){
    vertex_num = g.get_vertex_num();
    adj_list = g.get_graph();
    capacity = g.get_cap_matrix();
    edge_list = g.get_edge_list();

    sorted_adj_list = g.get_graph();
    for(int node = 0 ; node < vertex_num ; node ++){
        std::sort(
            sorted_adj_list[node].begin(),
            sorted_adj_list[node].end(),
            [&](int n1, int n2){
                return capacity[node][n1] > capacity[node][n2];
            }
        );
    }

    std::sort(
        edge_list.begin(),
        edge_list.end(),
        [](Edge e1, Edge e2){
            return e1.cap > e2.cap;
        }
    );
    map2edgeidx = std::vector<std::vector<int> >(vertex_num, std::vector<int>(vertex_num, -1));
    for(int i = 0 ; i < edge_list.size() ; i ++){
        map2edgeidx[edge_list[i].src][edge_list[i].dst] = i; 
    }
    sorted_edge_prefix_sum.push_back(0.0);
    for(int i = 0 ; i < vertex_num ; i ++){
        sorted_edge_prefix_sum.push_back(sorted_edge_prefix_sum[i] + edge_list[i].cap);
    }
}



/* Member Function: About graph */
/* BFS to find shortest path in the network */
std::vector<int> Enhance_Graph::shortest_path(int src, int dst, int data_rate){
    std::vector<int> path;

    /* BFS */
    std::queue<int> q;
    std::vector<int> prev(vertex_num, -1);
    std::vector<bool> visited(vertex_num, false);

    q.push(src);
    visited[src] = true;

    bool found = false;
    while(!found && !q.empty()){
        int node = q.front();
        q.pop();
        for(int j = 0 ; j < adj_list[node].size() ; j ++){
            if(!visited[adj_list[node][j]] && capacity[node][adj_list[node][j]] > data_rate){
                visited[adj_list[node][j]] = true;
                q.push(adj_list[node][j]);
                prev[adj_list[node][j]] = node;

                if(adj_list[node][j] == dst){ 
                    found = true;
                    break;
                }
            }
        }
    }

    /* Construct Shortest Path */
    int node = dst;
    while(node >= 0){
        path.push_back(node);
        node = prev[node];
    }
    std::reverse(path.begin(), path.end());

    return (src == path[0])? path : std::vector<int>();
}


/* DFS to find path with maximum average weight from src to dst in the network */
void Enhance_Graph::heuristic_dfs_max_avg(int current, int dst, int dist, int sum, int data_rate, int* cur_path, bool* visited, std::vector<int>& path, std::vector<std::vector<double> >& max_sum){
    // std::cerr << "(heuristict dfs) " << current << " " << dst << " " << dist << " " << sum << "\n";
    // std::cerr << "(heuristict dfs) dist=" << dist  << "\n";

    if(current == dst){
        // std::cerr << "(New Path) " << sum << " / " << (dist-1) << "\n";
        double cap_sum = 0;
        if(sum / (dist-1) > max_avg){ /* Check if bigger average weight */
            std::cerr << "(update) " << sum << " / " << (dist-1) << "\n";
            max_avg_sum = sum;
            max_avg_len = dist - 1;
            max_avg = sum / (dist-1);
            cur_path[dist] = dst;
            path = std::vector<int>();
            path.push_back(cur_path[0]);
            for(int i = 1 ; i < dist ; i ++){
                path.push_back(cur_path[i]);
                cap_sum += capacity[cur_path[i-1]][cur_path[i]];
                if(cap_sum > max_sum[i][cur_path[i]]){
                    max_sum[i][cur_path[i]] = cap_sum;
                }
            }
        }
        else{
            double cap_sum = 0;
            for(int i = 1 ; i < dist ; i ++){
                cap_sum += capacity[cur_path[i-1]][cur_path[i]];
                if(cap_sum > max_sum[i][cur_path[i]]){
                    max_sum[i][cur_path[i]] = cap_sum;
                }
            }
        }
        return;
    }
    for(int neighbor: sorted_adj_list[current]){
        // if(dist < 30){
        //     std::cerr << "dfs on (layer) " << dist << " (node) " << neighbor << "\n";
        // }
        if(!visited[neighbor] && capacity[current][neighbor] > data_rate){
            /* Cut */
#ifdef HEURISTIC_CUT
            if(max_avg_sum > 0 && neighbor != dst){
                int s = sum + capacity[current][neighbor];
                if(s < max_sum[dist][neighbor]){
                    // std::cerr <<  "(No." << this -> num_cut << ") CUT at dist " <<  dist << "\n";
                    this -> num_cut ++;
                    break;
                }
                bool cut = true;
                // int depth = std::min(vertex_num - dist, 2);
                for(int d = 1 ; d < vertex_num - dist ; d ++){
                    if(s + sorted_edge_prefix_sum[d] > max_avg * (dist + d)){
                        cut = false;
                        break;
                    }
                }
                if(cut) {
                    // std::cerr <<  "(No." << this -> num_cut << ") CUT at dist " <<  dist << "\n";
                    this -> num_cut ++;
                    break;
                }
            }
#endif            
            visited[neighbor] = true;
            cur_path[dist] = neighbor;
            heuristic_dfs_max_avg(neighbor, dst, dist+1, sum + capacity[current][neighbor], data_rate, cur_path, visited, path, max_sum);
            visited[neighbor] = false;
        }
    }
}
void Enhance_Graph::heuristic_search_max_avg(int src, int dst, int data_rate, std::vector<int>& path){
    /* Initialize */
    int* cur_path = new int[vertex_num];
    bool* visited = new bool[vertex_num];
    std::vector<std::vector<double> > max_sum(vertex_num, std::vector<double>(vertex_num, 0));
    memset(cur_path, 0, sizeof(int)*vertex_num);
    memset(visited, 0, sizeof(bool)*vertex_num);
    cur_path[0] = src;
    visited[src] = true;

    /* Call dfs */
    std::cerr << "(heuristict search) " << src << " " << dst <<  "\n";
    heuristic_dfs_max_avg(src, dst, 1, 0.0, data_rate, cur_path, visited, path, max_sum);
    std::cerr << "(heuristict search) Finish with " << this -> num_cut << " cut\n";

    /* Reset */
    this -> max_avg_len = 1;
    this -> max_avg_sum = 0.0;
    this -> max_avg = 0.0;
    this -> num_cut = 0;
    delete[] cur_path;
    delete[] visited;
}


std::vector<int> Enhance_Graph::prims_max_min_edge(int src, int dst){
    // Find the path whose minimum weight edge has the biggest weight
    std::set<int> candidates;
    std::vector<double> min_weight(vertex_num, -1);
    std::vector<int> prev(vertex_num, -1);
    std::vector<bool> included(vertex_num, false);
    min_weight[src] = 1e7;
    included[src] = true;

    for(int cnt = 1 ; cnt < vertex_num; cnt ++){
        /* Find the next vertex to be included */
        double max_min_cap = 0;
        Edge max_min_edge = {-1, -1, -1};
        for(int v = 0 ; v < vertex_num ; v ++){
            if(included[v]){
                for(auto neighbor: adj_list[v]){
                    if(!included[neighbor]){
                        int m = std::min(min_weight[v], capacity[v][neighbor]);
                        if(m > max_min_cap) {
                            max_min_cap = m;
                            max_min_edge = {v, neighbor, capacity[v][neighbor]};
                        }
                    }
                }
            }
        }
        /* Add the vertex */
        int new_vertex = max_min_edge.dst;
        included[new_vertex] = true;
        min_weight[new_vertex] = max_min_cap;
        prev[new_vertex] = max_min_edge.src;
        if(new_vertex == dst) break;
    }
    std::cout << "\n";

    /* Reconstruct the path */
    std::vector<int> sol_path;
    int node = dst;
    while(node != -1) {
        sol_path.push_back(node);
        node = prev[node];
    }
    std::reverse(sol_path.begin(), sol_path.end());
    return sol_path;
}

// std::vector<int> Enhance_Graph::prims_max_min_edge(int src, int dst){
//     // Find the path whose minimum weight edge has the biggest weight
//     std::vector<double> min_weight(vertex_num, -1);
//     std::vector<bool> included(vertex_num, false);
//     std::vector<int> prev(vertex_num, -1);

//     for(auto neighbor: adj_list[src]){
//         min_weight[neighbor] = capacity[src][neighbor];
//         prev[neighbor] = src;
//     }

//     included[src] = true;

//     for(int cnt = 1 ; cnt < vertex_num ; cnt ++){
//         int max_min_weight = -1;
//         int new_node = -1;
//         for(int node = 0 ; node < vertex_num ; node ++){
//             if(!included[node] && min_weight[node] > max_min_weight){
//                 max_min_weight = min_weight[node];
//                 new_node = node;
//             }
//         }
//         if(new_node < 0 || new_node == dst) break;
//         included[new_node] = true;

//         for(int neighbor: adj_list[new_node]){
//             if(!included[neighbor]){
//                 int new_min_weight = std::min(capacity[new_node][neighbor], min_weight[new_node]);
//                 if(min_weight[neighbor] < 0 || new_min_weight > min_weight[neighbor]){
//                     min_weight[neighbor] = new_min_weight;
//                     prev[neighbor] = new_node;
//                 }
//             }
//         }
//     }

//     /* Reconstruct the path */
//     std::vector<int> sol_path;
//     int node = dst;
//     while(node != -1) {
//         sol_path.push_back(node);
//         node = prev[node];
//     }
//     std::reverse(sol_path.begin(), sol_path.end());
//     return sol_path;
// }


std::vector<int> Enhance_Graph::dijk_least_conflict_value(int src, int dst, std::vector<std::vector<double> >& occupy){
    // Find the path whose minimum weight edge has the biggest weight
    const int INF = 2147483647;
    std::vector<double> min_conflict(vertex_num, INF);
    std::vector<bool> included(vertex_num, false);
    std::vector<int> prev(vertex_num, -1);

    for(auto neighbor: adj_list[src]){
        min_conflict[neighbor] = occupy[src][neighbor];
        prev[neighbor] = src;
    }

    included[src] = true;

    for(int cnt = 1 ; cnt < vertex_num ; cnt ++){
        int min_conflict_v = INF;
        int new_node = -1;
        for(int node = 0 ; node < vertex_num ; node ++){
            if(!included[node] && min_conflict[node] < min_conflict_v){
                min_conflict_v = min_conflict[node];
                new_node = node;
            }
        }
        if(new_node < 0 || new_node == dst) break;
        included[new_node] = true;

        for(int neighbor: adj_list[new_node]){
            if(!included[neighbor] && min_conflict[neighbor] > min_conflict[new_node] + occupy[new_node][neighbor]){
                prev[neighbor] = new_node;
                min_conflict[neighbor] = min_conflict[new_node] + occupy[new_node][neighbor];
            }
        }
    }

    /* Reconstruct the path */
    std::vector<int> sol_path;
    int node = dst;
    while(node != -1) {
        sol_path.push_back(node);
        node = prev[node];
    }
    std::reverse(sol_path.begin(), sol_path.end());
    return sol_path;
}