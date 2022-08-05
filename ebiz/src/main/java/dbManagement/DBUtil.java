package dbManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	
//	database connection
//	statement to interact with d.
	Connection dbconnection= null;
	Statement statement = null;
	ResultSet rs = null;
	
//	database connection details
	String url = "jdbc:mysql://localhost:3306/ebiz";
	String username = "root";
	String password = "";
	
//	database provider type
	String dbProvider = "com.mysql.cj.jdbc.Driver";
	
	
	public Connection getDBConnection() {
		
		try {
			Class.forName(dbProvider);
			dbconnection = DriverManager.getConnection(url,username,password);
			return dbconnection;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dbconnection;
	}
	
	public ResultSet getData(String sql) {
		try {
			statement = getDBConnection().createStatement();
			rs = statement.executeQuery(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
		return rs;
	}
	public void closeConnections() throws SQLException {
		dbconnection.close();
		statement.close();
	}
	
	

}
