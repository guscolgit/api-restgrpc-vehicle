#!/bin/sh

echo "Test Rest Api\n"

echo "\n\n----------------------------------------------------------------------------------"
echo "Insert Test 1\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d4","latitude":48.13215,"longitude":23.13515}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/insert
echo "\n----------------------------------------------------------------------------------"
echo "\nInsert Failed Test 1\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d5","latitude":"48.13215","longitude":"23.13515"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/insert
echo "\n----------------------------------------------------------------------------------"
echo "\nInsert Test 2\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d6","latitude":63.63276,"longitude":56.23415}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/insert
echo "\n----------------------------------------------------------------------------------"
echo "\nInsert Test 3\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d5","latitude":48.13215,"longitude":23.13515}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/insert
echo "\n----------------------------------------------------------------------------------"
echo "\nInsert Failed Test 2\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d4","latitude":48.13215,"longitude":23.13515}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/insert
echo "\n----------------------------------------------------------------------------------"

echo "\n\n----------------------------------------------------------------------------------"
echo "\nRetrieve by ID Test 1\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d4"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyid
echo "\n----------------------------------------------------------------------------------"
echo "\nRetrieve by ID Test 2\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d6"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyid
echo "\n----------------------------------------------------------------------------------"
echo "\nFail Retrieve by ID Test 1\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d3"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyid
echo "\n----------------------------------------------------------------------------------"
echo "\nFail Retrieve by ID Test 2\n"
curl -d '{"vehicleID":21.31655}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyid
echo "\n----------------------------------------------------------------------------------"

echo "\n\n----------------------------------------------------------------------------------"
echo "\nSet Location by ID Test 1\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d4","latitude":98.13215,"longitude":50.95548}' -H "Content-Type: application/json" -X PUT http://127.0.0.1:34568/
echo "\n----------------------------------------------------------------------------------"
echo "\nSet Location by ID Test 2\n"
curl -d '{"vehicleID":"d6f92136-1b7b-46be-85fd-67aa161ef2d4","latitude":98.13215,"longitude":50.95548}' -H "Content-Type: application/json" -X PUT http://127.0.0.1:34568/
echo "\n----------------------------------------------------------------------------------"

echo "\n\n----------------------------------------------------------------------------------"
echo "\nGet by Area Test 1\n"
curl -d '{"latitude":63.63276,"longitude":56.23415}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyarea
echo "\n----------------------------------------------------------------------------------"
echo "\nFail Get by Area Test 1\n"
curl -d '{"latitude":48.13215,"longitude":63.13515}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyarea
echo "\n----------------------------------------------------------------------------------"
echo "\nFail Get by Area Test 2\n"
curl -d '{"latitude":"48.13215","longitude":"63.13515"}' -H "Content-Type: application/json" -X POST http://127.0.0.1:34568/vehiclebyarea

echo "\n----------------------------------------------------------------------------------"

echo "\n\n----------------------------------------------------------------------------------"
echo "\nDelete Test 1\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d4"}' -H "Content-Type: application/json" -X DELETE http://127.0.0.1:34568/
echo "\n----------------------------------------------------------------------------------"
echo "\nDelete Test 2\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d3"}' -H "Content-Type: application/json" -X DELETE http://127.0.0.1:34568/
echo "\n----------------------------------------------------------------------------------"
echo "\nDelete Test 3\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d5"}' -H "Content-Type: application/json" -X DELETE http://127.0.0.1:34568/
echo "\n----------------------------------------------------------------------------------"
echo "\nDelete Test 4\n"
curl -d '{"vehicleID":"b6f92136-1b7b-46be-85fd-67aa161ef2d6"}' -H "Content-Type: application/json" -X DELETE http://127.0.0.1:34568/
echo "\nFail Delete Test 1\n"
curl -d '{"vehicleID":21.13545}' -H "Content-Type: application/json" -X DELETE http://127.0.0.1:34568/

echo "\n----------------------------------------------------------------------------------"
