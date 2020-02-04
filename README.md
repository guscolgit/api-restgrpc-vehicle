Rest Api and gRPC Api for vehicle's location registers

This Api was compiled in Debian GNU/Linux using CMake and gcc, with the libraries CppRest SDK (Casablanca) for the Rest Api, gRPC library for de gRPC APi and Google Test C++ for unit test grpc.

Compile using de bash script

	./compile.sh 

from the directory Api-restgrpc-vehicle

To run the servers use the command

	./run_test.sh "parameter"

from the directory Api-restgrpc-vehicle where parameter is "test" to run the unit test and "prod" to run the servers

To run the docker image extract de gzip file and run the command to run the tests

	sudo docker run -p 34568:34568 -p 34569:34569 -e "type_env=test" --name rg api-restgrpc-vehicle:1.0

To run the server from docker image run the command

	sudo docker run -p 34568:34568 -p 34569:34569 -e "type_env=prod" --name rg api-restgrpc-vehicle:1.0

To stop and remove the container

	sudo docker container stop rg

	sudo docker container rm --force rg


