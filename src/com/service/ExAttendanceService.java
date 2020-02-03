package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.controller.ConnectionClass;

public class ExAttendanceService {
	
	public ArrayList<Map> getTechData(int rid) {
		ArrayList<Map> al = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        ResultSet rs= ps.executeQuery("select * from empdetails where reqid="+rid);
	        while(rs.next())
			{
	        	Map map = new HashMap(); 
				map.put("EmpId", rs.getInt(2));
				map.put("Ename", rs.getString(3));
				map.put("Esal", rs.getString(3));
				System.out.println("At map is"+map);
				System.out.println("Attendance Data "+rs.getString(1));
				al.add(map);
			}
	        
		}catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public static ArrayList<Integer> getAssessmentCounts(int rid){
		ArrayList al=new ArrayList();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        ResultSet rs= ps.executeQuery("select testid from testdetails where reqid="+rid);
	        while(rs.next())
			{	
				al.add(rs.getInt(1));
			}
	        
		}catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public static ArrayList<Map> getTestDetailsData(int rid) {
		ArrayList<Map> al = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        ResultSet rs= ps.executeQuery("select * from testdetails where testid="+rid);
	        while(rs.next())
			{
	        	Map map = new HashMap(); 
				map.put("TestId", rs.getInt(1));
				map.put("ReqId", rs.getInt(2));
				map.put("TestDate", rs.getString(3));
				map.put("PresentCount", rs.getInt(4));
				map.put("AbsentCount", rs.getInt(5));
				System.out.println("At map is"+map);
				System.out.println("Attendance Data "+rs.getString(1));
				al.add(map);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public static ArrayList<Map> getTestResultsData(int rid) {
		ArrayList<Map> al = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        ResultSet rs= ps.executeQuery("select employeeid,grade from testresults where testid="+rid);
	        while(rs.next())
			{
	        	Map map = new HashMap(); 
				map.put("EmpId", rs.getInt(1));
				map.put("Grade", rs.getString(2));
				System.out.println("At map is"+map);
				System.out.println("Attendance Data "+rs.getString(1));
				al.add(map);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}
