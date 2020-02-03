package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.controller.ConnectionClass;

@Controller
public class Spoc_FivalApprove {
	
	@RequestMapping("/FinalApprove")
	public ModelAndView FinalApprove(HttpServletRequest request, HttpServletResponse response) throws ParseException, ClassNotFoundException, SQLException {
		
		com.controller.CheckLogin c = new com.controller.CheckLogin();
		int id = Integer.parseInt(request.getParameter("id"));
		String Vertical = request.getParameter("vertical");
		String  tch = request.getParameter("tech");
		int trid= Integer.parseInt(request.getParameter("trainID"));
		String trname = request.getParameter("trainName");
		int notr = Integer.parseInt(request.getParameter("no_tr"));
		String st= request.getParameter("str_date");
		String et = request.getParameter("end_date");
//		LocalDateTime myDateObj = LocalDateTime.now();  
//	    System.out.println("Before Formatting: " + myDateObj);  
//	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MMM-yyyy");  
//	    String formattedDate = myDateObj.format(myFormatObj);
		java.util.Date start= new SimpleDateFormat("yyyy-MM-dd").parse(st);
    	java.sql.Date t7=new java.sql.Date(start.getTime());
//		String st1= request.getParameter("end_date");
		java.util.Date End= new SimpleDateFormat("yyyy-MM-dd").parse(et);
		java.sql.Date t8=new java.sql.Date(End.getTime());
		String room = request.getParameter("tr_room");
		String city = request.getParameter("city");

		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
			//PreparedStatement st1= con.prepareStatement("insert into spoc_resp(rid,vertical,tech,trname,no_tr,strdate,enddate,room,city) values(?,?,?,?,?,?,?,?,?)");
			PreparedStatement st1=con.prepareStatement("insert into spoc_resp(rid,vertical,tech,trid,trname,no_tr,strdate,enddate,room,city) values(?,?,?,?,?,?,?,?,?,?)");
			st1.setInt(1, id);
			st1.setString(2, Vertical);
			st1.setString(3,tch);
			st1.setInt(4, trid);
			st1.setString(5, trname);
			st1.setInt(6, notr);
			st1.setDate(7, t7);
			st1.setDate(8, t8);
			st1.setString(9, room);
			st1.setString(10, city);
			
			int i =st1.executeUpdate();
			System.out.println(i);
			
			
			st1 = con.prepareStatement("update spoc_resp set status='Approved' where rid = ?");
			//st1.setString(1,request.getParameter("status"));
			st1.setInt(1, id);
			st1.executeUpdate();
			
			st1 = con.prepareStatement("update pmrq set status= 'Approved'   where reqid= ?");
			//st1.setString(1,request.getParameter("Status"));
			st1.setInt(1, id);
			st1.executeUpdate();
	        }
		catch (Exception e) {
			e.printStackTrace();
		}
		
		Connection con=ConnectionClass.getCon();
		
		return new ModelAndView("Spoc_MainPage","message",c.getResult1(con));
		
		
	}

}
