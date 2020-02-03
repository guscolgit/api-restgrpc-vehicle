#include "../include/servergrpc.h"

Status HandlerServiceImplementation::sendRequestInsert(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReply* reply
		) {
		
			try
			{
				std::string ssql = "INSERT INTO VEHICLE (ID,LATITUDE,LONGITUDE) VALUES('";
				ssql.append(request->vehicle().vehicleid());
				ssql.append(std::string("' , "));
				ssql.append(std::to_string(request->vehicle().latitude()));
				ssql.append(std::string(","));
				ssql.append(std::to_string(request->vehicle().longitude()));
				ssql.append(std::string("  ); "));
				char* sql = new char[ssql.length()];
				sql = (char*) ssql.c_str();		   
				Dbms* d  = new Dbms();
				if(d->connect(""))
				{
					if(d->exec_query(sql,false,0))
					{
							reply->set_result(std::string("Inserted Successfully"));
							d->disconnect();
							return Status::OK;
					}
					else
					{
						
						reply->set_result(std::string("Insert has failed"));
						
						d->disconnect();
						
					}
					
				}
			}
			catch(...)
			{
				reply->set_result(std::string("Insert has failed"));
			}
			
			return Status::CANCELLED;
		}
		
		Status HandlerServiceImplementation::sendRequestGetByID(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReplyGetByID* reply
		) {
		
			try
			{
				std::string ssql = std::string("SELECT ID,LATITUDE,LONGITUDE FROM VEHICLE WHERE (ID='") + request->vehicle().vehicleid() + std::string("');");
				char* sql = new char[ssql.length()];
				sql = (char*) ssql.c_str();		   
				Dbms* d  = new Dbms();
				if(d->connect(""))
				{
					std::vector<std::pair<std::string,std::string> > qdata;
					if(d->exec_query(sql,true, &qdata))
					{
						//json::value v0;
						if(!qdata.empty())
						{
						  	for (std::vector<std::pair<std::string,std::string>>::iterator it = qdata.begin() ; it != qdata.end(); it=it+3)
							{
								Vehicle* vehicle;
			  					vehicle = reply->mutable_vehicle();
								vehicle->set_vehicleid((*it).second);
								vehicle->set_latitude(std::stod((*(it+1)).second));
								vehicle->set_longitude(std::stod((*(it+2)).second));
								
							}
						}
						else
						{
							Vehicle* vehicle;
			  				vehicle = reply->mutable_vehicle();
						   vehicle->set_vehicleid(std::string(""));
							vehicle->set_latitude(0);
							vehicle->set_longitude(0);
							d->disconnect();
							return Status::CANCELLED;
						}
						d->disconnect();
						return Status::OK;
					}
					else
					{
						Vehicle* vehicle;
		  				vehicle = reply->mutable_vehicle();
					   vehicle->set_vehicleid(std::string(""));
						vehicle->set_latitude(0);
						vehicle->set_longitude(0);
						
						d->disconnect();
						
					}
				
				}
			}
			catch(...)
			{
				Vehicle* vehicle;
		  		vehicle = reply->mutable_vehicle();
				vehicle->set_vehicleid(std::string(""));
				vehicle->set_latitude(0);
				vehicle->set_longitude(0);

			}
			
			return Status::CANCELLED;
		}
		
		Status HandlerServiceImplementation::sendRequestLocation(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReply* reply
		) {
		
			try
			{
				std::string ssql = "UPDATE VEHICLE set LATITUDE = ";
				ssql.append(std::to_string(request->vehicle().latitude())); 
				ssql.append(std::string(", LONGITUDE=")); 
				ssql.append(std::to_string(request->vehicle().longitude())); 
				ssql.append(std::string(" WHERE ID='")); 
				ssql.append(request->vehicle().vehicleid()); 
				ssql.append(std::string("';"));
			
				char* sql = new char[ssql.length()];
				sql = (char*) ssql.c_str(); 
				Dbms* d  = new Dbms();
				if(d->connect(""))
				{
					if(d->exec_query(sql,false, 0))
					{
						  	reply->set_result("Successfully Updated");
						  	d->disconnect();
							return Status::OK;	
					}
					else
					{

						reply->set_result(std::string("Update Failed"));
						d->disconnect();
						
					}
				
				}
			}
			catch(...)
			{
				reply->set_result(std::string("Update Failed"));
			}
			
			return Status::CANCELLED;
		}
		
		Status HandlerServiceImplementation::sendRequestGetByArea(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReplyGetByArea* reply
		) {
		
			try
			{
				std::string ssql = std::string("SELECT ID,LATITUDE,LONGITUDE FROM VEHICLE WHERE (LATITUDE=") + std::to_string(request->vehicle().latitude()) + std::string(" AND LONGITUDE=") + std::to_string(request->vehicle().longitude()) + std::string(");");
				char* sql = new char[ssql.length()];
				sql = (char*) ssql.c_str();		   
				Dbms* d  = new Dbms();
				if(d->connect(""))
				{
					std::vector<std::pair<std::string,std::string> > qdata;
					if(d->exec_query(sql,true, &qdata))
					{
					  	for (std::vector<std::pair<std::string,std::string>>::iterator it = qdata.begin() ; it != qdata.end(); it=it+3)
						{
							Vehicle *vehicle;
							
							vehicle = reply->add_vehicle();
		  
							vehicle->set_vehicleid((*it).second);
							vehicle->set_latitude(std::stod((*(it+1)).second));
							vehicle->set_longitude(std::stod((*(it+2)).second));
							
						}
						d->disconnect();
						return Status::OK;
					}
					else
					{
						Vehicle *vehicle;
							
						vehicle = reply->add_vehicle();
		  
						vehicle->set_vehicleid(std::string(""));
						vehicle->set_latitude(0);
						vehicle->set_longitude(0);
						
						d->disconnect();
						
					}
					
				}
			}
			catch(...)
			{
				Vehicle *vehicle;
							
				vehicle = reply->add_vehicle();
		  
				vehicle->set_vehicleid(std::string(""));
				vehicle->set_latitude(0);
				vehicle->set_longitude(0);
			}
			
			return Status::CANCELLED;
		}
		
		Status HandlerServiceImplementation::sendRequestDelete(
			ServerContext* context,
			const HandlerRequest* request,
			HandlerReply* reply
		) {
		
			try
			{
				std::string ssql = "DELETE FROM VEHICLE WHERE ID = '"; 
				ssql.append(request->vehicle().vehicleid()); 
				ssql.append(std::string("';"));
				
				char* sql = new char[ssql.length()];
				sql = (char*) ssql.c_str(); 
				Dbms* d  = new Dbms();
				if(d->connect(""))
				{
					if(d->exec_query(sql,false,0))
					{
							reply->set_result(std::string("Successfully Deleted"));
							d->disconnect();
							return Status::OK;
					}
					else
					{
						
						reply->set_result(std::string("Delete failed"));
						
						d->disconnect();
						
					}
					
				}
			}
			catch(...)
			{
				reply->set_result(std::string("Delete failed"));
			}
			
			return Status::CANCELLED;
		}