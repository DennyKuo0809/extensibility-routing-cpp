all:
	g++ -std=c++11 extensibility-routing/src/*.cpp extensibility-routing/main.cpp -o solver
clean:
	rm -f solver