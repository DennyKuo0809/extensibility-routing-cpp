#ifndef SCENARIO_CPP
#define SCENARIO_CPP
#include <queue>
#include <stack>
#include <algorithm>
#include "../include/scenario.hpp"

/* Setter */
void Scenario::add_type_1(int src, int dst, double data_rate){
    Type_1.push_back(type_1{src, dst, data_rate});
}

void Scenario::add_type_2(int src, int dst, double data_rate, double Lambda){
    Type_2.push_back(type_2{src, dst, data_rate, Lambda});
}

/* Getter */
std::vector<type_1> Scenario::get_type_1() const{
    return Type_1;
}

std::vector<type_2> Scenario::get_type_2() const{
    return Type_2;
}

Graph Scenario::get_graph() const{
    return graph;
}

/* IO */
std::istream& operator>> (std::istream& is, Scenario& S){
    int n, out_degree, v;
    double c;

    is >> n;
    /* Initialize adj list + adj matrix */
    S.graph.set_vertex_num(n);
    
    /* Load grpah */
    for(int i = 0 ; i < n ; i ++){
        is >> out_degree;
        for(int j = 0 ; j < out_degree ; j ++){
            is >> v;
            is >> c;
            S.graph.set_neighbor(i, v, c);
        }
    }

    int T1, T2, s, d;
    double r, l;
    
    /* Type-1 streams */
    is >> T1;
    for(int i = 0 ; i < T1 ; i ++){
        is >> s >> d >> r;
        S.add_type_1(s, d, r);
    }

    /* Type-1 streams */
    is >> T2;
    for(int i = 0 ; i < T2 ; i ++){
        is >> s >> d >> r >> l;
        S.add_type_2(s, d, r, l);
    }

    return is;
}

std::ostream& operator<< (std::ostream& os, Scenario& S){
    int n = S.graph.get_vertex_num();

    os << "Number of Nodes: " << n << std::endl;
    for(int i = 0 ; i < n ; i ++){
        os << "From vertex " << i << " ";

        std::vector<int> neighbors = S.graph.get_neighbor(i);
        for(int j = 0 ; j < neighbors.size() ; j ++){
            os << "(" << neighbors[j] << ", " << S.graph.get_capacity(i, neighbors[j]) << ") ";
        }
        os << std::endl;
    }

    std::vector<type_1> t1 = S.get_type_1();
    for(int i = 0 ; i < t1.size() ; i ++){
        os << "[Type-1] from " << t1[i].src << " to " << t1[i].dst << "(data rate = " << t1[i].data_rate << ")" << std::endl;
    }

    std::vector<type_2> t2 = S.get_type_2();
    for(int i = 0 ; i < t2.size() ; i ++){
        os << "[Type-2] from " << t2[i].src << " to " << t2[i].dst << "(data rate = " << t2[i].data_rate << ", lambda = " << t2[i].Lambda << ")" << std::endl;
    }
    return os;
}

#endif
