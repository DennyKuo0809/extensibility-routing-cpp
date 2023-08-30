if [ -z "$GUROBI_HOME" ]
then
    echo "Please set enviroment variable GUROBI_HOME first. (export GUROBI_HOME=...)"
    exit
fi
cmake -H. -Bbuild
cmake --build build/
cp build/solver ./