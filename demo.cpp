#include "include/solution.hpp"


int main(){
    /* Scenario */
    Scenario scenario;
    std::cin >> scenario;
    // std::cout << scenario;

    /* Johnson */
    Circuit_finding Cf(scenario.get_graph());
    Cf.johnson();
    std::vector<std::vector<int> > cycle_pool = Cf.get_cycle_pool();
    for(int i = 0 ; i < cycle_pool.size() ; i ++){
        std::cout << "[cycle pool] ";
        for(int j = 0 ; j < cycle_pool[i].size() ; j ++){
            std::cout << cycle_pool[i][j] << " ";
        }
        std::cout << cycle_pool[i][0] << std::endl;
    }

    /* Solution */
    Solution solution(scenario);
    // solution.solve_type1("least_conflict_value");
    // std::vector<std::vector<int> > type1_path = solution.get_type1_path();
    // for(int i = 0 ; i < type1_path.size() ; i ++){
    //     std::cout << "[Type-1 routing path] (from " << type1_path[i][0] << " to " << type1_path[i].back() << ") ";
    //     for(int j = 0 ; j < type1_path[i].size() ; j ++){
    //         std::cout << type1_path[i][j] << " ";
    //     }
    //     std::cout << std::endl;
    // }

    solution.solve_type2();
    
}