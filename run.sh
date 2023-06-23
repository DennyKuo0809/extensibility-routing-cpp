### Command Line Arguments
#   -s, --scenario    Path to input scenario
#   -o, --output      Path to output directory
#   -m, --method      (Optional) Routing Method for type-1 streams.
#                     All four method will be performed if not specified.
#                           * shortest_path
#                           * min_max_percentage
#                           * least_used_capacity_percentage
#                           * least_conflict_value


### Architecture of output directory
#   .
#   ├── sim-conf
#   │   ├── shortest-{stream type}-{stream id}.ini
#   │   ├── ...
#   │   ├── shortest-{stream type}-{stream id}.ini
#   │   ├── {type-1 method}.ini
#   │   ├── ...
#   │   └── {type-1 method}.ini
#   ├── route
#   │   ├── {type-1 method}.txt
#   │   ├── ...
#   │   └── {type-1 method}.txt
#   ├── info
#   │   ├── shortest_path.txt
#   │   └── module_stream.pickle
#   ├── log
#   └── scenario.ned


### Parse Arguments
POSITIONAL_ARGS=()
TYPE1_METHOD=("shortest_path" "min_max_percentage" "least_used_capacity_percentage" "least_conflict_value")
ARG_NOTICE=$'[Usage]\n-s, --scenario\t\tPath to scenario.\n-o, --output\t\tPath to output directory.\n-m, --method\t\tRouting method for type-1 streams.\n\t\t\t\t* shortest_path\n\t\t\t\t* min_max_percentage\n\t\t\t\t* least_used_capacity_percentage\n\t\t\t\t* least_conflict_value'

while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--scenario)
      SCENARIO="`realpath $2`"
      shift # past argument
      shift # past value
      ;;
    -o|--output)
      OUTPUTDIR="$2"
      shift # past argument
      shift # past value
      ;;
    -m|--method)
      METHOD="$2"
      shift # past argument
      shift # past value
      ;;
    -h|--help)
      echo "$ARG_NOTICE"
      shift # past argument
      exit 0
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

if [ "$SCENARIO" == "" ] || [ "$OUTPUTDIR" == "" ]
then
    echo "Lack of required argument"
    echo "$ARG_NOTICE"
    exit 1
fi

VALID_METHOD=false
for m in ${TYPE1_METHOD[@]}
do
    echo $m
    if [ "$METHOD" == "$m" ]
    then
        VALID_METHOD=true
        break
    fi
done

if [ $VALID_METHOD == false ] && [ "$METHOD" != "" ]
then
    echo "Invalid method: $METHOD"
    exit 1
fi

### Notice
if [ "$METHOD" == "" ]
then
    SPEC_METHOD='Not specified.'
else
    SPEC_METHOD="$METHOD"
fi
printf "\n[Info] Start with\n\t(Scenario)\t\t$SCENARIO\n\t(Output directory)\t$OUTPUTDIR\n\t(Method)\t\t$SPEC_METHOD\n\n"


### Create sub-directory
printf "[Info] Creating the output directory\t$OUTPUTDIR.\n"
if [ -d "$OUTPUTDIR" ]
then
    printf "[Info] Since already existed, overwriting the output directory\t$OUTPUTDIR.\n"
    rm -rf "$OUTPUTDIR"
fi
mkdir "$OUTPUTDIR"
OUTPUTDIR="`realpath $OUTPUTDIR`"
mkdir "$OUTPUTDIR/route"
mkdir "$OUTPUTDIR/info"
mkdir "$OUTPUTDIR/sim-conf"
touch "$OUTPUTDIR/log"

### Compile cpp 
printf "[Info] Compiling solver for routing.\n"
make clean >>"$OUTPUTDIR/log" 2>&1
make >>"$OUTPUTDIR/log" 2>&1

### Routing
if [ "$METHOD" != "" ]
then
    routing_path="$OUTPUTDIR/route/$METHOD.txt"
    shortest_path_info_path="$OUTPUTDIR/info/shortest_path.txt"
    ./solver \
        $SCENARIO \
        $METHOD \
        $routing_path \
        $shortest_path_info_path
else
    for i in ${!TYPE1_METHOD[@]}
    do
        m=${TYPE1_METHOD[$i]}
        routing_path="$OUTPUTDIR/route/$m.txt"
        shortest_path_info_path="$OUTPUTDIR/info/shortest_path.txt"
        if [ $i == 0 ]
        then
            ./solver \
              $SCENARIO \
              $m \
              $routing_path \
              $shortest_path_info_path \
              'true'
        else
            ./solver \
              $SCENARIO \
              $m \
              $routing_path \
              $shortest_path_info_path \
              'false'
        fi
    done
fi

### Generate input file for simulator
if [ "$METHOD" != "" ]
then
    python3 generator/main.py \
    --scenario "$SCENARIO" \
    --method "$METHOD" \
    --dir "$OUTPUTDIR" \
    --output_sp 'True' \
    --output_ned 'True' \
    --output_module 'True'
else
    for i in ${!TYPE1_METHOD[@]}
    do
        m=${TYPE1_METHOD[$i]}
        if [ $i == 0 ]
        then
            python3 generator/main.py \
            --scenario "$SCENARIO" \
            --method "$m" \
            --dir "$OUTPUTDIR" \
            --output_sp 'True' \
            --output_ned 'True' \
            --output_module 'True'
        else
            python3 generator/main.py \
            --scenario "$SCENARIO" \
            --method "$m" \
            --dir "$OUTPUTDIR" \
            --output_sp 'False' \
            --output_ned 'False' \
            --output_module 'False'
        fi
    done
fi

### Clear
make clean >>"$OUTPUTDIR/log" 2>&1