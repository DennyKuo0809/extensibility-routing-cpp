#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include <numeric>
#include "gurobi_c++.h"
#include "../../include/solution.hpp"


/* Member Function: ILP */
std::vector<std::vector<int>> Solution::ILP_routing_util(int vertex_cnt, std::vector<Edge> edge, std::vector<type_1> stream){
    int edge_cnt = edge.size(), total_stream_cnt = stream.size();
    
    try {
        // Set environment

        GRBEnv env = GRBEnv();
        GRBModel model = GRBModel(env);
        model.set(GRB_IntParam_OutputFlag, 0);
        std::vector<std::vector<GRBVar> > vars(total_stream_cnt, std::vector<GRBVar>(edge_cnt));

        // Add variables
        
        for (int i = 0; i < total_stream_cnt; i++){
            for (int j = 0; j < edge_cnt; j++){
                std::string var_name = "f_" + std::to_string(i) + "_" + std::to_string(j);
                vars[i][j] = model.addVar(0.0, 1.0, 0.0, GRB_BINARY, var_name);
            }
        }

        // Add constraints
        
        // For each edge, the sum of flow should not exceed its capacity.
        
        for (int i = 0; i < edge_cnt; i++){
            GRBLinExpr expr = 0;
            for (int j = 0; j < total_stream_cnt; j++){
                expr += stream[j].data_rate * vars[j][i];
            }
            std::string s = "E_" + std::to_string(i);
            model.addConstr(expr, GRB_LESS_EQUAL, edge[i].cap, s);
        }

        // For each vertex, the in - out degree of each type of flow should be correct.
        
        {
            std::vector<std::vector<GRBLinExpr> > expr(vertex_cnt, std::vector<GRBLinExpr>(total_stream_cnt));

            for (int i = 0; i < total_stream_cnt; i++){
                for (int j = 0; j < edge_cnt; j++){
                    int u = edge[j].src, v = edge[j].dst;
                    expr[u][i] += -1.0 * vars[i][j];
                    expr[v][i] += vars[i][j];
                }
            }

            for (int i = 0; i < vertex_cnt; i++){
                for (int j = 0; j < total_stream_cnt; j++){
                    model.addConstr(expr[i][j], GRB_EQUAL, (stream[j].dst == i ? 1 : 0) - (stream[j].src == i ? 1 : 0));
                }
            }
        }

        // Run solver
        
        model.optimize();

        // Restore ILP solution to the original problem

        std::vector<std::vector<int> > solution;
        for (int i = 0; i < total_stream_cnt; i++){
            std::vector<int> nxt(vertex_cnt);
            for (int j = 0; j < edge_cnt; j++){
                if (vars[i][j].get(GRB_DoubleAttr_X) > 0.5) {
                    nxt[edge[j].src] = edge[j].dst;
                }
            }

            std::vector<int> path;
            path.push_back(stream[i].src);

            while (path.back() != stream[i].dst)
                path.push_back(nxt[path.back()]);

            solution.push_back(path);
        }

        return solution;
    }
    catch (GRBException e) {
        if (e.getErrorCode() == GRB_ERROR_DATA_NOT_AVAILABLE){
            return std::vector<std::vector<int> >();
        }
        else {
            std::cerr << "Error code = " << e.getErrorCode() << std::endl;
            std::cerr << e.getMessage() << std::endl;
            return std::vector<std::vector<int> >();
        }
    }
    catch (...) {
        std::cerr << "Internal error during optimization" << std::endl;
        return std::vector<std::vector<int> >();
    }

    return std::vector<std::vector<int> >();
}

void Solution::ILP_routing(){
    int vertex_cnt = scenario.graph.get_vertex_num();
    std::vector<Edge> edge = scenario.graph.get_edge_list();

    std::function<std::vector<std::vector<int> >(double) > query = [&](double rho){
        std::vector<type_1> stream_collection = scenario.Type_1;
        for (auto& [src, dst, data_rate, Lambda] : scenario.Type_2){
            stream_collection.push_back({src, dst, data_rate * rho});
        }
        return ILP_routing_util(vertex_cnt, edge, stream_collection);
    };

    if (query(0).empty()){
        std::cerr << "[Info] (ILP) No solution\n";
    }
    else {
        double lo = 0, hi = 1e7;
        const double eps = 1e-7;
        while (hi - lo > eps){
            double mid = (lo + hi) / 2;
            (query(mid).empty() ? hi : lo) = mid;
        }
        std::vector<std::vector<int> > final_solution = query(lo);
        // std::cerr << final_solution;
        type1_path.assign(final_solution.begin(), final_solution.begin() + scenario.Type_1.size());
        // print2dvec("type1_path", type1_path);
        type2_path.assign(final_solution.begin() + scenario.Type_1.size(), final_solution.end());
    }
}