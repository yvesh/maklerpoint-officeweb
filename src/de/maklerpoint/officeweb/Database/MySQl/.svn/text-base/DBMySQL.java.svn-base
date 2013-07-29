package de.maklerpoint.officeweb.Database.MySQl;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.sql.DataSource;

import de.maklerpoint.officeweb.Database.DBDrivers;
import de.maklerpoint.officeweb.Database.DBHelper;


public class DBMySQL {

	 public Connection connect(DBHelper dbcreds) throws Exception {
	        Class.forName(DBDrivers.MySQLDriver);
	        try{
	            return DriverManager.getConnection(dbcreds.getConnectionURL(), dbcreds.getUsername(), dbcreds.getPassword());
	        } catch(Exception ex){
	        	return null;
	        }	        
	 }
	 
	 public static String buildMysqlLimit(int limit, int offset) {
	        String build = "LIMIT " + offset + ", " + limit;
	        return build;
	    }
	
}
