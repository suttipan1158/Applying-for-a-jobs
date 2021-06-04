package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.CreateRequestCleanerManager;
import com.springmvc.manager.ViewRequestCleanerDetailManager;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

@Controller
public class ViewRequestCleanerDetailController {
	@RequestMapping(value="/goViewRequestCleanerDetail",method=RequestMethod.GET)
	public String getRequestID(HttpSession session,HttpServletRequest request,Model md){
	
		Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			String requestid = request.getParameter("id");
		ViewRequestCleanerDetailManager vrcdm = new ViewRequestCleanerDetailManager();
				List<Request> requests = vrcdm.queryViewRequesCleanertDetail(requestid);
				request.setAttribute("listrequests", requests);
					System.out.println("requests View =="+requests.size());
					
			///µÑ´ String to Day In Week
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
		///µÑ´ String to Day In Month
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
					List<Suggest> suggests = vrcdm.findSuggestData();
					request.setAttribute("suggests", suggests);
					///Check data for Customer of Member
				
						List<Customer> customer = vrcdm.findCustomerDataForCustomer(memid);
						request.setAttribute("customerdata", customer);
						
						List<Quotations> quotations = vrcdm.getQuotationsID(requestid); /// ¤é¹ËÒ¢éÍÁÙÅ¢Í§¼ÙéãËéºÃÔ¡ÒÃ·Õè ÅÙ¡¤éÒ·Ó¡ÒÃÂ×¹ÂÑ¹àÊÃç¨ãºàÊ¹ÍÃÒ¤ÒáÅéÇ
						double price = 0.0;
						String qid ="";
						for (Quotations quotations2 : quotations) {
							price = quotations2.getPriceOfferJob();
							qid = String.valueOf(quotations2.getCleanerprovider().getMemberid());
						}
						md.addAttribute("quotations", price);
						
						List<ServicePerson> servicePersons = vrcdm.getServicePersonID(qid);
						List<Company> companies = vrcdm.getCompanyID(qid);
						
						String names = "";
							if(!servicePersons.isEmpty()) {
								for (ServicePerson sp : servicePersons) {
									names = "คุณ "+sp.getFirstName()+" "+sp.getLastName();
								}
							}else{
								for (Company company : companies) {
									names = "บริษัท "+company.getCompanyName();
								}
							}
							request.setAttribute("names", names);
						
					
							
		return "viewRequestCleanerDetail"; 
	}
	
}
