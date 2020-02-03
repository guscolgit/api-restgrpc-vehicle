#!/bin/sh

cmake . -DDBMS=ON && make && cd grpc && make clean && make all && cd ..