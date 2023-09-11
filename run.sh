### Command Line Arguments
#   -s, --scenario    Path to input scenario
#   -o, --output      Path to output directory
#   -m, --method      (Optional) Routing Method for type-1 streams.
#                     All four method will be performed if not specified.
#                           * shortest_path
#                           * min_max_percentage
#                           * least_used_capacity_percentage
#                           * least_conflict_value
#   --omnet_dir       Path to omnet directory
#   --inet_dir        Path to inet directory
#   --sim_dir         Path to simulation directory
#   --do_sim          Do simulation if specified


### Architecture of output directory
# .
# ├── sim-conf
# │   ├── shortest-{stream type}-{stream id}.ini
# │   ├── ...
# │   ├── shortest-{stream type}-{stream id}.ini
# │   ├── {type-1 method}.ini
# │   ├── ...
# │   └── {type-1 method}.ini
# ├── result
# │   ├── shortest-{stream type}-{stream id}.csv
# │   ├── ...
# │   ├── shortest-{stream type}-{stream id}.csv
# │   ├── {type-1 method}.csv
# │   ├── ...
# │   └── {type-1 method}.csv
# ├── route
# │   ├── {type-1 method}.txt
# │   ├── ...
# │   └── {type-1 method}.txt
# ├── info
# │   ├── shortest_path.txt
# │   ├── module_stream_{type-1 method}.pickle
# │   ├── ...
# │   └── module_stream_{type-1 method}.pickle
# ├── log
# └── scenario.ned


### Parse Arguments
POSITIONAL_ARGS=()
TYPE1_METHOD=("shortest_path" "min_max_percentage" "least_used_capacity_percentage" "least_conflict_value" "ILP")
ARG_NOTICE=$'[Usage]\n-s, --scenario\t\tPath to scenario.\n-o, --output\t\tPath to output directory.\n-m, --method\t\tRouting method for type-1 streams.\n\t\t\t\t* shortest_path\n\t\t\t\t* min_max_percentage\n\t\t\t\t* least_used_capacity_percentage\n\t\t\t\t* least_conflict_value'
DO_SIM=falserealpath $2
TRIM=0.0

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
    -t|--trim)
      TRIM="$2"
      shift # past argument
      shift # past value
      ;;
    --inet_dir)
      INETDIR="`realpath $2`"
      shift # past argument
      shift # past value
      ;;
    --sim_dir)
      SIMDIR="`realpath $2`"
      shift # past argument
      shift # past value
      ;;
    --omnet_dir)
      OMNETDIR="`realpath $2`"
      shift # past argument
      shift # past value
      ;;
    --do_sim)
      DO_SIM=true
      shift # past argument
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
mkdir "$OUTPUTDIR/result"
touch "$OUTPUTDIR/log"

make clean >>"$OUTPUTDIR/log" 2>&1
make >>"$OUTPUTDIR/log" 2>&1

### Routing
printf "[Info] Start routing ...\n"
if [ "$METHOD" != "" ]
then
    routing_path="$OUTPUTDIR/route/$METHOD.txt"
    shortest_path_info_path="$OUTPUTDIR/info/shortest_path.txt"
    ./solver \
        $SCENARIO \
        $METHOD \
        $routing_path \
        $shortest_path_info_path \
        'true' \
        $TRIM
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
              'true' \
              $TRIM
        else
            ./solver \
              $SCENARIO \
              $m \
              $routing_path \
              $shortest_path_info_path \
              'false' \
              $TRIM
        fi
    done
fi
printf "[Info] Complete routing.\n"

### Generate input file for simulator
printf "[Info] Generating input for simulation ...\n"
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
printf "[Info] Complete generating.\n"


### Perform Simulation and collect results
if [ "$DO_SIM" = "true" ]
then
    printf "[Info] Start simulation ...\n"
    source "$OMNETDIR/setenv" >>"$OUTPUTDIR/log" 2>&1
    source "$INETDIR/setenv" >>"$OUTPUTDIR/log" 2>&1
    cp "$OUTPUTDIR/scenario.ned"  "$SIMDIR/demo.ned"
    SIM_CONF="$SIMDIR/omnetpp.ini"
    SIM_RESULT="$SIMDIR/results/*.vec"

    all_ini=($(ls "$OUTPUTDIR/sim-conf"))
    for ini in "${all_ini[@]}"
    do
        FILENAME="${ini%.*}"
        SRC_CONF="$OUTPUTDIR/sim-conf/$ini"
        DST_RESULT="$OUTPUTDIR/result/$FILENAME.csv"

        cp "$SRC_CONF" "$SIM_CONF"
        inet -u Cmdenv "$SIM_CONF" >>"$OUTPUTDIR/log" 2>&1

        opp_scavetool x \
        -f name=~meanBitLifeTimePerPacket:vector \
        -F CSV-R \
        -o "$DST_RESULT" "$SIM_RESULT" >>"$OUTPUTDIR/log" 2>&1
    done
    printf "[Info] Complete simulation.\n"
fi

### Anlysis
printf "[Info] Starting analysis...\n"
printf "[Info] Results:"
if [ "$DO_SIM" = "true" ]
then
    python3 analysis/main.py --dir $OUTPUTDIR
fi

### Clear
make clean >>"$OUTPUTDIR/log" 2>&1