package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.ViewCleanerServiceDetailManager;
import com.springmvc.manager.ViewRequestCustomerDetaileManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;

@Controller
public class ViewCleanerServiceDetailController {
	@RequestMapping(value="/goViewCleanerServiceDetail",method=RequestMethod.GET)
	public String getCleanerServiceID(HttpSession session,HttpServletRequest request){
	
		Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			String quotationsid = request.getParameter("id");
			ViewCleanerServiceDetailManager vcsdm = new ViewCleanerServiceDetailManager();
				List<Quotations> quotations = vcsdm.viewCleanerServiceDetail(quotationsid);
				request.setAttribute("listquotations", quotations);
					System.out.println("list quotations View =="+quotations.size());
				
			///ตัด String to Day In Week
					String week = quotations.get(0).getRequest().getDayInWeek();
					String[] allweek =  week.split(",");
					List<String> listWeek = new ArrayList<String>();
					for(int i = 0 ; i < allweek.length ; i++){
						listWeek.add(allweek[i]);
					}
					request.setAttribute("listWeek", listWeek);
						System.out.println("listWeek size =="+listWeek.size());
					for(String s : listWeek) {
						System.out.println("listWeek =="+s);
					}
		///ตัด String to Day In Month
						String a =  quotations.get(0).getRequest().getDayInMonth();
						String[] allmonth = a.split(",");
					List<String> listMonth = new ArrayList<String>();
	
					for(int i=0;i< allmonth.length;i++) {
						listMonth.add(allmonth[i]);
						
					}	
					request.setAttribute("listMonth", listMonth);
					System.out.println("listMonth=="+listMonth.size());
					
		return "viewCleanerServiceDetail"; 
	}
}
