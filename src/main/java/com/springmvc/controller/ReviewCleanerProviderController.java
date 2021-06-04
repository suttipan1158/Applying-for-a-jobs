package com.springmvc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.EditRequestCleanerManager;
import com.springmvc.manager.ReviewCleanerProviderManager;
import com.springmvc.manager.ViewRequestCleanerDetailManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.Review;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

@Controller
public class ReviewCleanerProviderController {
	@RequestMapping(value="/goReviewCleanerProvider",method=RequestMethod.GET)
	public String getReviewDataShow(HttpSession session,HttpServletRequest request){
	
		Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			String requestid = request.getParameter("id");
			ReviewCleanerProviderManager rcpm = new ReviewCleanerProviderManager();
				List<Request> requests = rcpm.ViewRequestCleanerDetail(requestid);
				request.setAttribute("listrequests", requests);
					System.out.println("requests View =="+requests.size());
					
			///�Ѵ String to Day In Week
				if(!requests.get(0).getDayInWeek().equals("-")) {
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
				}
		///�Ѵ String to Day In Month
				if(!requests.get(0).getDayInMonth().equals("-")) {
						String a = requests.get(0).getDayInMonth();
						String[] allmonth = a.split(",");
					List<String> listMonth = new ArrayList<String>();
	
					for(int i=0;i< allmonth.length;i++) {
						listMonth.add(allmonth[i]);
						
					}	
					request.setAttribute("listMonth", listMonth);
					System.out.println("listMonth=="+listMonth.size());
				}
					List<Member> members  = rcpm.findCustomerDataForMember(user);
						int memid = 0 ;
						for(Member m : members) {
							memid = m.getMemberid();
						}
					List<Suggest> suggests = rcpm.findSuggestData();
					request.setAttribute("suggests", suggests);
					///Check data for Customer of Member
				
						List<Customer> customer = rcpm.findCustomerDataForCustomer(memid);
						request.setAttribute("customerdata", customer);
					
						
					List<Quotations> quotations  = rcpm.getCleanerServiceID(requestid);
					request.setAttribute("quotations", quotations);
					List<String> cpid = new ArrayList<String>();
					int reviewid = 0;
						for(Quotations q : quotations) {
							if(q.getReview() != null) {
								reviewid = q.getReview().getReviewid();
								cpid.add(String.valueOf(q.getCleanerprovider().getMemberid()));
								System.out.println("sq===="+q.getCleanerprovider().getMemberid());	
							}else {
								cpid.add(String.valueOf(q.getCleanerprovider().getMemberid()));
							}
							
						}
					List<Review> reviews = rcpm.getReviewID(reviewid);
					List<ServicePerson> servicePersons = rcpm.getServicePersonID(cpid); /// ���Ң����Ţͧ�������ԡ�÷�� �١��ҷӡ���׹�ѹ������ʹ��Ҥ�����
					List<Company> companies	= rcpm.getCompanyID(cpid);
						System.out.println("reviews ==="+reviews.size());
						request.setAttribute("servicePersons", servicePersons);
						request.setAttribute("companies", companies);
						request.setAttribute("reviews", reviews);
		return "reviewCleanerProvider"; 
	}
	///Update Data Request Cleaner
		@RequestMapping(value = "/isReviewCleanerProvider", method = RequestMethod.POST)
		public ModelAndView getReviewData(HttpServletRequest request,HttpSession session) {
			String message = "";
			ModelAndView mav = new ModelAndView("reviewCleanerProvider");

			try {
				request.setCharacterEncoding("UTF-8");
				ReviewCleanerProviderManager rcpm = new ReviewCleanerProviderManager();
		
				List<Request> requests = (List<Request>) session.getAttribute("requests");
		    	List<Customer> cus = (List<Customer>) session.getAttribute("customerdata");
		    	List<Quotations> quotations = (List<Quotations>) session.getAttribute("quotations");
				
				String reviewdate = request.getParameter("reviewdate"); ///�Ѻ��Ңͧ������㹡������Ǩҡ�١���
				String rating = request.getParameter("rating");
				String comment = request.getParameter("comment");
					System.out.println("rating ==="+rating);
				List<Review> reviews = rcpm.getListReview();	////�Ѻ�����¡�èҡ�ҹ�����Ţͧ ���ҧ�����
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					int reviewsID = 0;
						for (Review review : reviews) {
							reviewsID = review.getReviewid();
						}
						if(comment.isEmpty()) {
							comment = "-";
						}
				Review review = new Review(reviewsID+1, Integer.parseInt(rating), comment); ///�����������㹤��������						
						review.setReviewDate(df.parse(reviewdate));
				
				message = rcpm.isReviewCleanerProvider(review); ///�ѹ�֡�����������ŧ�㹵��ҧ�����
				
				message = rcpm.UpdateQuotations(quotations,cus,requests,review);	///�Ѿഷ������㹵��ҧ�ͧ��ʹ��Ҥ�
				
				session.removeAttribute("requests");
				session.removeAttribute("customerdata");
				session.removeAttribute("quotations");
// การส่งค่าใหม่กลับไปยังหน้ารายละเอียดของคำขอ				
				Login user = (Login) session.getAttribute("user");
				session.setAttribute("user", user);
				String requestid = request.getParameter("id");
				System.out.println("requestid ==" +requestid);
					List<Request> requests2 = rcpm.ViewRequestCleanerDetail(requestid);
					request.setAttribute("listrequests", requests2);
						System.out.println("requests View =="+requests2.size());
						
				///�Ѵ String to Day In Week
					List<String> listWeek = new ArrayList<String>();
					
						if(!requests2.get(0).getDayInWeek().equals("-")) {
							String week = requests2.get(0).getDayInWeek();
							String[] allweek =  week.split(",");
							
							for(int i = 0 ; i < allweek.length ; i++){
								listWeek.add(allweek[i]);
							}
							request.setAttribute("listWeek", listWeek);
								System.out.println("listWeek size =="+listWeek.size());
							for(String s : listWeek) {
								System.out.println("listWeek =="+s);
							}
						}else {
							listWeek.add("-");
						}
					
			///�Ѵ String to Day In Month
					List<String> listMonth = new ArrayList<String>();
					
						if(!requests2.get(0).getDayInMonth().equals("-")) {
							String a = requests2.get(0).getDayInMonth();
							String[] allmonth = a.split(",");
						
		
						for(int i=0;i< allmonth.length;i++) {
							listMonth.add(allmonth[i]);
							
						}	
						request.setAttribute("listMonth", listMonth);
						System.out.println("listMonth=="+listMonth.size());
						}else {
							listMonth.add("-");
						}
							
						List<Member> members  = rcpm.findCustomerDataForMember(user);
							int memid = 0 ;
							for(Member m : members) {
								memid = m.getMemberid();
							}
						List<Suggest> suggests = rcpm.findSuggestData();
						request.setAttribute("suggests", suggests);
						///Check data for Customer of Member
					
							List<Customer> customer = rcpm.findCustomerDataForCustomer(memid);
							request.setAttribute("customerdata", customer);
						
							
						List<Quotations> quotations2  = rcpm.getCleanerServiceID(requestid);
						request.setAttribute("quotations", quotations);
						List<String> cpid = new ArrayList<String>();
						int reviewid = 0;
							for(Quotations q : quotations2) {
								if(q.getReview() != null) {
									reviewid = q.getReview().getReviewid();
								}
								
								cpid.add(String.valueOf(q.getCleanerprovider().getMemberid()));
								System.out.println("sq===="+q.getCleanerprovider().getMemberid());	
							}
						List<Review> reviews2 = rcpm.getReviewID(reviewid);
						List<ServicePerson> servicePersons = rcpm.getServicePersonID(cpid); /// ���Ң����Ţͧ�������ԡ�÷�� �١��ҷӡ���׹�ѹ������ʹ��Ҥ�����
						List<Company> companies	= rcpm.getCompanyID(cpid);
							
						request.setAttribute("servicePersons", servicePersons);
						request.setAttribute("companies", companies);
						request.setAttribute("reviews", reviews2);
				
			} catch (Exception e) {
				e.printStackTrace();
				message = "Please try again....";
			}
			mav.addObject("message", message);
			return mav;
		}
}
