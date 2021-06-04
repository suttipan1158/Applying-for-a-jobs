package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.CancelRequestCustomerManager;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;


@Controller
public class CancelRequestCleanerController {
	///line Go Cancel Request of Customer
	@RequestMapping(value="/goDeleteRequestCleaner",method=RequestMethod.GET)
		public ModelAndView getRequestID(HttpServletRequest request,HttpSession session){
		String message = "";
		ModelAndView mav = new ModelAndView("listRequestCleaner");
		try {
			Login user = (Login) session.getAttribute("user"); 
			String id = request.getParameter("id");
			CancelRequestCustomerManager crcm = new CancelRequestCustomerManager();
			List<Request> rq = crcm.getListRequestID(Integer.parseInt(id));
			List<Quotations> qtt = crcm.getListQuotationsID(id); 
			
			message = crcm.deleteRequestCleaner(rq,qtt);
			List<Member> members  = crcm.findCustomerDataForMember(user);
			int memid = 0 ;
			for(Member m : members) {
				memid = m.getMemberid();
			}
		List<Suggest> suggests = crcm.findSuggestData();
			request.setAttribute("suggests", suggests);
		///Check data for Customer of Member
			List<Customer> customer = crcm.findCustomerDataForCustomer(memid);
			request.setAttribute("customerdata", customer);
			 int cusid = 0 ;
				for(Customer c : customer) {
					cusid = c.getMemberid();
				}
				System.out.println("cusid =="+cusid);
			List<Request> requests = crcm.getListRequest(cusid);
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
				}else if(r.getStatus().equals("รอผู้ให้บริการยืนยันรับคำขอ")) {
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
	//// Check Quotation No to Status02 
			List<Quotations> quotationsstatus2 = crcm.getQuotationsID(listProivder); 
			List<String> quotationsNoStatus02 = new ArrayList<String>();
			int totalOffer = 0;
			for(int j=0; j < idNo.size() ; j++) {
				int x = 0;
				for(Quotations q: quotationsstatus2) {
					if(idNo.get(j).equals(String.valueOf(q.getRequest().getRequestid()))) {
						x++;
						System.out.println("x ==="+x);
					}
				}
				totalOffer = x;
			}
			quotationsNoStatus02.add(String.valueOf(totalOffer));
				System.out.println("listProivder===="+quotationsNoStatus02.size());
				request.setAttribute("listProivder", quotationsNoStatus02);
				request.setAttribute("statusNo1", statusNo1);
				request.setAttribute("statusNo2", statusNo2);
				request.setAttribute("statusNo3", statusNo3);
				request.setAttribute("statusNo4", statusNo4);
/// Check Quotation No to Status01 
		List<Quotations> quotations = crcm.getQuotationsID(qid); ///¤é¹ËÒ¢éÍàÊ¹Í ¢Í§ÃÒÂ¡ÒÃ·Ó¤ÇÒÁÊÐÍÒ´·ÕèµéÍ§¡ÒÃ
			List<String> quotationsNoStatus01 = new ArrayList<String>();
				
				for(int j=0; j < idNo.size() ; j++) {
					int x = 0;
					for(Quotations q: quotations) {
						if(idNo.get(j).equals(String.valueOf(q.getRequest().getRequestid())) && q.getCleanerprovider().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
							x++;
							System.out.println("x ==="+x);
						}
					}
					quotationsNoStatus01.add(String.valueOf(x));
				}
			
				request.setAttribute("quotationsNo", quotationsNoStatus01);
				request.setAttribute("quotations", quotations);
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
			
		List<ServicePerson> servicePersons = crcm.getServicePersonID(cpid); /// ¤é¹ËÒ¢éÍÁÙÅ¢Í§¼ÙéãËéºÃÔ¡ÒÃ·Õè ÅÙ¡¤éÒ·Ó¡ÒÃÂ×¹ÂÑ¹àÊÃç¨ãºàÊ¹ÍÃÒ¤ÒáÅéÇ
		List<Company> companies	= crcm.getCompanyID(cpid);
			
		request.setAttribute("servicePersons", servicePersons);
		request.setAttribute("companies", companies);
		}catch (Exception e) {
			message ="2";
		}		
		mav.addObject("messageCancel", message);
		return mav;
		}
}
