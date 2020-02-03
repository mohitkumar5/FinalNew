package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
public class Spoc_CheckLogin {
	@RequestMapping(value="/Spoc_CheckLogin" , method = RequestMethod.POST)
	public ModelAndView check(HttpServletRequest request, HttpServletResponse response)
	{
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String role=request.getParameter("login-select");
		
		System.out.println(name +" \t"+password+"   "+role);
		String message="Done";
		
	
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
		        Statement ps=con.createStatement();
				ResultSet rs= ps.executeQuery("select password from logindata where username = '"+name+"' and password='"+password+"' and role='"+role+"'");
				
				if(rs.next()){
					String checkpass=rs.getString(1);
					System.out.println(checkpass);
					HttpSession session=request.getSession();
					session.setAttribute("name", name);
					
					return new ModelAndView("Spoc_MainPage.jsp","message",this.getResult1(con));
				}
				else {
					message="Invalid Credentials !";
					return new ModelAndView("Spoc_Login.jsp","message",message);
				}
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				message="Invalid Credentials !";
				return new ModelAndView("Spoc_Login.jsp","message",message);
			}
			
			
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