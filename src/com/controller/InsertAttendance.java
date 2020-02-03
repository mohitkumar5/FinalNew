package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InsertAttendance {
	
	@RequestMapping(value="/ExInsertAttendance" , method = RequestMethod.POST)
	public void ExInsertAttendance(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session=request.getSession();
		
		int rid=(int) session.getAttribute("rid");
		String domain=(String) session.getAttribute("domain");
		String trainer=(String) session.getAttribute("trainer");
		
		ArrayList a = (ArrayList) session.getAttribute("AttData");
		
		LocalDate myObj = LocalDate.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
		String formattedDate = myObj.format(myFormatObj);
		String message="";
		System.out.println(formattedDate);
		
		try {
			
	        Connection con=ConnectionClass.getCon();
	        Statement ps=con.createStatement();
	        String sql="select * from attendance where requestid="+rid+" and adate='"+formattedDate+"'";
	        ResultSet rs=ps.executeQuery(sql);
	        int k=0;
	        if(rs.next()) {
	        	k++;
	        	message="Already Done";
	            
	        }
	        if(k==0) {
				 for(int i=0;i<a.size();i++){
					 String empid=String.valueOf(a.get(i));
					 String status=request.getParameter(empid);
					 System.out.println(empid + " "+status);
					 String query="insert into attendance values("+rid+",'"+trainer+"','"+domain+"','"+formattedDate+"','"+status+"',"+empid+")";
					 ps.executeUpdate(query);
					 message="Done";
				 }
	        }
		//return new  ModelAndView("AttendanceDash","data",this.getTechData(rid));
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("message", message);
		RequestDispatcher rd = request.getRequestDispatcher("/ExNewAttendanceInfo");
		rd.forward(request,response);
		
	}
	

}
