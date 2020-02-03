package com.controller;

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
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.service.ExAttendanceService;

@Controller
public class AttendanceInfo {
	
	@RequestMapping(value="/ExAttendanceInfo" , method = RequestMethod.POST)
	public ModelAndView ExAttendanceInfo(HttpServletRequest request, HttpServletResponse response)
	{
		ExAttendanceService attendanceservice = new ExAttendanceService();
		int rid=Integer.parseInt(request.getParameter("techId"));
		String domain=request.getParameter("domain");
		String trainer=request.getParameter("trainer");
		HttpSession session=request.getSession();
		session.setAttribute("rid", rid);
		session.setAttribute("trainer", trainer);
		session.setAttribute("domain", domain);
		System.out.println(rid);
		
		return new  ModelAndView("ExAttendanceDash","data",attendanceservice.getTechData(rid));
	}
	
	
	@RequestMapping(value="/ExCourseComplete" , method = RequestMethod.POST)
	public void ExCourseComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		session.getAttribute("techName");
		int rid=Integer.parseInt(request.getParameter("techId"));
		try {
			
	        Connection con=ConnectionClass.getCon();
	        Statement ps=con.createStatement();
	        ps.executeUpdate("update pmrq set status='complete' where reqid="+rid);
	        con.close();
			String techName=(String) session.getAttribute("techName");
			System.out.println("this is tech"+techName);
		}catch (Exception e) {
			// TODO: handle exception
		}
		String techName=(String) session.getAttribute("Technology");
		System.out.println("this is tech"+techName);
		request.setAttribute("Technology", techName);
		RequestDispatcher rd = request.getRequestDispatcher("/ExNewExecutiveInfo");
		rd.forward(request,response);
		
	}
	
}
