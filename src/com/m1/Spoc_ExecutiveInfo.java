package com.m1;

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
public class Spoc_ExecutiveInfo {
	
	@RequestMapping(value="/Spoc_ExInfo" , method = RequestMethod.POST)
	public ModelAndView ExecutiveInfo(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		
		String tech=request.getParameter("techName");
		session.setAttribute("Technology", tech);
		session.setAttribute("CompleteData", this.getTechData(tech));
		return new  ModelAndView("Spoc_ExecutiveDash","data",this.getTechData(tech));
	}
	
	
	
	public ArrayList<Map> getTechData(String tech) {
		
		ArrayList<Map> al = new ArrayList<>();
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
			ResultSet rs= ps.executeQuery("select * from pmrq where domain = '"+tech+"'");
			while(rs.next())
			{
				Map map = new HashMap();
				map.put("ReqId", rs.getInt(1));
				map.put("Domain", rs.getString(2));
				map.put("Trainer", rs.getString(3));
				map.put("StDt", rs.getDate(4).toString().substring(0,10));
				map.put("EnDt", rs.getDate(5).toString().substring(0,10));
				map.put("RqDt", rs.getDate(6).toString().substring(0,10));
				map.put("Status", rs.getString(7));
				map.put("NoEmp", rs.getInt(8));
				al.add(map);
				System.out.println("my map"+map);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			
		}
		
		return al;
		
	}

}
