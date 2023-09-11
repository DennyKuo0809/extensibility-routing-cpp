if [ -z "$GUROBI_HOME" ]
then
    echo "Please set enviroment variable GUROBI_HOME first. (export GUROBI_HOME=...)"
    exit
fi

### Parse Arguments
POSITIONAL_ARGS=()
HEURISTIC_CUT=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --heuristic_cut)
      HEURISTIC_CUT=true
      shift # past argument
      ;;
    -*|--*)
      echo "Unknown option $1"
      echo "$ARG_NOTICE"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

cmake -H. -Bbuild
if [ "$HEURISTIC_CUT" = "true" ]
then
    cmake -DHEURISTIC_CUT=ON
fi
cmake --build build/
cp build/solver ./