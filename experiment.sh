
NUM=10
DIR=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --num)
      NUM=$2
      shift # past argument
      shift # past value
      ;;
    --out)
      DIR=$2
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

mkdir $DIR
for ((i=1;i<=$NUM;i++)); do
    echo $i
    if [ -e "$DIR/$i.csv" ]
    then
      continue
    fi

    sed -i '23,$ d' extensibility-routing.conf
    echo "EXT_ROUTE_ANALYSIS_OUTPUT=$DIR/$i.csv" >> extensibility-routing.conf
    echo "" >> extensibility-routing.conf
    bash build.sh
    bash ext-routing.sh gen_testcase
    bash ext-routing.sh route --sim

    if [ $? != 0 ]
    then
      ((i--))
    fi
done



# EXT_ROUTE_ANALYSIS_OUTPUT=demo/output/20-2-2.csv