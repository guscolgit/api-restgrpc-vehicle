Rest Api and gRPC Api for vehicle's location registers

This Api was compiled in Debian GNU/Linux using CMake and gcc, with the libraries CppRest SDK (Casablanca) for the Rest Api, gRPC library for de gRPC APi and Google Test C++ for unit test grpc.

Compile using de bash script 
	
	./compile.sh 

from the directory Api-restgrpc-vehicle

To run the servers use the command

	./run.sh "parameter"
	
from the directory Api-restgrpc-vehicle where parameter is "test" to run the unit test and "prod" to run the servers 
