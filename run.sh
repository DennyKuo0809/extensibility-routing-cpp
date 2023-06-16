### Command Line Arguments
# $1: path to scenario
# $2: type1 method
# $3: path to ned
# $4: path to ini
# $5

### Compile cpp 
make clean
make

### Create temprary file to store routing path
tmp_file="tmp_$(date +'%Y%m%d%H%M%S')"
echo "[I] Create temprary file $tmp_file"

### Create file for shortest path information
sp_file="$1.shortest_path_$(date +'%Y%m%d%H%M%S')"
echo "[I] Shortest path information in $sp_file"

### Routing
./extensibility_routing $1 $2 $tmp_file $sp_file

### Generate input file for simulator
python3 generator/main.py \
--scenario $1 \
--routing_path $tmp_file \
--ned_output $3 \
--ini_output $4 \
--info_output $5

### Clear
rm -f $tmp_file
echo "[I] Delete temprary file $tmp_file"
make clean