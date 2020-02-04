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


Server Rest listen in 0.0.0.0:34568 acepts requests methods POST, PUT and DELETE.

	Inserts Vehicle at ==> 0.0.0.0:34568/insert method POST
	Retrieve vehicle by ID at ==> 0.0.0.0:34568/vehiclebyid method POST
	Update vehicle's location by ID at ==> 0.0.0.0:34568/ method PUT
	Get a list of vehicles at a given location at ==> 0.0.0.0:34568/vehiclebyarea method POST
	Delete a vehicle by ID at ==> 0.0.0.0:34568/ method DELETE

Server gRPC listen in 0.0.0.0:34569 acepts requests gRPC ==> you have to create a cliente gRPC including the file handlergrpc.grpc.pb.h
       
	#include "path_to_file/handlergrpc.grpc.pb.h"

And create request using the following fuctions

	Inserts Vehicle at ==> function sendRequestInsert
	Retrieve vehicle by ID at ==> function sendRequestGetByID
	Update vehicle's location by ID at ==> function sendRequestLocation
	Get a list of vehicles at a given location at ==> function sendRequestGetByArea
	Delete a vehicle by ID at ==> function sendRequestDelete
	
A test client has been included in this repository
