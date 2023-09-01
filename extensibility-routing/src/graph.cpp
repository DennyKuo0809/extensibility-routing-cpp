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


/* API: getter */
int Graph::get_vertex_num() const{
    return vertex_num;
}
std::vector<int> Graph::get_neighbor(int index) const{
    return adj_list[index];
}
double Graph::get_capacity(int src, int dst) const{
    return capacity[src][dst];
}
std::vector<std::vector<int> > Graph::get_graph() const{
    return adj_list;
}
std::vector<std::vector<double> > Graph::get_cap_matrix() const{
    return capacity;
}
std::vector<Edge> Graph::get_edge_list() const{
    return edge_list;
}

/* Dijkstra Algorithm with Multiple Desitination */
/* For Type-2 routing */
/* Find the path with minimum cost */
std::vector<int> Graph::multi_dst_dijk(int src, std::vector<int> dst, int* cost){
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