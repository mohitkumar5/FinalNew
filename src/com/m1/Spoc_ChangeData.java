package com.m1;

import com.service.Spoc_InfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class Spoc_ChangeData {

	@RequestMapping(value="/Spoc_change" , method = RequestMethod.POST)
	public ModelAndView ChangeData(HttpServletRequest request, HttpServletResponse response)
	{
		Spoc_InfoService info = new Spoc_InfoService(); 
		int rid=Integer.parseInt(request.getParameter("man_id"));
		String domain=request.getParameter("man_ver");
		String trainer=request.getParameter("tr_name");
		HttpSession session=request.getSession();
		session.setAttribute("rid", rid);
		session.setAttribute("trainer", trainer);
		session.setAttribute("domain", domain);
		System.out.println(rid);
		
		return new  ModelAndView("Spoc_change","data",info.getTechData(rid));
	}
}
