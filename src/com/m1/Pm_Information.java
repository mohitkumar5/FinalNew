package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.m1.Pm_InfoService;
@Controller
public class Pm_Information {
	@RequestMapping(value="/Info")
	public ModelAndView AttendanceInfo(HttpServletRequest request, HttpServletResponse response) {
	
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String connectionUrl = "jdbc:oracle:thin:@172.19.100.45:1521/xe";
	String dbName = "xe";
	String userId = "system";
	String password = "root";
	String domain;
	try {
	Class.forName(driverName);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}

	Connection connection = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	ArrayList<Map> al=new ArrayList<Map>();
	domain = request.getParameter("tewchno");
	System.out.println("Domain data"+domain);
	
		try{ 
			connection = DriverManager.getConnection(connectionUrl, userId, password);

						PreparedStatement ps=connection.prepareStatement("select * from pmrq where domain='"+domain+"'");  
								
								 rs=ps.executeQuery(); 	
								 
								 System.out.println("hi");
								 System.out.println(rs);
					// out.println("<table border=1 width=50% height=50%>");  
		            //out.println("<tr><th>ReqId</th><th>Domain</th><th>Technology</th><th>Start Data</th><th>End Date</th><th>Request Date</th><th>No. of Employee</th><th>Suggested Trainer</th></tr><th>Training</th><th>City</th><th>Status</th>");  
					 while(rs.next())  
			         {  
						 Map map=new HashMap<>();
						 //int r=rs.getInt("reqid"); 
						map.put("reqid",rs.getInt("reqid"));
			           // String d=rs.getString("domain");  
			            map.put("domain",rs.getString("domain"));
			            //String t=rs.getString("sg_trainer");
			            map.put("sg_trainer",rs.getString("sg_trainer"));
			            //Date d1=rs.getDate("stdt");
			            map.put("stdt",rs.getDate("stdt"));
			            //Date d2=rs.getDate("endt");
			            map.put("endt",rs.getDate("endt"));
			           // Date d3=rs.getDate("reqdt");
			            map.put("reqdt",rs.getDate("reqdt"));
			           // String st=rs.getString("status");
			            map.put("status",rs.getString("status"));
			            //int no=rs.getInt("noemp"); 
			            map.put("noemp",rs.getInt("noemp"));
			            //String t1=rs.getString("training");
			            map.put("training",rs.getString("training"));
			            //String c=rs.getString("city");
			            map.put("city",rs.getString("city"));
			            //String tech=rs.getString("tech");
			          
			            al.add(map);
			            
			            System.out.println("At map is"+map);
						//System.out.println("Data "+rs.getString(1));
		           
		           
			         }  
}
		catch (Exception e) {
			 System.out.println("hiiiiiiiiiii catch");
			e.printStackTrace();
			}

		
		return new  ModelAndView("afterjava1","data",al);
	}

}
