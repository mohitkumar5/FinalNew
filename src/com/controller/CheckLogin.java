package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CheckLogin {
	@RequestMapping(value="/ExCheckLogin" , method = RequestMethod.POST)
	public ModelAndView Excheck(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("Hey first line");
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String role=request.getParameter("login-select");
		
		System.out.println(name +" \t"+password+"   "+role);
		String message="Done";
		try {
			
	        Connection con=ConnectionClass.getCon();
	        Statement ps=con.createStatement();
			ResultSet rs= ps.executeQuery("select password from logindata where username = '"+name+"' and password='"+password+"' and role='"+role+"'");
			
			if(rs.next()){
				String checkpass=rs.getString(1);
				System.out.println(checkpass);
				HttpSession session=request.getSession();
				session.setAttribute("name", name);
				
				if(role.equals("Project Manager")) {
					return new ModelAndView("operations");
				}
				else if(role.equals("LnD")) {
					return new ModelAndView("Spoc_MainPage","message",this.getResult1(con));
				}
				else {
					return new ModelAndView("index","message",this.getResult(con));
				}
				
			}
			else {
				message="Invalid Credentials !";
				return new ModelAndView("Login","message",message);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			message="Invalid Credentials !";
			return new ModelAndView("Login","message",message);
		}
		
		
	}
	public ArrayList<String> getResult(Connection con) {
		
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select distinct(domain) from pmrq where status='Started'");
			ArrayList<String> tech=new ArrayList();
			while(rs.next()) {
				tech.add(rs.getString(1));
			}
			return tech;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public ArrayList<String> getResult1(Connection con) {
		
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select distinct(domain) from pmrq where status = 'Request'");
			ArrayList<String> tech=new ArrayList();
			while(rs.next()) {
				tech.add(rs.getString(1));
			}
			return tech;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
}
