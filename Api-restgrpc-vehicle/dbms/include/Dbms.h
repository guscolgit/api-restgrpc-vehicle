#ifndef DBMS_H
#define DBMS_H
#include <iostream>
#include <sqlite3.h>
#include <vector>

using namespace std;
//using namespace pqxx;

class Dbms
{
    public:
        Dbms();
        virtual ~Dbms();
        bool connect(std::string dir);
        void disconnect();
        bool exec_query(char* sql, bool bcallback, void* data  );
		  static int callback(void *data, int argc, char **argv, char **azColName)
		  {
   
			   try{
				   int i;
				   std::vector<std::pair<std::string,std::string > >* qdata = (std::vector<std::pair<std::string,std::string > >*) data;
				   std::pair<std::string,std::string > argvs;
				   for(i = 0; i<argc; i++){
				      argvs.first = (std::string) azColName[i];
				      if (argv[i])
				      { 
				      	argvs.second = (std::string) argv[i];
				      }
				      else
				      {
				      	argvs.second = std::string("NULL");
				      }
				      qdata->push_back(argvs);
				   }
				}
				catch (const std::exception &e){
			      cerr << e.what() << std::endl;
			   }
		   return 0;
		}
    protected:
        void query_normal();
        void query_prepared();

    private:
    	  sqlite3 *db;


};

#endif // DBMS_H
