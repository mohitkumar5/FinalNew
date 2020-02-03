package com.m1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 * Servlet implementation class Pmlogin
 */
@Controller
public class sendid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@RequestMapping("/p")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("-------------------------");
		String id = request.getParameter("reqid");
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
		//PreparedStatement stmt = null;
		ResultSet resultSet = null;
		Statement s=null;
		try{ 
			connection = DriverManager.getConnection(connectionUrl, userId, password);
			s=connection.createStatement();		 	
			String sql="commit";
			

			//String s1="update pmrq set status='Started' where status='Approved' and reqid="+reqid;
			 int i=s.executeUpdate("update pmrq set status='Started',sg_trainer='"+request.getParameter("t_name")+"',city='"+request.getParameter("t_city")+"',training='"+request.getParameter("t_type")+"'  where reqid="+id);
			 System.out.println(" PM   -------------updated..."+i);
			 response.sendRedirect("operations.jsp");
			 
		}
			 catch (Exception e) {
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
