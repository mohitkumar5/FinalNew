package com.m1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Pmlogin
 */
//@Controller
public class Pmlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pmlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//@RequestMapping("/pmlogin")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
			String id = request.getParameter("pid");
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String connectionUrl = "jdbc:oracle:thin:@172.19.100.45:1521/xe";
			String dbName = "xe";
			String userId = "system";
			String password = "root";

			try {
			Class.forName(driverName);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}

			Connection connection = null;
			PreparedStatement stmt = null;
			ResultSet resultSet = null;
			
			try{ 
				connection = DriverManager.getConnection(connectionUrl, userId, password);


					
				 		String role= request.getParameter("login-select");
						 String user= request.getParameter("username");
						 String pass= request.getParameter("password");
						 
			
							PreparedStatement ps=connection.prepareStatement(  
									"select * from logindata where role=?,username=? and password=?");  
									ps.setString(1,role);  
									ps.setString(2,user);
									ps.setString(3,pass);
									 resultSet=ps.executeQuery();  
							
							
						/*while(resultSet.next())
					{
						resultSet.getString(role) ;
						resultSet.getString(user) ;
						resultSet.getString(pass);
					}*/
									 System.out.println("hiiiiiiiiiii");
						System.out.println(resultSet);

				
		
	
	}
			catch (Exception e) {
				 System.out.println("hiiiiiiiiiii catch");
				e.printStackTrace();
				}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
