# $1: simulation directory
# $2: path to simulation result csv


inet -u Cmdenv

opp_scavetool x \
-f name=~meanBitLifeTimePerPacket:vector \
-F CSV-R \
-o $2 \ 
results/*.vec

