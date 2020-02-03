#!/bin/sh

var="test"
envdir=$1
if [ "$var" = "$envdir" ] ; then
	LD_LIBRARY_PATH=/Api-restgrpc-vehicle/build/lib ./Api-restgrpc-vehicle/build/bin/servers & sleep 10 && ./test.sh && rm vehicles.db && LD_LIBRARY_PATH=/Api-restgrpc-vehicle/build/lib ./Api-restgrpc-vehicle/build/bin/grpcclient ;
else 
	LD_LIBRARY_PATH=/Api-restgrpc-vehicle/build/lib ./Api-restgrpc-vehicle/build/bin/servers;
fi