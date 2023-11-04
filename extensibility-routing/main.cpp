#include "include/solution.hpp"
#include <cassert>
#include <fstream>

int main(int argc, char *argv[]){
    /*******************************************
     * Command Line Arguments:
     *  1. Path to scenario
     *  2. Method for type-1 streams
     *  3. Path to output file
     *  4. Path to shortest path information file
     *  5. Output information of shortest path or not
     *******************************************/

    if (argc != 7){
        std::cerr << "Usage: ./executable [Scenario File] [Routing Method] [Output File] [Shortest Path Information Output File] [Output Shortest Path Information or not] [Trim Value]" << std::endl;
        exit(-1);
    }
    std::string path_to_scenario = std::string(argv[1]);
    std::string routing_method = std::string(argv[2]);
    std::string path_to_output = std::string(argv[3]);
    std::string path_to_shortest_path_info = std::string(argv[4]);
    std::string output_shortest = std::string(argv[5]);
    double trim_value = std::stod(std::string(argv[6]));

    std::ifstream ifs;
    ifs.open(path_to_scenario,  std::ifstream::in);

    Scenario scenario;
    ifs >> scenario;
    std::cerr << scenario;
    Solution solution(scenario);

    
    if(routing_method == "ILP") solution.ILP_routing();
    else solution.solve_type1(routing_method);

    solution.solve_type2(trim_value);


    // std::cerr << solution;

    std::ofstream ofs;
    ofs.open(path_to_output,  std::ifstream::out);
    ofs << solution;

    if(output_shortest == "true"){
        solution.perform_shortest_path();
        std::ofstream ofs_info;
        ofs_info.open(path_to_shortest_path_info,  std::ifstream::out);
        solution.output_shortest_path(ofs_info);
    }
}
