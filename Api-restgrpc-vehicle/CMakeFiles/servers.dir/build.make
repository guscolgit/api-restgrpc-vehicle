# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gustavo/Descargas/Api-restgrpc-vehicle

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gustavo/Descargas/Api-restgrpc-vehicle

# Include any dependencies generated for this target.
include CMakeFiles/servers.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/servers.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/servers.dir/flags.make

handlergrpc.pb.h: src/handlergrpc.proto
handlergrpc.pb.h: /usr/local/bin/protoc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running cpp protocol buffer compiler on /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handlergrpc.proto"
	/usr/local/bin/protoc --cpp_out /home/gustavo/Descargas/Api-restgrpc-vehicle -I /home/gustavo/Descargas/Api-restgrpc-vehicle/src /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handlergrpc.proto

handlergrpc.pb.cc: handlergrpc.pb.h
	@$(CMAKE_COMMAND) -E touch_nocreate handlergrpc.pb.cc

handlergrpc.grpc.pb.cc: src/handlergrpc.proto
handlergrpc.grpc.pb.cc: /usr/local/bin/protoc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Running gRPC C++ protocol buffer compiler on /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handlergrpc.proto"
	/usr/local/bin/protoc --grpc_out=generate_mock_code=true:/home/gustavo/Descargas/Api-restgrpc-vehicle --plugin=protoc-gen-grpc=/usr/local/bin/grpc_cpp_plugin -I /home/gustavo/Descargas/Api-restgrpc-vehicle/src /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handlergrpc.proto

handlergrpc.grpc.pb.h: handlergrpc.grpc.pb.cc
	@$(CMAKE_COMMAND) -E touch_nocreate handlergrpc.grpc.pb.h

CMakeFiles/servers.dir/main.cpp.o: CMakeFiles/servers.dir/flags.make
CMakeFiles/servers.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/servers.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/servers.dir/main.cpp.o -c /home/gustavo/Descargas/Api-restgrpc-vehicle/main.cpp

CMakeFiles/servers.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/servers.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gustavo/Descargas/Api-restgrpc-vehicle/main.cpp > CMakeFiles/servers.dir/main.cpp.i

CMakeFiles/servers.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/servers.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gustavo/Descargas/Api-restgrpc-vehicle/main.cpp -o CMakeFiles/servers.dir/main.cpp.s

CMakeFiles/servers.dir/src/handler.cpp.o: CMakeFiles/servers.dir/flags.make
CMakeFiles/servers.dir/src/handler.cpp.o: src/handler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/servers.dir/src/handler.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/servers.dir/src/handler.cpp.o -c /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handler.cpp

CMakeFiles/servers.dir/src/handler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/servers.dir/src/handler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handler.cpp > CMakeFiles/servers.dir/src/handler.cpp.i

CMakeFiles/servers.dir/src/handler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/servers.dir/src/handler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gustavo/Descargas/Api-restgrpc-vehicle/src/handler.cpp -o CMakeFiles/servers.dir/src/handler.cpp.s

CMakeFiles/servers.dir/src/servergrpc.cpp.o: CMakeFiles/servers.dir/flags.make
CMakeFiles/servers.dir/src/servergrpc.cpp.o: src/servergrpc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/servers.dir/src/servergrpc.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/servers.dir/src/servergrpc.cpp.o -c /home/gustavo/Descargas/Api-restgrpc-vehicle/src/servergrpc.cpp

CMakeFiles/servers.dir/src/servergrpc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/servers.dir/src/servergrpc.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gustavo/Descargas/Api-restgrpc-vehicle/src/servergrpc.cpp > CMakeFiles/servers.dir/src/servergrpc.cpp.i

CMakeFiles/servers.dir/src/servergrpc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/servers.dir/src/servergrpc.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gustavo/Descargas/Api-restgrpc-vehicle/src/servergrpc.cpp -o CMakeFiles/servers.dir/src/servergrpc.cpp.s

CMakeFiles/servers.dir/handlergrpc.pb.cc.o: CMakeFiles/servers.dir/flags.make
CMakeFiles/servers.dir/handlergrpc.pb.cc.o: handlergrpc.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/servers.dir/handlergrpc.pb.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/servers.dir/handlergrpc.pb.cc.o -c /home/gustavo/Descargas/Api-restgrpc-vehicle/handlergrpc.pb.cc

CMakeFiles/servers.dir/handlergrpc.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/servers.dir/handlergrpc.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gustavo/Descargas/Api-restgrpc-vehicle/handlergrpc.pb.cc > CMakeFiles/servers.dir/handlergrpc.pb.cc.i

CMakeFiles/servers.dir/handlergrpc.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/servers.dir/handlergrpc.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gustavo/Descargas/Api-restgrpc-vehicle/handlergrpc.pb.cc -o CMakeFiles/servers.dir/handlergrpc.pb.cc.s

CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.o: CMakeFiles/servers.dir/flags.make
CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.o: handlergrpc.grpc.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.o -c /home/gustavo/Descargas/Api-restgrpc-vehicle/handlergrpc.grpc.pb.cc

CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gustavo/Descargas/Api-restgrpc-vehicle/handlergrpc.grpc.pb.cc > CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.i

CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gustavo/Descargas/Api-restgrpc-vehicle/handlergrpc.grpc.pb.cc -o CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.s

# Object files for target servers
servers_OBJECTS = \
"CMakeFiles/servers.dir/main.cpp.o" \
"CMakeFiles/servers.dir/src/handler.cpp.o" \
"CMakeFiles/servers.dir/src/servergrpc.cpp.o" \
"CMakeFiles/servers.dir/handlergrpc.pb.cc.o" \
"CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.o"

# External object files for target servers
servers_EXTERNAL_OBJECTS =

build/bin/servers: CMakeFiles/servers.dir/main.cpp.o
build/bin/servers: CMakeFiles/servers.dir/src/handler.cpp.o
build/bin/servers: CMakeFiles/servers.dir/src/servergrpc.cpp.o
build/bin/servers: CMakeFiles/servers.dir/handlergrpc.pb.cc.o
build/bin/servers: CMakeFiles/servers.dir/handlergrpc.grpc.pb.cc.o
build/bin/servers: CMakeFiles/servers.dir/build.make
build/bin/servers: build/lib/libdbms.so
build/bin/servers: /usr/local/lib/libprotobuf.so
build/bin/servers: /usr/lib/x86_64-linux-gnu/libpthread.so
build/bin/servers: /usr/local/lib/libgrpc++.so
build/bin/servers: /usr/local/lib/libgrpc.so
build/bin/servers: CMakeFiles/servers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable build/bin/servers"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/servers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/servers.dir/build: build/bin/servers

.PHONY : CMakeFiles/servers.dir/build

CMakeFiles/servers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/servers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/servers.dir/clean

CMakeFiles/servers.dir/depend: handlergrpc.pb.h
CMakeFiles/servers.dir/depend: handlergrpc.pb.cc
CMakeFiles/servers.dir/depend: handlergrpc.grpc.pb.cc
CMakeFiles/servers.dir/depend: handlergrpc.grpc.pb.h
	cd /home/gustavo/Descargas/Api-restgrpc-vehicle && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gustavo/Descargas/Api-restgrpc-vehicle /home/gustavo/Descargas/Api-restgrpc-vehicle /home/gustavo/Descargas/Api-restgrpc-vehicle /home/gustavo/Descargas/Api-restgrpc-vehicle /home/gustavo/Descargas/Api-restgrpc-vehicle/CMakeFiles/servers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/servers.dir/depend

