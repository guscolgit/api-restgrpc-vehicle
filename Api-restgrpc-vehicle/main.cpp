#include <string>
#include <iostream>
#include <vector>
#include <utility>
	
#include <grpcpp/grpcpp.h>
#include "include/stdafx.h"
#include "include/handler.h"
#include "include/servergrpc.h"

using namespace std;
using namespace web;
using namespace http;
using namespace utility;
using namespace http::experimental::listener;

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;

std::unique_ptr<handler> g_httpHandler;
std::unique_ptr<Server> grpcserver;

void createdb()
{
	char *sql = "CREATE TABLE VEHICLE("  \
      "ID STRING PRIMARY KEY     NOT NULL," \
      "LATITUDE          REAL    NOT NULL," \
      "LONGITUDE         REAL    NOT NULL);";
    Dbms* d  = new Dbms();
 	 d->connect("");
 	 d->exec_query(sql,false,0);
    d->disconnect();
}
void on_initialize(const string_t& address)
{


    uri_builder uri(address);
  

    auto addr = uri.to_uri().to_string();
     g_httpHandler = std::unique_ptr<handler>(new handler(addr));
     g_httpHandler->open().wait();

    ucout << utility::string_t(U("Listening for requests at: ")) << addr << std::endl;

    return;
}

void on_shutdown()
{
     g_httpHandler->close().wait();
     grpcserver->Shutdown();
     
    return;
}

void RunGRPCServer() {
		
		
    
	std::string address("[::ffff:0000:0000]:34569");
	HandlerServiceImplementation service;
	
	ServerBuilder builder;
	
	builder.AddListeningPort(address, grpc::InsecureServerCredentials());
	builder.RegisterService(&service);
	
	grpcserver = builder.BuildAndStart();
	std::cout << "Server gRPC listening on port: " << address << std::endl;
	
	grpcserver->Wait();
	}
	

#ifdef _WIN32
int wmain(int argc, wchar_t *argv[])
#else
int main(int argc, char *argv[])
#endif
{
	 createdb();
    utility::string_t port = U("34568");
    if(argc == 2)
    {
        port = argv[1];
    }

    utility::string_t address = U("http://0.0.0.0:");
    address.append(port);

    on_initialize(address);
    
    RunGRPCServer();
    std::cout << "Press ENTER to exit." << std::endl;

    std::string line;
    std::getline(std::cin, line);

    on_shutdown();
    return 0;
}
