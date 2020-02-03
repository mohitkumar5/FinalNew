package com.m1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.service.Spoc_InfoService;

@Controller
public class Spoc_FinalInfo {

	
	@RequestMapping("/FinalInfo")
	public ModelAndView FinalData(HttpServletRequest request, HttpServletResponse response) {
		Spoc_InfoService info = new Spoc_InfoService(); 
		int rid=Integer.parseInt(request.getParameter("techId"));
		String domain=request.getParameter("domain");
		String trainer=request.getParameter("trainer");
		String status=request.getParameter("Status");
		HttpSession session=request.getSession();
		session.setAttribute("rid", rid);
		session.setAttribute("trainer", trainer);
		session.setAttribute("domain", domain);
		session.setAttribute("status", status);
		System.out.println(rid);
		
		return new  ModelAndView("Spoc_FinalData","data",info.getTechData(rid));
		
		
	}
}
