package de.maklerpoint.officeweb.Database;

import java.sql.Connection;

import de.maklerpoint.officeweb.Database.MySQl.DBMySQL;

public class DBCon extends Thread {

	public static String dburl = "jdbc:mysql://" + "localhost" + "/acyrancecrm";
	
	public static Connection open(){
//        if(Config.getConfigBoolean("offlineModus", false) || Config.getConfigInt("databaseType",
//                                         DatabaseTypes.MYSQL) == DatabaseTypes.EMBEDDED_DERBY) {
//            return openLocalDB();
//        } else {
//            return openExternal();
//        }
		
		return openExternal();
    }
	
	
	public static Connection openExternal(){				
		Connection conn = null;
		
		try {
			conn = (new DBMySQL()).connect(new DBHelper(dburl, "root", "l4sv!t0s"));
		} catch (Exception e) {
			System.err.println("Exception: " + e);
		}
		
		return conn;		
	}
    
	
}
