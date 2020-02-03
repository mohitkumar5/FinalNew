package com.m1;

import java.io.IOException;
import java.io.PrintWriter;
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
@Controller
public class Pm_afterangular extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pm_afterangular() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@RequestMapping("/angular")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();  
        response.setContentType("text/html");  
        out.println("<html><body>");  
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
			ResultSet rs = null;
			
			try{ 
				connection = DriverManager.getConnection(connectionUrl, userId, password);


						 
			
							PreparedStatement ps=connection.prepareStatement(  
									"select * from pmrq where domain='Java'");  
									
									 rs=ps.executeQuery(); 	
									 
					
									 System.out.println("hi");
									 System.out.println(rs);
									 out.println("<table border=1 width=50% height=50%>");  
						             out.println("<tr><th>ReqId</th><th>Domain</th><th>Sg trainer</th><th>start</th><th>end</th><th>Req date</th><th>status</th><th>noemp</th></tr>");  
									 while(rs.next())  
							         {  
										 int r=rs.getInt("reqid"); 
							            String d=rs.getString("domain");  
							            String t=rs.getString("sg_trainer");  
							            Date d1=rs.getDate("stdt");  
							            Date d2=rs.getDate("endt");
							            Date d3=rs.getDate("reqdt");
							            String st=rs.getString("status");
							            int no=rs.getInt("noemp"); 
							            
							     System.out.println(r+" "+d + " "+t+" "+d1+" "+d2+" "+d3+" "+st+" "+no);  
							     out.println("<tr><td>" + r+ "</td><td>" +d + "</td><td>" + t + "</td><td>"+d1+"</td><td>"+d2+"</td><td>"+d3+"</td><td>"+st+"</td><td>"+no+"</td><td>"+"<a href='id1.jsp'>Next</a>");   
						             }  
						             out.println("</table>");  
						             out.println("</html></body>"); 
							     
							       
						
						
						
	
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
