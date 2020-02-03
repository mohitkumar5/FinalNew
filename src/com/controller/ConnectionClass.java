package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionClass {

	public static Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
        Statement ps=con.createStatement();
        return con;
	}
	
}
