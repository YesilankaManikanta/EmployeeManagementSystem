package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection implements DBinfo{
	public static Connection getConnect() {
		Connection con=null;
		try {
			Class.forName(Driver);
			con=DriverManager.getConnection(Dburl,Dbuname,Dbpwd);	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}
	

}
