#include <vector>
#include <string>
#include <queue>
#include <algorithm>
#include <set>
#include <map>
#include <numeric>
#include <queue>
#include "../../include/solution.hpp"

#define SIZE_CONSTRAINT 10

std::vector<int> parent;
std::vector<int> size;

int find(int a){
    if(parent[a] == a) return a;
    return parent[a] = find(parent[a]);
}

void merge(int a, int b){
    int pa = find(a), pb = find(b);
    if(size[pa] >= size[pb]){
        size[pa] += size[pb];
        parent[pb] = pa;
    }
    else{
        size[pb] += size[pa];
        parent[pa] = pb;
    }
}

std::vector<int> largestCycle(Graph& originalGraph, std::vector<int>& nodes){
    Graph graph = Graph(originalGraph, nodes);
    Circuit_finding Cf(graph, 0);
    Cf.johnson();
    return Cf.get_cycle_pool();
}


void Solution::Grouping(){
    /****************************************
     * Grouping the vertices by the streams 
     * Union-find
     ****************************************/
    int numVertex = scenario.graph.get_vertex_num();
    
    for(int i = 0 ; i < numVertex ; i ++){
        parent.push_back(i);
        size.push_back(1);
    }

    /* Merge by source and destination of streams */
    for(int i = 0 ; i < scenario.Type_2.size() ; i ++){
        int src = scenario.Type_2[i].src, dst = scenario.Type_2[i].dst;
        int p_src = find(src), p_dst = find(dst);
        if(p_src != p_dst && size[p_src] + size[p_dst] <= SIZE_CONSTRAINT){
            merge(src, dst);
            int p_src= find(src);
            if(serveStreams.find(p_src) == serveStreams.end()){
                serveStreams[p_src] = std::vector<int>();
            }
            serveStreams[p_src].push_back(i);
        }
    }

    std::vector<int> ungroupVertice;
    for(int v = 0 ; v < numVertex ; v ++){
        if(parent[v] == v && size[v] == 1){
            ungroupVertice.push_back(v);
        }
    }

    /****************************************
     * Find disjoint cycle for each group
     ****************************************/

    for(int i = 0 ; i < numVertex ; i ++){
        if(parent[i] == i && size[i] > 2){
            group.push_back(i);
            members[i] = std::vector<int>();
        }
    }
    for(int i = 0 ; i < numVertex ; i ++){
        members[find(i)].push_back(i);
    }

    for(int g: group){
        std::cerr << "Group (" << g << ") ";
        for(int m: members[g]){
            std::cerr << m << " ";
        }
        std::cerr << "\n";
    }
    
    /* Find cycle inside single group */
    for(int g: group){
        cycles[g] = largestCycle(scenario.graph, members[g]);
        std::cerr << "\nCycle for Group (" << g << ") ";
        for(int m: cycles[g]){
            std::cerr << m << " ";
        }
        std::cerr << "\n";
    }

    /****************************************
     * Check how many streams can be served.
     ****************************************/
    for(auto stream: scenario.Type_2){
        int src = stream.src, dst = stream.dst;
        int g_src = find(src), g_dst = find(dst);
        if(g_src != g_dst) continue;
        auto cycle = cycles[g_src];
        if(std::find(cycle.begin(), cycle.end(), src) == cycle.end() || std::find(cycle.begin(), cycle.end(), dst) == cycle.end()){
            if(numFail.find(g_src) == numFail.end()) numFail[g_src] = 1;
            else numFail[g_src] ++;
        } 
    }


    /* Sort the candidates after merging */
    std::sort(
        group.begin(),
        group.end(), 
        [&](const int &a, const int &b){ 
            return numFail[a] > numFail[b]; 
        }
    );

    std::vector<std::vector<double> > cap = scenario.graph.get_cap_matrix();
    for(int g: group){
        if(numFail[g] == 0) break;
        std::vector<int> nodes = members[g];
        if(size[g] >= SIZE_CONSTRAINT) continue;
        else if(size[g] + ungroupVertice.size() <= SIZE_CONSTRAINT){
            nodes.insert(nodes.end(), ungroupVertice.begin(), ungroupVertice.end());
        }
        else{
            std::map<int, int> rel;
            auto comp = [&]( const int& a, const int& b ) { return rel[a] > rel[b]; };
            std::priority_queue<int, std::vector<int>, decltype(comp)> pq(comp);
            for(int uv: ungroupVertice){
                rel[uv] = 0;
                for(int m: members[g]){
                    if(cap[uv][m]) rel[uv] ++;
                    if(cap[m][uv]) rel[uv] ++;
                }
                pq.push(uv);
            }
            for(int i = 0 ; i < SIZE_CONSTRAINT-size[g] ; i ++){
                nodes.push_back(pq.top());
                pq.pop();
            }
        }
        
        std::vector<int> lc = largestCycle(scenario.graph, nodes);
        
        int serveFail = 0;
        for(int sid: serveStreams[g]){
            int src = scenario.Type_2[sid].src, dst = scenario.Type_2[sid].dst;
            if(std::find(lc.begin(), lc.end(), src) == lc.end() || std::find(lc.begin(), lc.end(), dst) == lc.end()){
                serveFail ++;
            }
        }
        if(serveFail < numFail[g]) {
            numFail[g] = serveFail;
            cycles[g] = lc;
            for(auto v: lc){
                if(parent[v] == v && size[v] == 1){
                    ungroupVertice.erase(
                        std::lower_bound(ungroupVertice.begin(), ungroupVertice.end(), v)
                    );
                }
            }
        }
        if(ungroupVertice.size() == 0) break;
    }
}

void Solution::Merging(){
    /* Find cycle inside two disjoint group */
    for(int g1: group){
        for(int g2: group){
            if(g1 != g2 && size[g1] + size[g2] <= SIZE_CONSTRAINT){
                std::vector<int> nodes = members[g1];
                nodes.insert(nodes.end(), members[g2].begin(), members[g2].end());
                std::vector<int> lc = largestCycle(scenario.graph, nodes);
                /* TODO:
                * If the cycle lc can provide additional benefits, 
                * set it as the answer of the two groups.
                * For example:
                *   1. serve more streams
                *   2. shorter total routing path */
                int serveFail = 0;
                for(int sid: serveStreams[g1]){
                    int src = scenario.Type_2[sid].src, dst = scenario.Type_2[sid].dst;
                    if(std::find(lc.begin(), lc.end(), src) == lc.end() || std::find(lc.begin(), lc.end(), dst) == lc.end()){
                        serveFail ++;
                    }
                }
                for(int sid: serveStreams[g2]){
                    int src = scenario.Type_2[sid].src, dst = scenario.Type_2[sid].dst;
                    if(std::find(lc.begin(), lc.end(), src) == lc.end() || std::find(lc.begin(), lc.end(), dst) == lc.end()){
                        serveFail ++;
                    }
                }
                if(serveFail < numFail[g1] + numFail[g2]){
                    mergeResult.push_back(
                        mergeCandidate{g1, g2, lc, numFail[g1] + numFail[g2] - serveFail}
                    );
                }
            }
        }
    }
}

/* API: caller */
void Solution::solve_type2(int trim){
    Grouping();
    Merging();

    
    for(auto it = cycles.begin() ; it != cycles.end() ; it ++){
        std::cerr << "group " << it -> first << ") " ;
        for(int n: it -> second){
            std::cerr << n << " "; 
        }
        std::cerr << "\n";
    }

    /* Sort the candidates after merging */
    std::sort(
        mergeResult.begin(),
        mergeResult.end(), 
        [](const mergeCandidate &a, const mergeCandidate &b){ 
            return a.newServe > b.newServe; 
        }
    );

    /* Apply the merge */
    std::map<int, bool> merged;
    for(int i = 0 ; i < mergeResult.size() ; i ++){
        int g1 = mergeResult[i].group1, g2 = mergeResult[i].group2;
        if(merged.find(g1) != merged.end() || merged.find(g2) != merged.end()) continue;
        else{
            cycles[g1] = mergeResult[i].cycle;
            cycles[g2] = mergeResult[i].cycle;
            merged[g1] = merged[g2] = true;
        }
    }
    
    /* Find the route */
    type2_path = std::vector<std::vector<int> >();
    int serveCnt = 0;
    for(int i = 0 ; i < scenario.Type_2.size() ; i ++){
        auto stream = scenario.Type_2[i];
        type2_path.push_back(std::vector<int>());
        int src = stream.src, dst = stream.dst;
        // std::cerr << src << ", " << dst << "\n";
        int g_src = find(src), g_dst = find(dst);
        int index_ = -1;
        for(int i = 0 ; i < cycles[g_src].size() ; i++){
            if(cycles[g_src][i] == src){
                index_ = i;
                break;
            }
        }
        bool serve = (index_ >= 0);
        // std::cerr << "(finding) ";
        while(index_ >= 0 && cycles[g_src][index_] != dst){
            // std::cerr << cycles[g_src][index_] << " ";
            type2_path[i].push_back(cycles[g_src][index_]);
            index_ = (index_ + 1) % cycles[g_src].size();
            if(cycles[g_src][index_] == src){
                serve = false;
                break;
            }
        }
        // std::cerr << "\n";
        if(!serve){
            type2_path[i] = e_graph.shortest_path(src, dst, stream.data_rate);
        }
        else{
            type2_path[i].push_back(dst);
            serveCnt ++;
        }
    }
    std::cerr << "Serve: " << serveCnt << " / " << scenario.Type_2.size() << "\n";
    std::cout << serveCnt << "," << scenario.Type_2.size() << "\n";
}