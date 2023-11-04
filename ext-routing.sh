# Global Variables
GEN_TESTCASE=false
DO_ROUTE=false
DO_SIM=false

# Command Line Arguments
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    gen_testcase)
      GEN_TESTCASE=true
      shift # past argument
      break
      ;;
    route)
      DO_ROUTE=true
      shift # past argument
      ;;
    --sim)
      DO_SIM=true
      shift # past argument
      ;;
    -h|--help)
    #   echo "$ARG_NOTICE"
      shift # past argument
      exit 0
      ;;
    -*|--*)
      echo "Unknown option $1"
    #   echo "$ARG_NOTICE"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# Read Configuration
echo "" >> extensibility-routing.conf
while IFS='=' read -r key value; do
    if [[ $key && $value ]]; then
        if [[ $key != \#* ]]; then
            declare "$key=$value"
        fi
    fi
done < extensibility-routing.conf
truncate -s -1 extensibility_routing.conf

# Generate testcase
if [[ "$GEN_TESTCASE" == "true" ]]; then
    python3 testcase-generator/gen_testcase.py \
    --num_vertex $EXT_ROUTE_GEN_NUM_NODES \
    --cap_utl_ratio $EXT_ROUTE_GEN_CAP_UTIL_RATIO \
    --type1_type2_ratio $EXT_ROUTE_GEN_TYPE1_TYPE2_RATIO \
    --type1_num $EXT_ROUTE_GEN_TYPE1_NUM \
    --lambda_upper $EXT_ROUTE_GEN_LAMBDA_UPPER_BOUND \
    --lambda_lower $EXT_ROUTE_GEN_LAMBDA_LOWER_BOUND \
    --output $EXT_ROUTE_GEN_PATH
fi

echo `ls solver`
# Run extensibility routing
if [[ "$DO_ROUTE" == "true" ]]; then
    if [[ "$DO_SIM" == "true" ]]; then
        bash run.sh \
        --scenario $EXT_ROUTE_INPUT_FILE \
        --method $EXT_ROUTE_METHOD \
        --trim $EXT_ROUTE_TRIM_VAL \
        --output $EXT_ROUTE_OUTPUT_DIR \
        --sim_dir $EXT_ROUTE_SIM_DIR \
        --omnet_dir $EXT_ROUTE_OMNET_DIR \
        --inet_dir $EXT_ROUTE_INET_DIR \
        --do_sim
    else
        bash run.sh \
        --scenario $EXT_ROUTE_INPUT_FILE \
        --method $EXT_ROUTE_METHOD \
        --trim $EXT_ROUTE_TRIM_VAL \
        --output $EXT_ROUTE_OUTPUT_DIR
    fi
fi