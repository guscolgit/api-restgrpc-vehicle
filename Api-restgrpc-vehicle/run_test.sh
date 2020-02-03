#!/bin/sh

var="test"
envdir=$1
if [ "$var" = "$envdir" ] ; then
	./build/bin/servers & sleep 10 && ./test.sh && rm vehicles.db && ./build/bin/grpcclient ;
else 
	./build/bin/servers;
fi