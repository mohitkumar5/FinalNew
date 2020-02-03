package com.m1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
import org.springframework.web.servlet.ModelAndView;

/**
 * Servlet implementation class Reqcheck
 */
@Controller
public class Reqcheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reqcheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @RequestMapping("/reqcheck")
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
		Statement s;
		try{ 
			connection = DriverManager.getConnection(connectionUrl, userId, password);


				
					
					// String topic= request.getParameter("vertical");
					 String topic1 = request.getParameter("domain");
					 String st= request.getParameter("start");
					 Date start=new SimpleDateFormat("dd-MM-yyyy").parse(st);
					 
					 java.sql.Date sqlDate=new java.sql.Date(start.getTime());
					 
					 String e= request.getParameter("end");
			         Date end=new SimpleDateFormat("dd-MM-yyyy").parse(e);
					 
					 java.sql.Date sqlDate1=new java.sql.Date(end.getTime());
					 String no= request.getParameter("noemp");
					 int noemp=Integer.parseInt(no);
					 String sgtrain = request.getParameter("sgtrain");
				
					 java.sql.Date t = new java.sql.Date(Calendar.getInstance().getTime().getTime());
					 
					 String ttype= request.getParameter("ttype");
					 String ct = request.getParameter("city");
					 
					 

			s=connection.createStatement();		 	
			String sql="commit";
			

			stmt=connection.prepareStatement("insert into pmrq(reqid,domain,sg_trainer,stdt,endt,reqdt,status,noemp,training,city)values(rqsq.nextval,?,?,?,?,?,'Request',?,?,?)");  
			//1 specifies the first parameter in the query  
			stmt.setString(1,topic1); 
			stmt.setString(2,sgtrain);
			stmt.setDate(3, sqlDate);
			stmt.setDate(4, sqlDate1);
			stmt.setDate(5,t);
			//stmt.setString(6);
			stmt.setInt(6,noemp);
			stmt.setString(7,ttype);
			stmt.setString(8,ct);
			//stmt.setString(9,topic1);

			int i=stmt.executeUpdate(); 
			s.execute(sql);
			System.out.println("execute");
			
			if(i==1)
			{
				response.sendRedirect("operations.jsp");

			}
			else
			{
				System.out.println(" not executed");
			}
			System.out.println(i+" records inserted");  
			
			System.out.println("Inserted successfully");
			

			} catch (Exception e) {
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
