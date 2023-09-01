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

// /* DFS to find all path from src to dst in the network */
// void Enhance_Graph::dfs(int current, int dst, int dist, int data_rate, int* cur_path, bool* visited, std::vector<std::vector<int> >& path){
//     if(current == dst){
//         cur_path[dist] = dst;
//         path.push_back(std::vector<int>());
//         int id = path.size() - 1;
//         for(int i = 0 ; i < dist ; i ++){
//             path[id].push_back(cur_path[i]);
//         }
//         std::cerr << "(dfs) found " << id << "-th path\n";
//         return;
//     }
//     for(int i = 0 ; i < adj_list[current].size() ; i ++){
//         if(!visited[adj_list[current][i]] && capacity[current][adj_list[current][i]] > data_rate){
//             visited[adj_list[current][i]] = true;
//             cur_path[dist] = adj_list[current][i];
//             this -> dfs(adj_list[current][i], dst, dist+1, data_rate, cur_path, visited, path);
//             visited[adj_list[current][i]] = false;
//         }
//     }
// }
// void Enhance_Graph::all_path(int src, int dst, int data_rate, std::vector<std::vector<int> >& path){
//     int* cur_path = new int[vertex_num];
//     bool* visited = new bool[vertex_num];
//     memset(cur_path, 0, sizeof(int)*vertex_num);
//     memset(visited, 0, sizeof(bool)*vertex_num);
//     cur_path[0] = src;
//     visited[src] = true;
//     dfs(src, dst, 1, data_rate, cur_path, visited, path);
//     std::cerr << "dfs finish\n";
//     delete[] cur_path;
//     delete[] visited;
// }


/* DFS to find path with maximum average weight from src to dst in the network */
void Enhance_Graph::heuristic_dfs_max_avg(int current, int dst, int dist, int sum, int data_rate, int* cur_path, bool* visited, std::vector<int>& path){
    if(current == dst){
        if(sum / (dist-1) > max_avg_sum / max_avg_len){ /* Check if bigger average weight */
            max_avg_sum = sum;
            max_avg_len = dist - 1;
            cur_path[dist] = dst;
            for(int i = 0 ; i < dist ; i ++){
                path.push_back(cur_path[i]);
            }
        }
        return;
    }
    for(int neighbor: sorted_adj_list[current]){
        if(!visited[neighbor] && capacity[current][neighbor] > data_rate){
            /* Cut */
#ifdef HEURISTIC_CUT
            if(sum + capacity[current][neighbor] + sorted_edge_prefix_sum[max_avg_len-dist] < max_avg_sum){
                break;
            }
#endif            
            visited[neighbor] = true;
            cur_path[dist] = neighbor;
            heuristic_dfs_max_avg(neighbor, dst, dist+1, sum + capacity[current][neighbor], data_rate, cur_path, visited, path);
            visited[neighbor] = false;
        }
    }
}
void Enhance_Graph::heuristic_search_max_avg(int src, int dst, int data_rate, std::vector<int>& path){
    int* cur_path = new int[vertex_num];
    bool* visited = new bool[vertex_num];
    memset(cur_path, 0, sizeof(int)*vertex_num);
    memset(visited, 0, sizeof(bool)*vertex_num);
    cur_path[0] = src;
    visited[src] = true;
    heuristic_dfs_max_avg(src, dst, 1, 0.0, data_rate, cur_path, visited, path);
    std::cerr << "dfs finish\n";
    delete[] cur_path;
    delete[] visited;
}

std::vector<int> Enhance_Graph::dijk_min_max_percentage(int src, int dst){
    // Find the path whose minimum weight edge has the biggest weight
    std::vector<double> min_weight(vertex_num, -1);
    std::vector<bool> included(vertex_num, false);
    std::vector<int> prev(vertex_num, -1);

    for(auto neighbor: adj_list[src]){
        min_weight[neighbor] = capacity[src][neighbor];
        prev[neighbor] = src;
    }

    included[src] = true;

    for(int cnt = 1 ; cnt < vertex_num ; cnt ++){
        int max_min_weight = -1;
        int new_node = -1;
        for(int node = 0 ; node < vertex_num ; node ++){
            if(!included[node] && min_weight[node] > max_min_weight){
                max_min_weight = min_weight[node];
                new_node = node;
            }
        }
        if(new_node < 0 || new_node == dst) break;
        included[new_node] = true;

        for(int neighbor: adj_list[new_node]){
            if(!included[neighbor]){
                int new_min_weight = std::min(capacity[new_node][neighbor], min_weight[new_node]);
                if(min_weight[neighbor] < 0 || new_min_weight > min_weight[neighbor]){
                    min_weight[neighbor] = new_min_weight;
                    prev[neighbor] = new_node;
                }
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