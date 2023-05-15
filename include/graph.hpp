#ifndef GRAPH_HPP
#define GRAPH_HPP
#include <vector>

class SCC;
class Circuit_finding;
class Graph{
private:
    int vertex_num;
    std::vector<int> node_list;
    std::vector<std::vector<int> > adj_list;
    std::vector<std::vector<double> > capacity;

public:
    /* Constructor: new graph */
    Graph(): vertex_num{0} {}

    /* Constructor: sub-graph */
    Graph(Graph& g, std::vector<int> nodes); 

    /* API */
    /* API: setter */
    void set_vertex_num(int num);
    void set_neighbor(int src, int dst, double data_rate);
    void clear_neighbor(int src);
    void set_capacity(int src, int dst, double data_rate);

    /* API: getter */
    int get_vertex_num() const;
    std::vector<int> get_neighbor(int index) const; 
    double get_capacity(int src, int dst) const;
    std::vector<std::vector<int> > get_graph() const; // return copy of adj_list

    /* Member Function: About graph */
    /* BFS to find shortest path in the network */
    std::vector<int> shortest_path(int src, int dst, int data_rate);

    /* DFS to find all path from src to dst in the network */
    void dfs(int current, int dst, int dist, int data_rate, int* cur_path, bool* visited, std::vector<std::vector<int> >& path);
    void all_path(int src, int dst, int data_rate, std::vector<std::vector<int> >& path);

    /* Dijkstra Algorithm */
    std::vector<int> dijk(int src, std::vector<int> dst);

    friend class SCC;
    friend class Circuit_finding;
};
#endif