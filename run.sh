### Command Line Arguments
# $1: path to scenario
# $2: type1 method
# $3: path to output directory


### Compile cpp 
make clean
make

### Create Directory
filename=`basename $1`
dirname="${3%/}/${filename%.*}"
echo $dirname

if [[ -d $dirname || -L $dirname ]] ; then
    i=1
    while [[ -d $dirname-$i || -L $dirname-$i ]] ; do
        let i++
    done
    dirname=$dirname-$i
fi

mkdir $dirname
mkdir "$dirname/shortest_path"

### Create output file
routing_path="$dirname/routing.txt"
shortest_path_info_path="$dirname/shortest_path_info.txt"
module_info_path="$dirname/module.info"
ini_path="$dirname/omnetpp.ini"
ned_path="$dirname/scenario.ned"

# touch $routing_path
# touch $shortest_path_info_path
# touch $module_info_path
# touch $ini_path
# touch $ned_path


### Routing
./extensibility_routing $1 $2 $routing_path $shortest_path_info_path

### Generate input file for simulator
python3 generator/main.py \
--scenario $1 \
--routing_path $routing_path \
--sp_info $shortest_path_info_path \
--dir $dirname

### Clear
make clean