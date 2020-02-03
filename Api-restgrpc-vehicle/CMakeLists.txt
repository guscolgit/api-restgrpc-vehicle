cmake_minimum_required (VERSION 3.5)
if (UNIX)
  add_definitions(-Wno-sign-compare -Wno-enum-compare -fno-delete-null-pointer-checks)
endif(UNIX)
project(vehicleserver)

find_package(Protobuf REQUIRED)

if ( Protobuf_FOUND )
    message( STATUS "Protobuf version : ${Protobuf_VERSION}" )
    message( STATUS "Protobuf include path : ${Protobuf_INCLUDE_DIRS}" )
    message( STATUS "Protobuf libraries : ${Protobuf_LIBRARIES}" )
else()
    message( WARNING "Protobuf package not found")
endif()

find_package(PkgConfig REQUIRED)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 ")
set (CMAKE_CXX_STANDARD 11)
option(DBMS "Dbms" OFF)
include_directories("${CMAKE_SOURCE_DIR}")
set (CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/build)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)

#set(GOPATH /home/gustavo/Descargas/grpc/third_party/googleapis)
#set(GOPATH2 ${CMAKE_SOURCE_DIR}/src)
#message( "Go path ${GOPATH} ${GOPATH2}")
#set(Protobuf_IMPORT_DIRS ${GOPATH} ${GOPATH2})
#include_directories(${Protobuf_IMPORT_DIRS})
#message( "pfid ${Protobuf_INCLUDE_DIRS}")
find_program(GRPC_CPP_PLUGIN grpc_cpp_plugin) # Get full path to plugin


function(PROTOBUF_GENERATE_GRPC_CPP SRCS HDRS)
  if(NOT ARGN)
    message(SEND_ERROR "Error: PROTOBUF_GENERATE_GRPC_CPP() called without any proto files")
    return()
  endif()

  if(PROTOBUF_GENERATE_CPP_APPEND_PATH) # This variable is common for all types of output.
    # Create an include path for each file specified
    foreach(FIL ${ARGN})
      get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
      get_filename_component(ABS_PATH ${ABS_FIL} PATH)
      list(FIND _protobuf_include_path ${ABS_PATH} _contains_already)
      if(${_contains_already} EQUAL -1)
          list(APPEND _protobuf_include_path -I ${ABS_PATH})
      endif()
    endforeach()
  else()
    set(_protobuf_include_path -I ${CMAKE_CURRENT_SOURCE_DIR})
  endif()

  if(DEFINED Protobuf_IMPORT_DIRS)
    foreach(DIR ${Protobuf_IMPORT_DIRS})
      get_filename_component(ABS_PATH ${DIR} ABSOLUTE)
      list(FIND _protobuf_include_path ${ABS_PATH} _contains_already)
      if(${_contains_already} EQUAL -1)
          list(APPEND _protobuf_include_path -I ${ABS_PATH})
      endif()
    endforeach()
  endif()

  set(${SRCS})
  set(${HDRS})
  foreach(FIL ${ARGN})
    get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
    get_filename_component(FIL_WE ${FIL} NAME_WE)

    list(APPEND ${SRCS} "${CMAKE_CURRENT_BINARY_DIR}/${FIL_WE}.grpc.pb.cc")
    list(APPEND ${HDRS} "${CMAKE_CURRENT_BINARY_DIR}/${FIL_WE}.grpc.pb.h")

    add_custom_command(
      OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${FIL_WE}.grpc.pb.cc"
             "${CMAKE_CURRENT_BINARY_DIR}/${FIL_WE}.grpc.pb.h"
      COMMAND  ${Protobuf_PROTOC_EXECUTABLE}
      ARGS --grpc_out=generate_mock_code=true:${CMAKE_CURRENT_BINARY_DIR}
           --plugin=protoc-gen-grpc=${GRPC_CPP_PLUGIN}
           ${_protobuf_include_path} ${ABS_FIL}
      DEPENDS ${ABS_FIL} ${Protobuf_PROTOC_EXECUTABLE}
      COMMENT "Running gRPC C++ protocol buffer compiler on ${FIL}"
      VERBATIM)
  endforeach()

  set_source_files_properties(${${SRCS}} ${${HDRS}} PROPERTIES GENERATED TRUE)
  set(${SRCS} ${${SRCS}} PARENT_SCOPE)
  set(${HDRS} ${${HDRS}} PARENT_SCOPE)
endfunction()

file(GLOB ProtoFiles "${CMAKE_SOURCE_DIR}/src/*.proto")

PROTOBUF_GENERATE_GRPC_CPP(ProtoGRPCSources ProtoGRPCHeaders ${ProtoFiles})
protobuf_generate_cpp(ProtoSources ProtoHeaders ${ProtoFiles})


add_executable(servers
  main.cpp
  src/handler.cpp
  src/servergrpc.cpp
  ${ProtoSources}
  ${ProtoGRPCSources}
  )
 add_executable(grpcclient
  src/clientgrpc.cc
  handlergrpc_mock.grpc.pb.h
  ${ProtoSources}
  ${ProtoGRPCSources}
  )
#add_executable(restclient
#  tests/test.cpp
#  src/handler.cpp
#  )

pkg_check_modules(grpc_LIBRARIES REQUIRED IMPORTED_TARGET protobuf grpc++ grpc)


set(grpc_LIBRARIES2 "Wl,--no-as-needed -lgrpc++_reflection -Wl,--as-needed -ldl")

set(Casablanca_LIBRARIES "-pthread -lboost_system -lcrypto -lssl -lcpprest")
 
if(DBMS)
	set(NEW_DB_SRC_DIR ${CMAKE_SOURCE_DIR}/dbms/src)
	add_library(dbms SHARED
		${NEW_DB_SRC_DIR}/Dbms.cpp
		)
	set(Dbms_dep_lib "-lsqlite3")
	target_link_libraries(servers dbms ${Casablanca_LIBRARIES} ${Dbms_dep_lib} PkgConfig::grpc_LIBRARIES)
	target_link_libraries(grpcclient dbms ${Dbms_dep_lib} PkgConfig::grpc_LIBRARIES gtest gtest_main gmock gmock_main)
#	target_link_libraries(restclient dbms ${Casablanca_LIBRARIES} ${Dbms_dep_lib})
else(DBMS)

	target_link_libraries(restserver ${Casablanca_LIBRARIES})
endif(DBMS)





