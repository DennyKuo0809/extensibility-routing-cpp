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
std::vector<Edge> Graph::get_edge_list() const{
    return edge_list;
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
    std::cerr << "(dfs) " << current << " " << dst << " " << dist << " " << data_rate << "\n";
    for(int i = 0 ; i < vertex_num ; i ++){
        std::cerr << visited[i] << " ";
    }
    std::cerr << "\n";
    if(current == dst){
        cur_path[dist] = dst;
        path.push_back(std::vector<int>());
        int id = path.size() - 1;
        for(int i = 0 ; i < dist ; i ++){
            path[id].push_back(cur_path[i]);
        }
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
            if(dis[neighbor] > dis[min_dis_node] + capacity[min_dis_node][neighbor]){
                prev[neighbor] = min_dis_node;
                dis[neighbor] = dis[min_dis_node] + capacity[min_dis_node][neighbor];
            }
        }
    }
    int min_dis = INF;
    int min_dis_dst = -1;
    for(int d: dst){
        if(dis[d] < INF){
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