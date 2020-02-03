package com.m1;
import com.controller.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.controller.CheckLogin;
@Controller
public class Spoc_ApproveData {

	@RequestMapping("/Spoc_approve")
	public ModelAndView dataApprove(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		
		int id = Integer.parseInt(request.getParameter("man_id"));
		String Vertical = request.getParameter("man_ver");
		String  tch = request.getParameter("man_tech");
		//int trid= Integer.parseInt(request.getParameter("tr_id"));
		String trname = request.getParameter("tr_name");
		int notr = Integer.parseInt(request.getParameter("trainee_no"));
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
		String city = request.getParameter("tr_city");
		System.out.println(request.getParameter("status"));

		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
			//PreparedStatement st1= con.prepareStatement("insert into spoc_resp(rid,vertical,tech,trname,no_tr,strdate,enddate,room,city) values(?,?,?,?,?,?,?,?,?)");
			PreparedStatement st1=con.prepareStatement("insert into spoc_resp(rid,vertical,tech,trname,no_tr,strdate,enddate,room,city) values(?,?,?,?,?,?,?,?,?)");
			st1.setInt(1, id);
			st1.setString(2, Vertical);
			st1.setString(3,tch);
			st1.setString(4, trname);
			st1.setInt(5, notr);
			st1.setDate(6, t7);
			st1.setDate(7, t8);
			st1.setString(8, room);
			st1.setString(9, city);
			
			int i =st1.executeUpdate();
			System.out.println(i);
			
			
			st1 = con.prepareStatement("update spoc_resp set status='Approved' where rid = ?");
			//st1.setString(1,request.getParameter("status"));
			st1.setInt(1, id);
			st1.executeUpdate();
			
			st1 = con.prepareStatement("update pmrq set status= 'Approved' where status = ? and reqid = ?");
			st1.setString(1,request.getParameter("Status"));
			st1.setInt(2, id);
			st1.executeUpdate();
	        }
		catch (Exception e) {
			e.printStackTrace();
		}
		
		CheckLogin chk = new CheckLogin();
		Connection con;
		try {
			con = ConnectionClass.getCon();
			return new ModelAndView("Spoc_MainPage","message",chk.getResult1(con));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
		
	}
}
