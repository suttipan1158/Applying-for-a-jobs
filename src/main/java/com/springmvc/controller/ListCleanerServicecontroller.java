package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.ListCleanerProviderManager;
import com.springmvc.manager.ListCleanerServiceManager;
import com.springmvc.manager.ListRequestCustomerManager;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;

@Controller
public class ListCleanerServicecontroller {
	@RequestMapping(value="/goListCleanerServicePage",method=RequestMethod.GET)
	public String getCleanerServiceID(HttpSession session,HttpServletRequest request){
		
		Login user = (Login) session.getAttribute("user");
		session.setAttribute("user", user);
		ListCleanerServiceManager lcsm = new ListCleanerServiceManager();
		List<Member> members  = lcsm.findCustomerDataForMember(user);
			int memid = 0 ;
			for(Member m : members) {
				memid = m.getMemberid();
			}
			List<Quotations> quotations = lcsm.viewCleanerServiceDetail(memid);
				System.out.println("quotations size=="+quotations.size());
		///Check data for Customer of Member
			
			 List<Request> requests = lcsm.getListRequest();
			 int j = 0 ;
			 List<String> rqs1 = new ArrayList<String>();
			 List<String> rqs2 = new ArrayList<String>();
			 List<String> rqs3 = new ArrayList<String>();
			 List<String> rqs4 = new ArrayList<String>();
	
			 if(requests.size() != 0 ) {
				 for(int i =0 ; i < requests.size() ; i++) {
					 if(quotations.size() != 0) {
						 if(requests.get(i).getRequestid() == quotations.get(j).getRequest().getRequestid()) {
							 String s1 = "รอลูกค้ายืนยัน";
							 String s2 = "รอให้บริการ";
							 String s3 = "ให้บริการเสร็จสิ้นแล้ว";
							 String s4 = "คำขอไม่ได้รับเลือก";
							 	if(quotations.get(j).getStatus().equals(s1)) {
							 		rqs1.add(String.valueOf(quotations.get(j).getQuotationsid()));
								}else if(quotations.get(j).getStatus().equals(s2)) {
									rqs2.add(String.valueOf(quotations.get(j).getQuotationsid()));
								}else if(quotations.get(j).getStatus().equals(s3)) {
									rqs3.add(String.valueOf(quotations.get(j).getQuotationsid()));
								}else if(quotations.get(j).getStatus().equals(s4)) {
									rqs4.add(String.valueOf(quotations.get(j).getQuotationsid()));
								}
							 	j++;
							 	System.out.println("quotations.size"+quotations.size());
							 	if(j >= quotations.size() ){
									j= 0;
								}
						 }
					 }
					
				}
			 }
			
				List<Quotations>  q1 = lcsm.queryListCleanerService(rqs1);
				List<Quotations>  q2 = lcsm.queryListCleanerService(rqs2);
				List<Quotations>  q3 = lcsm.queryListCleanerService(rqs3);
				List<Quotations>  q4 = lcsm.queryListCleanerService(rqs4);
				request.setAttribute("listRP1", q1);
				request.setAttribute("listRP2", q2);
				request.setAttribute("listRP3", q3);
				request.setAttribute("listRP4", q4);
				System.out.println("rq1 =="+q1.size());
				System.out.println("rq2 =="+q2.size());
				System.out.println("rq3 =="+q3.size());
		
		return "listCleanerService"; 
	}
}
