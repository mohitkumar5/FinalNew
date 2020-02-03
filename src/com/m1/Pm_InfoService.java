package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Pm_InfoService {
	
	public ArrayList<Map> getTechData(int rid) {
		ArrayList<Map> al = new ArrayList<>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
	        Statement ps=con.createStatement();
	        
	        ResultSet rs= ps.executeQuery("select * from pmrq where reqid="+rid);
	        while(rs.next())
			{
	        	Map map = new HashMap(); 
				map.put("ReqId", rs.getInt(1));
				map.put("EmpId", rs.getString(2));
				map.put("Ename", rs.getString(3));
				map.put("StDt", rs.getDate(4).toString().substring(0,10));
				map.put("EnDt", rs.getDate(5).toString().substring(0,10));
				map.put("RqDt", rs.getDate(6).toString().substring(0,10));
				map.put("Status", rs.getString(7));
				map.put("NoEmp", rs.getInt(8));
				map.put("Tr_type", rs.getString(9));
				map.put("city", rs.getString(10));
				System.out.println("At map is"+map);
				System.out.println("Data "+rs.getString(1));
				al.add(map);
			}
	        
		}catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

}
