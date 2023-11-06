import ned_generator
import ini_generator

from argparse import ArgumentParser, Namespace
import pickle

def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "--scenario",
        type=str,
        help="Path to input data."
    )
    parser.add_argument(
        "--dir",
        type=str,
        help="Path to the input and output directory.",
        default=0.0
    )
    parser.add_argument(
        "--method",
        type=str,
        help="Method for type-1 routing.",
        default=0.0
    )
    parser.add_argument(
        "--output_sp",
        type=bool,
        help="Output information of shortest path or not.",
        default=0.0
    )
    parser.add_argument(
        "--output_ned",
        type=bool,
        help="Output ned file or not.",
        default=0.0
    )
    parser.add_argument(
        "--output_module",
        type=bool,
        help="Output information of modules or not.",
        default=0.0
    )
    args = parser.parse_args()
    return args

def main(args):
    T = ned_generator.Topology()
    T.fromFile(args.scenario)
    R = ini_generator.Route(T)
    R.fromFile(f"{args.dir}/route/{args.method}.txt")
    # print(f"type1 routing : \n{R.type1_route}\ntype2 routing: \n{R.type2_route}")
    R.parseStream()
    
    if args.output_ned:
        T.genNed(f"{args.dir}/scenario.ned")
    if args.output_sp:
        R.genINI_shortest_path(f"{args.dir}/info/shortest_path.txt", f"{args.dir}/sim-conf")
    if args.output_module:
        R.genINI(f"{args.dir}/sim-conf/{args.method}.ini")
        R.genINFO(f"{args.dir}/info/module_stream_{args.method}.pickle")
    else:
        R.genINI(f"{args.dir}/sim-conf/{args.method}.ini")


if __name__ == "__main__":
    args = parse_args()
    main(args)