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
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

@Controller
public class ConfirmQuotationController {
	@RequestMapping(value = "/updateRequestCleanerDetail", method = RequestMethod.POST)
	public ModelAndView getQuotationID(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listRequestCleaner");

		try {
			request.setCharacterEncoding("UTF-8");
			String Uprequestid = request.getParameter("Uprequestid");
			String Upquotationid = request.getParameter("Upquotationid");
	    	
	    	System.out.println("Uprequestid =="+Uprequestid+"Upquotationid =="+Upquotationid);
			
			ConfirmQuotationManager cqm = new ConfirmQuotationManager();
			
			
			Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			
			List<Member> members  = cqm.findCustomerDataForMember(user);
				int memid = 0 ;
				for(Member m : members) {
					memid = m.getMemberid();
				}
			List<Suggest> suggests = cqm.findSuggestData();

			///Check data for Customer of Member
				List<Customer> customer = cqm.findCustomerDataForCustomer(memid);
				 int cusid = 0 ;
					for(Customer c : customer) {
						cusid = c.getMemberid();
					}
					System.out.println("cusid =="+cusid);
				
				 
					
					List<Quotations> quotations2 = cqm.getCleanerServiceID(Uprequestid);
					List<Quotations> listOfferWin = new ArrayList<Quotations>();
					List<Quotations> listOfferLose = new ArrayList<Quotations>();
					System.out.println("quotations2 =="+quotations2.size());
						for(Quotations q : quotations2) {
							if(Upquotationid.equals(String.valueOf(q.getQuotationsid()))) {
								listOfferWin.add(q);
							}else {
								listOfferLose.add(q);
							}
							
						}
				message = cqm.updateRequestCleanerDetail(listOfferWin,customer,suggests,listOfferLose);
			
				List<Quotations> quotations = cqm.ListQuotation();
			List<Request> requests = cqm.getListRequest(cusid);
			List<String> qid = new ArrayList<String>();		
			List<Request> statusNo1 = new ArrayList<>(); 
			List<Request> statusNo2 = new ArrayList<>(); 
			List<Request> statusNo3 = new ArrayList<>(); 
			List<Request> statusNo4 = new ArrayList<>();
			List<String> idNo = new ArrayList<String>();
			List<String> listProivder = new ArrayList<String>();
			for(Request r: requests) {
				qid.add(String.valueOf(r.getRequestid()));
				if(r.getStatus().equals("รอยืนยันใบเสนอราคา")) {
					statusNo1.add(r);
					idNo.add(String.valueOf(r.getRequestid()));
				}else if(r.getStatus().equals("รอผู้ให้บริการยืนยัน")) {
					String selectProvider = r.getSelectProvider();
					String[] allProvider =  selectProvider.split(",");
					int no = 0 ;
					for(int i = 1 ; i <= allProvider.length ; i++){
						no +=i;
					}
					listProivder.add(String.valueOf(no));
					statusNo2.add(r);
				}else if(r.getStatus().equals("รอรับบริการทำความสะอาด")) {
					statusNo3.add(r);
				}else if(r.getStatus().equals("บริการเสร็จสิ้น")){
					statusNo4.add(r);
				}
			}
				System.out.println("listProivder===="+listProivder.size());
				request.setAttribute("listProivder", listProivder);
				request.setAttribute("statusNo1", statusNo1);
				request.setAttribute("statusNo2", statusNo2);
				request.setAttribute("statusNo3", statusNo3);
				request.setAttribute("statusNo4", statusNo4);
		List<Quotations> quotations3 = cqm.getCleanerServiceID(qid); ///¤é¹ËÒ¢éÍàÊ¹Í ¢Í§ÃÒÂ¡ÒÃ·Ó¤ÇÒÁÊÐÍÒ´·ÕèµéÍ§¡ÒÃ
			List<String> quotationsNo = new ArrayList<String>();
				
				for(int j=0; j < idNo.size() ; j++) {
					int x = 0;
					for(Quotations q: quotations3) {
						if(idNo.get(j).equals(String.valueOf(q.getRequest().getRequestid()))) {
							x++;
							System.out.println("x ==="+x);
						}
					}
					quotationsNo.add(String.valueOf(x));
				}
			
				request.setAttribute("quotationsNo", quotationsNo);
				request.setAttribute("quotations", quotations3);
		List<String> cpid = new ArrayList<String>();
		int countOffer = 0;
		int i = 0;
			for(Quotations q : quotations) {
				cpid.add(String.valueOf(q.getCleanerprovider().getMemberid()));
				System.out.println("sq===="+q.getCleanerprovider().getMemberid());
				
					if(q.getRequest().getRequestid() == Integer.parseInt(qid.get(i))) {
						countOffer++;
					}
				
			}
			request.setAttribute("countOffer", countOffer);
			
		List<ServicePerson> servicePersons = cqm.getServicePersonID(cpid); /// ¤é¹ËÒ¢éÍÁÙÅ¢Í§¼ÙéãËéºÃÔ¡ÒÃ·Õè ÅÙ¡¤éÒ·Ó¡ÒÃÂ×¹ÂÑ¹àÊÃç¨ãºàÊ¹ÍÃÒ¤ÒáÅéÇ
		List<Company> companies	= cqm.getCompanyID(cpid);
			
		request.setAttribute("servicePersons", servicePersons);
		request.setAttribute("companies", companies);
			
			System.out.println("servicePersons Size=="+servicePersons.size());
			System.out.println("requests =="+requests.size());
			
		} catch (Exception e) {
			e.printStackTrace();
			message = "2";
		}
		mav.addObject("messageConfirm", message);
		return mav;
	}
}
