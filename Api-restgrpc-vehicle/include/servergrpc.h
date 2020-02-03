 	#include <string>
 	#include <iostream>
 	#include <vector>
	#include <utility>
	
	#include <grpcpp/grpcpp.h>
	#include "../dbms/include/Dbms.h"
	#include "../handlergrpc.grpc.pb.h"
	
	using namespace std;
	using grpc::Server;
	using grpc::ServerBuilder;
	using grpc::ServerContext;
	using grpc::Status;
	
	using handlergrpc::HandlerGRPC;
	using handlergrpc::HandlerRequest;
	using handlergrpc::HandlerReply;
	using handlergrpc::HandlerReplyGetByID;
	using handlergrpc::HandlerReplyGetByArea;
	using handlergrpc::Vehicle;
	
	class HandlerServiceImplementation final : public HandlerGRPC::Service 
	{
		Status sendRequestInsert(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReply* reply
		) override;
		
		Status sendRequestGetByID(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReplyGetByID* reply
		) override;
		
		Status sendRequestLocation(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReply* reply
		) override;
		
		Status sendRequestGetByArea(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReplyGetByArea* reply
		) override;
		
		Status sendRequestDelete(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReply* reply
		) override;
	};
	
/*	void Run() {
		
		char *sql = "CREATE TABLE VEHICLE("  \
      "ID STRING PRIMARY KEY     NOT NULL," \
      "LATITUDE          REAL    NOT NULL," \
      "LONGITUDE         REAL    NOT NULL);";
    Dbms* d  = new Dbms();
 	 d->connect("../");
 	 d->exec_query(sql,false,0);
    d->disconnect();
    
	std::string address("localhost:34569");
	HandlerServiceImplementation service;
	
	ServerBuilder builder;
	
	builder.AddListeningPort(address, grpc::InsecureServerCredentials());
	builder.RegisterService(&service);
	
	std::unique_ptr<Server> server(builder.BuildAndStart());
	std::cout << "Server listening on port: " << address << std::endl;
	
	server->Wait();
	}
	
	int main(int argc, char** argv) {
	Run();
	
	return 0;
	}*/