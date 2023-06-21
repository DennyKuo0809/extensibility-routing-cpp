#include "../include/solution.hpp"
#include <cassert>
#include <fstream>

int main(int argc, char *argv[]){
    /*******************************************
     * Command Line Arguments:
     *  1. Path to scenario
     *  2. Method for type-1 streams
     *  3. Path to output file
     *  4. Path to shortest path information file
     *******************************************/

    if (argc < 5){
        std::cerr << "Usage: ./executable [file path to scenario] [method for type-1 streams] [file path to output file] [path to shortest path info file]" << std::endl;
        exit(-1);
    }
    std::string path_to_scenario = std::string(argv[1]);
    std::string type1_method = std::string(argv[2]);
    std::string path_to_output = std::string(argv[3]);
    std::string path_to_shortest_path_info = std::string(argv[4]);

    std::ifstream ifs;
    ifs.open(path_to_scenario,  std::ifstream::in);

    Scenario scenario;
    ifs >> scenario;
    Solution solution(scenario);


    solution.solve_type1(type1_method);
    solution.solve_type2();
    solution.perform_shortest_path();


    // std::cout << solution;

    std::ofstream ofs;
    ofs.open(path_to_output,  std::ifstream::out);
    ofs << solution;

    std::ofstream ofs_info;
    ofs_info.open(path_to_shortest_path_info,  std::ifstream::out);
    solution.output_shortest_path(ofs_info);
}
