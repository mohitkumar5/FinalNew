package com.m1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.controller.CheckLogin;

@Controller
public class Spoc_dashboard {

	@RequestMapping("Dash")
	public ModelAndView Dashboard() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@172.19.100.45:1521:xe","system","root");
			CheckLogin chk = new CheckLogin();
			ArrayList<String> arr = chk.getResult1(con);
			return new ModelAndView("MainPage","message",arr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
