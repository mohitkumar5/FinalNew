package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExSeeAssessmentDetails {
	
	@RequestMapping(value="/ExSeeAssessmentDetails" , method = RequestMethod.POST)
	public ModelAndView ExSeeAssessmentDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
//		HttpSession session=request.getSession();
		int testid=Integer.parseInt(request.getParameter("TestId"));
		ArrayList<Map> al=com.service.ExAttendanceService.getTestResultsData(testid);
		request.setAttribute("data1", al);
		return new  ModelAndView("ExSeeAssessmentDetails","data",com.service.ExAttendanceService.getTestDetailsData(testid));
		
	
	}

}
