package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.ViewRequestCleanerDetailManager;
import com.springmvc.manager.ViewRequestCustomerDetaileManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

@Controller
public class ViewRequestCustomerDetailController {
	@RequestMapping(value="/goViewRequestCustomerDetail",method=RequestMethod.GET)
	public String getRequestCustomerID(HttpSession session,HttpServletRequest request){
	
		Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			String requestid = request.getParameter("id");
		ViewRequestCustomerDetaileManager vrcdm = new ViewRequestCustomerDetaileManager();
				List<Request> requests = vrcdm.viewRequestCustomerDetaile(requestid);
				request.setAttribute("listrequests", requests);
					System.out.println("requests View =="+requests.size());
					
			///�Ѵ String to Day In Week
					String week = requests.get(0).getDayInWeek();
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
		///�Ѵ String to Day In Month
						String a = requests.get(0).getDayInMonth();
						String[] allmonth = a.split(",");
					List<String> listMonth = new ArrayList<String>();
	
					for(int i=0;i< allmonth.length;i++) {
						listMonth.add(allmonth[i]);
						
					}	
					request.setAttribute("listMonth", listMonth);
					System.out.println("listMonth=="+listMonth.size());
					List<Member> members  = vrcdm.findCustomerDataForMember(user);
						int memid = 0 ;
						for(Member m : members) {
							memid = m.getMemberid();
						}
					///Check data for Customer of Member
						List<CleanerProvider> cp = vrcdm.findCleanerProviderDatas(memid);
						request.setAttribute("providerdata", cp);
		return "viewRequestCustomerDetail"; 
	}
}
