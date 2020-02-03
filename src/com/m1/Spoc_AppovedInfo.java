package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Spoc_AppovedInfo {
	
	@RequestMapping(value="/ApprovedInfo")
	public ModelAndView ApproveData() {
		
		return new  ModelAndView("Spoc_ApprovedInfo","data",this.getTechData());
	}

public ArrayList<Map> getTechData() {
		
		ArrayList<Map> al = new ArrayList<>();
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
			ResultSet rs= ps.executeQuery("select * from pmrq where status= 'Approved' or status='Started'");
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

