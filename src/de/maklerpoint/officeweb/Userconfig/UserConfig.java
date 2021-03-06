package de.maklerpoint.officeweb.Userconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.context.SecurityContextHolder;

import de.maklerpoint.office.Benutzer.BenutzerObj;
import de.maklerpoint.officeweb.Database.DBCon;

public class UserConfig {

	public static String getValue(Connection con, String username, String which, String defvalue) {
		try {
			String sql = "SELECT * FROM webconfig WHERE username = ? AND which = ?";
			PreparedStatement statement = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			statement.setString(1, username);
			statement.setString(2, which);
			
			ResultSet entry = statement.executeQuery();

	        entry.last();
	        int rows = entry.getRow();
	        entry.beforeFirst();
	        
	        if(rows == 0) {
	            entry.close();
	            statement.close();
	            con.close();
	            return defvalue;
	        }
			
	        entry.next();
	        
	        String val = entry.getString("value");
	        
	        entry.close();
            statement.close();
            con.close();
	        
	        if(val != null)
	        	return val;
	        else
	        	return defvalue;
	        
		} catch (Exception e) {
			LogFactory.getLog(UserConfig.class).warn("Wert f��r " + which + " konnte nicht geladen werden.", e);
			return defvalue;
		}
	}
	
	public static String getValue(String which, String value) {
		return getValue(DBCon.open(), SecurityContextHolder.getContext().getAuthentication().getName(), which, value);
	}
	
	public static String getValue(String which) {
		return getValue(DBCon.open(), SecurityContextHolder.getContext().getAuthentication().getName(), which, null);
	}

	/**
	 * Setzt den Wert
	 * @param con
	 * @param username
	 * @param which
	 * @param value
	 */
	
	public static void setValue(Connection con, String username, String which, String value) {
		// TODO
		if(existsValue(DBCon.open(), username, which)) {
			try {			
				String sql = "UPDATE webconfig SET value = ? WHERE username = ? AND which = ?";
				PreparedStatement statement = con.prepareStatement(sql);
				
				statement.setString(1, value);
				statement.setString(2, username);
				statement.setString(3, which);
				
				statement.execute();
				statement.close();
		        con.close();
				
			} catch (Exception e) {
				LogFactory.getLog(UserConfig.class).warn("Wert f��r " + which + " konnte nicht gespeichert werden.", e);
			}			
		} else {			
			try {			
				String sql = "INSERT INTO webconfig (username, which, value) VALUES (?, ?, ?)";
				PreparedStatement statement = con.prepareStatement(sql);
				
				statement.setString(1, username);
				statement.setString(2, which);
				statement.setString(3, value);
				
				statement.execute();
				statement.close();
		        con.close();
				
			} catch (Exception e) {
				LogFactory.getLog(UserConfig.class).warn("Wert f��r " + which + " konnte nicht gespeichert werden.", e);
			}
		}
	}
	
	public static void setValue(String which, String defvalue) {
		setValue(DBCon.open(), SecurityContextHolder.getContext().getAuthentication().getName(), which, defvalue);
	}
	
	/**
	 * ��berpr��fung ob Wert schon in der DB existiert
	 * @param con
	 * @param username
	 * @param which
	 * @return
	 */
	
	public static boolean existsValue(Connection con, String username, String which) {
		try {
			String sql = "SELECT * FROM webconfig WHERE username = ? AND which = ?";
			PreparedStatement statement = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			statement.setString(1, username);
			statement.setString(2, which);
			
			ResultSet entry = statement.executeQuery();

	        entry.last();
	        int rows = entry.getRow();
	        entry.beforeFirst();
	        
	        entry.close();
            statement.close();
            con.close();
	        
	        if(rows == 0) {	            
	            return false;
	        } else {
	        	return true;
	        }
	        
		} catch (Exception e) {
			LogFactory.getLog(UserConfig.class).warn("Wert f��r " + which + " konnte nicht ��berpr��ft werden.", e);
			return false;
		}
	}
}
