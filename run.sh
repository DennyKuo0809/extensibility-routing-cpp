### Command Line Arguments
# $1: path to scenario
# $2: type1 mathod
# $3: path to ned
# $4: path to ini

### Compile cpp 
make clean
make

### Create temprary file to store routing path
tmp_file="tmp_$(date +'%Y%m%d%H%M%S')"
echo $tmp_file

### Routing
./extensibility_routing $1 $2 $tmp_file

### Generate input file for simulator
python3.9 generator/main.py \
--scenario $1 \
--routing_path $tmp_file \
--ned_output $3 \
--ini_output $4


rm -f $tmp_file
make clean