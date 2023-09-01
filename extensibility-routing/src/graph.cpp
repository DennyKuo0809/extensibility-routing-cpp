#include <queue>
#include <algorithm>
#include <string.h>
#include <iostream>
#include "../include/graph.hpp"

/* Constructor: sub-graph */
Graph::Graph(Graph& g, std::vector<int> nodes){
    vertex_num = g.vertex_num;
    capacity = g.capacity;
    adj_list = std::vector<std::vector<int> >(g.vertex_num, std::vector<int>());   
    node_list = nodes;
    
    for(int i = 0 ; i < nodes.size() ; i++ ){
        for(int j = 0 ; j < nodes.size() ; j ++){
            if(i != j && capacity[nodes[i]][nodes[j]] > 0){
                adj_list[nodes[i]].push_back(nodes[j]);
            }
        }
    }
}

/* API */
/* API: setter */
void Graph::set_vertex_num(int num){
    if(vertex_num == 0){
        /* Can only set once after constructed */
        vertex_num = num;
        adj_list = std::vector<std::vector<int> >(num, std::vector<int>());
        capacity = std::vector<std::vector<double> >(num, std::vector<double>(num, 0.0));
        for(int i = 0 ; i < vertex_num ; i ++) node_list.push_back(i);
    }
    else{
        std::cerr << "[INFO] Number of vertex is already been set, this action will be discarded." << std::endl;
    }
}
void Graph::set_neighbor(int src, int dst, double data_rate){
    adj_list[src].push_back(dst);
    capacity[src][dst] = data_rate;
}
void Graph::clear_neighbor(int src){
    for(int neighbor: adj_list[src]) capacity[src][neighbor] = 0;
    adj_list[src] = std::vector<int>();
}
void Graph::set_capacity(int src, int dst, double data_rate){
    capacity[src][dst] = data_rate;
}
void Graph::push_edge(int src, int dst, double cap){
    edge_list.push_back(Edge{src, dst, cap});
}

/* Member Function: About graph */
/* BFS to find shortest path in the network */
std::vector<int> Graph::shortest_path(int src, int dst, int data_rate){
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

/* DFS to find all path from src to dst in the network */
void Graph::dfs(int current, int dst, int dist, int data_rate, int* cur_path, bool* visited, std::vector<std::vector<int> >& path){
    // std::cerr << "(dfs) " << current << " " << dst << " " << dist << " " << data_rate << "\n";
    // for(int i = 0 ; i < vertex_num ; i ++){
    //     std::cerr << visited[i] << " ";
    // }
    // std::cerr << "\n";
    if(current == dst){
        cur_path[dist] = dst;
        path.push_back(std::vector<int>());
        int id = path.size() - 1;
        for(int i = 0 ; i < dist ; i ++){
            path[id].push_back(cur_path[i]);
            // if(i){
            //     capacity[cur_path[i-1]][cur_path[i]] -= data_rate;
            // }
        }
        std::cerr << "(dfs) found " << id << "-th path\n";
        return;
    }
    for(int i = 0 ; i < adj_list[current].size() ; i ++){
        if(!visited[adj_list[current][i]] && capacity[current][adj_list[current][i]] > data_rate){
            visited[adj_list[current][i]] = true;
            cur_path[dist] = adj_list[current][i];
            this -> dfs(adj_list[current][i], dst, dist+1, data_rate, cur_path, visited, path);
            visited[adj_list[current][i]] = false;
        }
    }
}
void Graph::all_path(int src, int dst, int data_rate, std::vector<std::vector<int> >& path){
    int* cur_path = new int[vertex_num];
    bool* visited = new bool[vertex_num];
    memset(cur_path, 0, sizeof(int)*vertex_num);
    memset(visited, 0, sizeof(bool)*vertex_num);
    cur_path[0] = src;
    visited[src] = true;
    dfs(src, dst, 1, data_rate, cur_path, visited, path);
    std::cerr << "dfs finish\n";
    delete[] cur_path;
    delete[] visited;
}

/* Dijkstra Algorithm */
std::vector<int> Graph::dijk(int src, std::vector<int> dst, int* cost){
    int INF = 2147483647;
    std::vector<int> dis(vertex_num, INF);
    std::vector<bool> included(vertex_num, false);
    std::vector<int> prev(vertex_num, -1);

    for(auto neighbor: adj_list[src]){
        dis[neighbor] = capacity[src][neighbor];
    }

    included[src] = true;
    for(int cnt = 1 ; cnt < vertex_num ; cnt ++){
        int min_dis = INF;
        int min_dis_node = -1;
        for(int node = 0 ; node < vertex_num - 1 ; node ++){
            if(!included[node] && dis[node] < min_dis){
                min_dis = dis[node];
                min_dis_node = node;
            }
        }
        if(min_dis_node < 0) break;
        included[min_dis_node] = true;

        for(int neighbor: adj_list[min_dis_node]){
            if(!included[neighbor] && dis[neighbor] > dis[min_dis_node] + capacity[min_dis_node][neighbor]){
                prev[neighbor] = min_dis_node;
                dis[neighbor] = dis[min_dis_node] + capacity[min_dis_node][neighbor];
            }
        }
    }
    int min_dis = INF;
    int min_dis_dst = -1;
    for(int d: dst){
        if(dis[d] < min_dis){
            min_dis = dis[d];
            min_dis_dst = d;
        }
    }

    std::vector<int> sol_path;
    int node = min_dis_dst;
    while(node != -1) {
        sol_path.push_back(node);
        node = prev[node];
    }
    std::reverse(sol_path.begin(), sol_path.end());
    *cost += min_dis;
    return sol_path;
}

std::vector<int> Graph::dijk_min_max_percentage(int src, int dst){
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


std::vector<int> Graph::dijk_least_conflict_value(int src, int dst, std::vector<std::vector<double> >& occupy){
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