package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;






public class DBManagement {
	private Connection conn;
	private final String DRIVER ;
	private final String _dbURL;
	private final String _username;
	private final String _password;
	private final String _dbname;
	
	public DBManagement() throws IOException {
		System.out.println(new File(".").getAbsolutePath());
		Properties props = new Properties();
		props.load(new FileInputStream("oracleDB.properties"));
		
		_username = props.getProperty("username");
		_password = props.getProperty("password");
		_dbURL = props.getProperty("dburl");
		_dbname = props.getProperty("dbname");
		DRIVER = props.getProperty("driver_class");
		System.out.println(_username +_password+_dbURL+_dbname+DRIVER);
		}

	public void setConnection() throws SQLException,ClassNotFoundException, NamingException {
		
			 Class.forName(DRIVER);
			 conn = DriverManager.getConnection(_dbURL,_username,_password);
			 System.out.println(String.format(" %s Database:got connection as %s\n"
					, _dbname
					, _username));
					/*   InitialContext initContext = null;
			 Context envContext = null;
			 initContext = new InitialContext();
			 envContext = (Context)initContext.lookup("java:comp/env");
			 DataSource ds = (DataSource)envContext.lookup("jdbc/scott");
		     conn = ds.getConnection();;*/	
		  
	}
	public ResultSet getResultSet(String query) throws SQLException
	{
		ResultSet rs=null;
		Statement stmt=conn.createStatement();
		rs=stmt.executeQuery(query);	
		return rs;	
	}
	public void closeConnection() throws SQLException
	{
			if(conn!=null)
				conn.close();	
	}
	public int getAffectedRows(String query) throws SQLException
	{
		Statement stmt=null;
		int rows=0;
		stmt=conn.createStatement();
		rows=stmt.executeUpdate(query);
		return rows;
		
	}
	public String getConnectionDetails() {

		return String.format("%s Database:attempting connection as %s\n"
				, _dbname
				, _username);
		
	}
	public Connection getConn() {
		return conn;
	}
}


