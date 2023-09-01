#ifndef GRAPH_HPP
#define GRAPH_HPP
#include <vector>
#include <algorithm>

struct Edge{
    int src, dst;
    double cap;
};

class SCC;
class Circuit_finding;
class Graph{
private:
    int vertex_num;
    std::vector<int> node_list;
    std::vector<std::vector<int> > adj_list;
    std::vector<std::vector<double> > capacity;
    std::vector<Edge> edge_list;

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
    void push_edge(int src, int dst, double cap);


    /* API: getter */
    int get_vertex_num() const;
    std::vector<int> get_neighbor(int index) const;
    double get_capacity(int src, int dst) const;
    std::vector<std::vector<int> > get_graph() const;
    std::vector<std::vector<double> > get_cap_matrix() const;
    std::vector<Edge> get_edge_list() const;

    /* Dijkstra Algorithm with Multiple Desitination */
    /* For Type-2 routing */
    /* Find the path with minimum cost */
    std::vector<int> multi_dst_dijk(int src, std::vector<int> dst, int* cost);

    friend class SCC;
    friend class Circuit_finding;
};
#endif