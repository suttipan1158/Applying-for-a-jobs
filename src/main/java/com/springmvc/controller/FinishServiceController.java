package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.ConfirmQuotationManager;
import com.springmvc.manager.FinishServiceManager;
import com.springmvc.manager.ListCleanerServiceManager;
import com.springmvc.manager.ListRequestCleanerManager;
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
public class FinishServiceController {
	@RequestMapping(value = "/isUpdateStatusCleanerServiceAndRequestCleaner", method = RequestMethod.POST)
	public ModelAndView getCleanerServiceID(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listCleanerService");

		try {
			List<Quotations> quotations = (List<Quotations>) session.getAttribute("quotations");
			
			request.setCharacterEncoding("UTF-8");
			FinishServiceManager fsm = new FinishServiceManager();
			
			Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);

			List<Member> members  = fsm.findCleanerProviderDataForMember(user);
				int memid = 0 ;
				for(Member m : members) {
					memid = m.getMemberid();
				}
				
			List<CleanerProvider> cleanerProviders = fsm.getCleanerProviderID(memid);
			int providerid = 0;
				for(CleanerProvider cp : cleanerProviders) {
					providerid = cp.getMemberid();
				}
			List<Quotations> quotation = fsm.getQuotationsID(providerid); ///¤é¹ËÒãºàÊ¹ÍÃÒ¤Ò¢Í§¼ÙéãËéºÃÔ¡ÒÃ·Ó¤ÇÒÁÊÐÍÒ´
			int requestid = 0;
				for(Quotations q : quotation) {
					for(Quotations q2 : quotations) {
						if(q2.getQuotationsid() == q.getQuotationsid()) {	////µÃÇ¨ÊÍºãºàÊ¹ÍÃÒ¤Ò ÇèÒµÃ§¡ÑºãºàÊ¹ÍÃÒ¤Ò·ÕèµéÍ§¡ÒÃãËéºÃÔ¡ÒÃàÊÃç¨ÊÔé¹ËÃ×ÍäÁè
							requestid = q2.getRequest().getRequestid();
						}
					}
				}
			
			
			///Check data for Customer of Member
			
				List<Request> requests =fsm.getListRequest(requestid);
				int cusid = 0;
				int suggestid = 0;
					for(Request r: requests) {
						cusid = r.getCustomer().getMemberid();
						suggestid = r.getSuggest().getSuggestid();
					}
					
					List<Suggest> suggests = fsm.findSuggestData(suggestid);
					
				List<Customer> customer = fsm.findCustomerDataForCustomer(cusid);
			message = fsm.isUpdateStatusCleanerService(quotations,customer,suggests);
			request.setAttribute("listrequests", requests);
			session.removeAttribute("quotations");
///input session Go To List Cleaner Service
			
			List<Quotations> quotationsNew = fsm.getListQuotation(memid);
			 List<Request> requests2 = fsm.getListRequest();
			 int j = 0 ;
			 List<String> rqs1 = new ArrayList<String>();
			 List<String> rqs2 = new ArrayList<String>();
			 List<String> rqs3 = new ArrayList<String>();
			 List<String> rqs4 = new ArrayList<String>();
			 
			 for(int i =0 ; i < requests2.size() ; i++) {
				 if(requests2.get(i).getRequestid() == quotationsNew.get(j).getRequest().getRequestid()) {
					 String s1 = "รอลูกค้ายืนยัน";
					 String s2 = "รอให้บริการ";
					 String s3 = "ให้บริการเสร็จสิ้นแล้ว";
					 String s4 = "คำขอไม่ได้รับเลือก";
					 
					 	if(quotationsNew.get(j).getStatus().equals(s1)) {
					 		rqs1.add(String.valueOf(quotationsNew.get(j).getQuotationsid()));
						}else if(quotationsNew.get(j).getStatus().equals(s2)) {
							rqs2.add(String.valueOf(quotationsNew.get(j).getQuotationsid()));
						}else if(quotationsNew.get(j).getStatus().equals(s3)) {
							rqs3.add(String.valueOf(quotationsNew.get(j).getQuotationsid()));
						}else if(quotationsNew.get(j).getStatus().equals(s4)) {
							rqs4.add(String.valueOf(quotationsNew.get(j).getQuotationsid()));
						}
					 	j++;
					 	if(j >= quotationsNew.size() ){
							j= 0;
						}
				 }
			}
				List<Quotations>  q1 = fsm.getListQuotationID(rqs1);
				List<Quotations>  q2 = fsm.getListQuotationID(rqs2);
				List<Quotations>  q3 = fsm.getListQuotationID(rqs3);
				List<Quotations>  q4 = fsm.getListQuotationID(rqs4);
				request.setAttribute("listRP1", q1);
				request.setAttribute("listRP2", q2);
				request.setAttribute("listRP3", q3);
				request.setAttribute("listRP4", q4);
				
		} catch (Exception e) {
			e.printStackTrace();
			message = "2";
		}
		mav.addObject("messageFinish", message);
		return mav;
	}
}
