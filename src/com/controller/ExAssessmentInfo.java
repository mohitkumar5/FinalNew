package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.service.ExAttendanceService;
@Controller
public class ExAssessmentInfo {
	
	@RequestMapping(value="/ExAssessmentInfo" , method = RequestMethod.POST)
	public ModelAndView ExAssessmentInfo(HttpServletRequest request, HttpServletResponse response)
	{
		//AttendanceService attendanceservice = new AttendanceService();
		int rid=Integer.parseInt(request.getParameter("techId"));
//		String domain=request.getParameter("domain");
//		String trainer=request.getParameter("trainer");
		HttpSession session=request.getSession();
		session.setAttribute("rid", rid);
//		session.setAttribute("trainer", trainer);
//		session.setAttribute("domain", domain);
		System.out.println(rid);
		
		return new  ModelAndView("ExAssessmentDash","data",com.service.ExAttendanceService.getAssessmentCounts(rid));
	}

}
