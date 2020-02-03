#include "../include/Dbms.h"

Dbms::Dbms()
{
    //ctor
}

Dbms::~Dbms()
{
    //dtor
}

bool Dbms::connect(std::string dir)
{
     try{
     	std::string sdir = dir+std::string("vehicles.db");
     	const char* direction = sdir.c_str();
      int	rc = sqlite3_open(direction, &(this->db));
      if (!rc) {
         cout << "Opened database successfully: vehicle.db" << endl;
         return true;
      } else {
         cout << "Can't open database" << endl;
      }
   }catch (const std::exception &e){
      cerr << e.what() << std::endl;
      
   }
   return false;
      
}
void Dbms::disconnect()
{
    sqlite3_close(this->db);
}

bool Dbms::exec_query(char* sql, bool bcallback ,void *data)
{
    try{
	    	char *zErrMsg = 0;
	   			int rc;
	   	if(bcallback)
	   		rc = sqlite3_exec(db, sql, Dbms::callback, (void *) data, &zErrMsg);
	   	else
	    		rc = sqlite3_exec(db, sql, 0, 0, &zErrMsg);
	    	if( rc != SQLITE_OK ){
		      cout <<"SQL error: " << zErrMsg << endl;
	      	sqlite3_free(zErrMsg);
	      	    	
		   } else {
		      cout << "Query executed successfully" << endl;
		      return true;
		   }
    }catch (const std::exception &e){

      cerr << e.what() << std::endl;
      
   }
   return false;
}




