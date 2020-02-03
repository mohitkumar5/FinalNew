package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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

@Controller
public class ExecutiveInfo {
	
	@RequestMapping(value="/ExExecutiveInfo" , method = RequestMethod.POST)
	public ModelAndView ExExecutiveInfo(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		
		String tech=request.getParameter("techName");
		session.setAttribute("Technology", tech);
		session.setAttribute("CompleteData", this.getCompleteData(tech));
		return new  ModelAndView("ExExecutiveDash","data",this.getTechData(tech));
	}
	@RequestMapping(value="/ExNewExecutiveInfo" , method = RequestMethod.POST)
	public ModelAndView ExNewExecutiveInfo(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String tech=(String) session.getAttribute("Technology");
		return new  ModelAndView("ExExecutiveDash","data",this.getTechData(tech));
	}
	
	@RequestMapping(value="/ExNewAttendanceInfo" , method = RequestMethod.POST)
	public ModelAndView ExNewAttendanceInfo(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String rid= (String) session.getAttribute("Technology");
		System.out.println("rid"+rid);
		return new  ModelAndView("ExExecutiveDash","data",this.getTechData(rid));
	}
	
	
	public ArrayList<Map> getTechData(String tech) {
		
		ArrayList<Map> al = new ArrayList<>();
		try {
			
	        Connection con=ConnectionClass.getCon();
	        Statement ps=con.createStatement();
			ResultSet rs= ps.executeQuery("select * from pmrq where domain = '"+tech+"' and status='Started'");
			while(rs.next())
			{
				Map map = new HashMap(); 
				map.put("ReqId", rs.getInt(1));
				map.put("Domain", rs.getString(2));
				map.put("Trainer", rs.getString(3));
				map.put("StDt", rs.getDate(4).toString().substring(0,10));
				//map.put("EnDt", rs.getDate(5).toString().substring(0,10));
				//map.put("RqDt", rs.getDate(6).toString().substring(0,10));
				al.add(map);
				System.out.println("my map"+map);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			
		}
		
		return al;
		
	}
public ArrayList<Map> getCompleteData(String tech) {
		
		ArrayList<Map> al = new ArrayList<>();
		try {
			
	        Connection con=ConnectionClass.getCon();
	        Statement ps=con.createStatement();
			ResultSet rs= ps.executeQuery("select * from pmrq where domain = '"+tech+"' and status='complete'");
			while(rs.next())
			{
				Map map = new HashMap(); 
				map.put("ReqId", rs.getInt(1));
				map.put("Domain", rs.getString(2));
				map.put("Trainer", rs.getString(3));
				map.put("StDt", rs.getDate(4).toString().substring(0,10));
				map.put("EnDt", rs.getDate(5).toString().substring(0,10));
				//map.put("RqDt", rs.getDate(6).toString().substring(0,10));
				al.add(map);
				System.out.println("my map"+map);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return al;
		
	}

}
