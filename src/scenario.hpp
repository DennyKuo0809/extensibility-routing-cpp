#ifndef SCENARIO_HPP
#define SCENARIO_HPP
#include <iostream>
#include <vector>

struct type_1{
    int src;
    int dst;
    double data_rate;
};

struct type_2{
    int src;
    int dst;
    double data_rate;
    double Lambda;
};



class Scenario{
private:
    int vertex_num;
    std::vector<std::vector<int> > adj_list;
    std::vector<std::vector<double> > capacity;
    std::vector<type_1> Type_1;
    std::vector<type_2> Type_2;

public:
    /* Constructor */
    Scenario() {}

    /* API */
    void psuh_adj_list(); 
    void push_capacity();

    /* API: setter */
    void set_vertex_num(int num);
    void set_neighbor(int src, int dst, int data_rate);
    void set_capacity(int src, int dst, int data_rate);
    void add_type_1(int src, int dst, double data_rate);
    void add_type_2(int src, int dst, double data_rate, double Lambda);

    /* API: getter */
    int get_vertex_num() const;
    std::vector<int> get_neighbor(int index) const; 
    double get_capacity(int src, int dst) const;
    std::vector<std::vector<int> > get_graph() const; // return copy of adj_list
    std::vector<type_1> get_type_1() const;
    std::vector<type_2> get_type_2() const;

    /* IO */
    friend std::istream& operator>> (std::istream& is, Scenario& S);
    friend std::ostream& operator<< (std::ostream& os, Scenario& S);
};

#endif
