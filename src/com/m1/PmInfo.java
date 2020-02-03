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
public class PmInfo {
	
	@RequestMapping(value="/PmInfo")
	public ModelAndView PmInfo(HttpServletRequest request, HttpServletResponse response) {
		ArrayList a=new ArrayList();
		int count=0;
		int reqid=Integer.parseInt(request.getParameter("reqid"));
		
		System.out.println("Request id"+reqid);
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        
	        
	        
	        ResultSet rs3 = ps.executeQuery("Select count(*) as count from spoc_resp where status='Approved' and rid="+reqid);
		       
	        while(rs3.next())
	        {
	        	count =  rs3.getInt("count");
	        }
	        System.out.println("The count is : "+count);
	       
	        if(count > 0)
	        {
	        	//ResultSet rs= ps.executeQuery("select * from pmrq where reqid="+reqid);
	        	ResultSet rs1= ps.executeQuery("select * from spoc_resp where status='Approved' and rid="+reqid);
	        	// System.out.println("rs -- "+rs);
	        	System.out.println("rs 234 -- "+rs1);
	        	
	        		while(rs1.next())
	        		{
	        			int rq= rs1.getInt(1);
	        			String vr=rs1.getString(2);
	        			String tech=rs1.getString(3);
		        		int trid=rs1.getInt(4);
		        		String trnm=rs1.getString(5);
		        		int no_tr=rs1.getInt(6);
		        		String stdt=rs1.getDate(7).toString().substring(0,10);
		        		String endt=rs1.getDate(8).toString().substring(0,10);
		        		String room=rs1.getString(9);
		        		String city=rs1.getString(10);
		            	String st=rs1.getString(11);
		            	
		            	a.add(count);
		            	a.add(rq);
		            	a.add(vr);
		            	a.add(tech);
		            	a.add(trid);
		            	a.add(trnm);
		           		a.add(no_tr);
		           		a.add(stdt);
		           		a.add(endt);
		           		a.add(room);
		           		a.add(city);
		           		a.add(st);
		           		
	    
		        	}
		        	System.out.println("This is on Spoc "+a);
				}
	        	else
	        	{
	        		System.out.println("No record has been selected"+count);
	        		a.add(count);
	        	}
	        
	        	ResultSet rs= ps.executeQuery("select * from pmrq where reqid="+reqid);
	        	System.out.println("rs -- "+rs);
	     
	        	while(rs.next())
	        	{
	        		int reqid1= rs.getInt(1);
	        		String dom=rs.getString(2);
	        		String sg=rs.getString(3);
	        		String s=rs.getDate(4).toString().substring(0,10);
	        		String e=rs.getDate(5).toString().substring(0,10);
	        		String r=rs.getDate(6).toString().substring(0,10);
	        		String st=rs.getString(7);
	        		int no=rs.getInt(8);
	        		String t=rs.getString(9);
	            	String city=rs.getString(10);
	            	
	            	
	            	
	            	a.add(reqid1);
	            	a.add(dom);
	            	a.add(sg);
	           		a.add(s);
	           		a.add(e);
	           		a.add(r);
	           		a.add(st);
	           		a.add(no);
	           		a.add(t);
	           		a.add(city);
	           		
	           		
				
	        	}
	        	
	        		        	
	        	System.out.println("This is on PmInfo "+a);
			}
			catch (Exception e) {
				System.out.println("In the catch");
				e.printStackTrace();
			}
		
		return new  ModelAndView("view","data",a);
		
	}

}
