

v_num=("5" "10" "15" "20" "25" "50")
s21_ratio=("1" "2" "3" "4")
sv_ratio=("1" "1.25" "1.5" "1.75" "2")

while [[ $# -gt 0 ]]; do
  case $1 in
    --in)
      INDIR=$2
      shift # past argument
      shift # past value
      ;;
    --out)
      OUTDIR=$2
      shift # past argument
      shift # past value
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

for vertex in "${v_num[@]}"
do
  # Config: vertex
  sed -i '2,2 d' extensibility-routing.conf
  sed -i "2i EXT_ROUTE_GEN_NUM_NODES=${vertex}" extensibility-routing.conf

  for s21 in "${s21_ratio[@]}"
  do
    # Config: Type2 Type1 ratio
    sed -i '5,5 d' extensibility-routing.conf
    sed -i "5i EXT_ROUTE_GEN_TYPE1_TYPE2_RATIO=${s21}" extensibility-routing.conf

    for sv in "${sv_ratio[@]}"
    do

      # Config: stream vertex ratio
      sed -i '4,4 d' extensibility-routing.conf
      sed -i "4i EXT_ROUTE_GEN_STREAM_VERTEX_RATIO=${sv}" extensibility-routing.conf
      
      OUT_DIR="${OUTDIR}/${vertex}-${sv}-${s21}"
      IN_DIR="${INDIR}/${vertex}-${sv}-${s21}"

      mkdir "${OUT_DIR}"
      mkdir "${IN_DIR}"

      # Config: Output directory
      sed -i '12,12 d' extensibility-routing.conf
      sed -i "12i EXT_ROUTE_OUTPUT_DIR=demo/output/${vertex}-${sv}-${s21}" extensibility-routing.conf

      for ((i=1;i<=50;i++))
      do
        if [ -e "${OUT_DIR}/${i}.csv" ]
        then
          echo "${OUT_DIR}/${i}.csv existed!"
          continue
        fi

        # Config: inpput, result
        sed -i '8,8 d' extensibility-routing.conf
        sed -i "8i EXT_ROUTE_GEN_PATH=${IN_DIR}/${i}.in" extensibility-routing.conf

        sed -i '11,11 d' extensibility-routing.conf
        sed -i "11i EXT_ROUTE_INPUT_FILE=${IN_DIR}/${i}.in" extensibility-routing.conf

        sed -i '23,23 d' extensibility-routing.conf
        sed -i "23i EXT_ROUTE_ANALYSIS_OUTPUT=${OUT_DIR}/${i}.csv" extensibility-routing.conf
        echo "" >> extensibility-routing.conf

        # Run
        echo "${vertex}-${sv}-${s21}-${i}"
        bash build.sh
        bash ext-routing.sh gen_testcase
        bash ext-routing.sh route --sim

        if [ $? != 0 ]
        then
          ((i--))
        fi
        # echo "========================="
        # cat extensibility-routing.conf
      done
    done
  done
done



# mkdir $DIR
# for ((i=1;i<=$NUM;i++)); do
#     echo $i
#     if [ -e "$DIR/$i.csv" ]
#     then
#       continue
#     fi

#     # # vertex

#     # # Stream vertex ratio

#     # # Type1 Type2 ratio

#     # # Input Path

#     # # Output Directory

#     # # Statistic Output
#     # sed -i '23,23 d' extensibility-routing.conf
#     # echo "EXT_ROUTE_ANALYSIS_OUTPUT=$DIR/$i.csv" >> extensibility-routing.conf
#     # echo "" >> extensibility-routing.conf
#     # bash build.sh
#     # bash ext-routing.sh gen_testcase
#     # bash ext-routing.sh route --sim

#     if [ $? != 0 ]
#     then
#       ((i--))
#     fi
# done









# # Generate Testcase
# EXT_ROUTE_GEN_NUM_NODES=10
# EXT_ROUTE_GEN_CAP_UTIL_RATIO=0.0001
# EXT_ROUTE_GEN_STREAM_VERTEX_RATIO=2
# EXT_ROUTE_GEN_TYPE1_TYPE2_RATIO=4
# EXT_ROUTE_GEN_LAMBDA_LOWER_BOUND=0.1
# EXT_ROUTE_GEN_LAMBDA_UPPER_BOUND=0.15
# EXT_ROUTE_GEN_PATH=demo/input/10-2-4.in

# # Routing
# EXT_ROUTE_INPUT_FILE=demo/input/10-2-4.in
# EXT_ROUTE_OUTPUT_DIR=demo/output/10-2-4
# EXT_ROUTE_METHOD=all
# EXT_ROUTE_TRIM_VAL=2

# # Simulation
# EXT_ROUTE_OMNET_DIR=/home/ubuntu/omnetpp-6.0.1/
# EXT_ROUTE_INET_DIR=/home/ubuntu/omnetpp-6.0.1/samples/inet4.5/
# EXT_ROUTE_SIM_DIR=/home/ubuntu/omnetpp-6.0.1/samples/inet4.5/tutorials/extensibility_routing/

# # Analysis
# # EXT_ROUTE_ANALYSIS_MODE: DELIVER / DEADLINE
# EXT_ROUTE_ANALYSIS_OUTPUT=demo/raw/10-2-4/50.csv