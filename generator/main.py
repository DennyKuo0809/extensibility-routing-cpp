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
        "--routing_path",
        type=str,
        help="Path to the routing path of type1+2 streams",
        default=0.0
    )
    parser.add_argument(
        "--ned_output",
        type=str,
        help="Path to the ned generated result.",
        default=0.0
    )
    parser.add_argument(
        "--ini_output",
        type=str,
        help="Path to the ini generated result.",
        default=0.0
    )
    parser.add_argument(
        "--info_output",
        type=str,
        help="Path to the information of streams.",
        default=0.0
    )
    args = parser.parse_args()
    return args

def main(args):
    T = ned_generator.Topology()
    T.fromFile(args.scenario)
    T.genNed(args.ned_output)
    R = ini_generator.Route(T)
    R.fromFile(args.routing_path)
    print(f"type1 routing : \n{R.type1_route}\ntype2 routing: \n{R.type2_route}")
    R.parseStream()
    R.genINI(args.ini_output, args.info_output)

if __name__ == "__main__":
    args = parse_args()
    main(args)