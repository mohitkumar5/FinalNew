package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class PmInfo2 {
	
	@RequestMapping(value="/PmInfo1")
	public ModelAndView PmInfo2(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<String> a=new ArrayList<String>();
		String dom=null;
		//int reqid=Integer.parseInt(request.getParameter("reqid"));
		//System.out.println("Request id"+reqid);
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        ResultSet rs= ps.executeQuery("select distinct(domain) as diff_courses from pmrq");
        	System.out.println("rs -- "+rs);
     
        	while(rs.next())
        	{
        		 //Map map=new HashMap<>();
        		 dom=rs.getString("diff_courses");
        		 a.add(dom);
        	}
	        
		}
		catch (Exception e) {
			System.out.println("In the catch");
			e.printStackTrace();
		}
		
			return new ModelAndView("id1","data2",a);
		
	}

}
