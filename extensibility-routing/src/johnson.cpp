#include <algorithm>
#include "../include/johnson.hpp"

void SCC::dfs(int node){
    low_value[node] = node;
    discover_time[node] = Time;
    Time ++;
    stack_.push(node);
    in_stack[node] = true;

    for(int i = 0 ; i < graph.adj_list[node].size() ; i ++){
        int neighbor = graph.adj_list[node][i];
        if(discover_time[neighbor] < 0){
            dfs(neighbor);
            low_value[node] = std::min(low_value[node], low_value[neighbor]);
        }
        else if(in_stack[neighbor]){
            low_value[node] = std::min(low_value[node], discover_time[neighbor]);
        }
    }

    /* Found SCC which contains {node} */
    if(low_value[node] == discover_time[node]){
        SCCs.push_back(std::vector<int>());
        int v = -1;
        int id = SCCs.size() - 1;
        while(v != node){
            v = stack_.top();
            stack_.pop();
            in_stack[v] = false;
            SCCs[id].push_back(v);
        }
    }
}

void SCC::tarjan(){
    for(int i = 0 ; i < graph.node_list.size() ; i++){
        if(discover_time[graph.node_list[i]] < 0){
            dfs(graph.node_list[i]);
        }
    }
}


void Circuit_finding::unblock(int node){
    blocked[node] = false;
    while(B[node].size()){
        int w = B[node].back();
        B[node].pop_back();
        if(blocked[w]){
            unblock(w);
        }
    }
}

bool Circuit_finding::circuit(int node){
    // std::cerr << node << " ";
    bool f = false;
    stack_.push_back(node);
    blocked[node] = true;

    for(int w: graph.adj_list[node]){
    // for(int i = 0 ; i < graph.adj_list[node].size() ; i++){
    //     int w = graph.adj_list[node][i];
        if(w == Source){
            /* Found a circuit */
            // std::cerr << "Found";
            if(stack_.size() > cycle_pool.size()){
                cycle_pool = stack_;
            }
            f = true;
        }
        else if(!blocked[w]){
            if(circuit(w)){
                f = true;
            }
        }
    }

    if(f) unblock(node);
    else{
        for(int w: graph.adj_list[node]){
            std::vector<int>::iterator it = std::find(B[w].begin(), B[w].end(), node);
            if(it == B[w].end()){
                B[w].push_back(node);
            }
        }
    }

    stack_.pop_back();
    return f;
}

void Circuit_finding::johnson(){
    std::vector<int> nodes;
    for(int i = 0 ; i < origin_graph.vertex_num ; i ++) nodes.push_back(i);

    while(Source < origin_graph.vertex_num){
        graph = Graph(origin_graph, nodes);

        SCC scc(graph);
        scc.tarjan();
        std::vector<std::vector<int> > sccs = scc.get_scc();

        if(sccs.size()){
            Source = *(min_element(sccs[0].begin(), sccs[0].end()));
            stack_ = std::vector<int>();
            for(int node = Source ; node < graph.vertex_num ; node ++){
                blocked[node] = false;
                B[node] = std::vector<int>();
            }
            circuit(Source);
            nodes.erase(nodes.begin());
            Source ++;
        }
        else{
            Source = graph.vertex_num;
        }
    }
}