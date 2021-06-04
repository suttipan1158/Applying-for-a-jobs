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

import com.springmvc.manager.CreateRequestCleanerManager;
import com.springmvc.manager.EditRequestCleanerManager;
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
public class EditRequestCleanerController {
	@RequestMapping(value="/goEditRequestCleanerPage",method=RequestMethod.POST)
	public String getCategoryAddressData(HttpSession session,HttpServletRequest request){
	
		Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			String requestid = request.getParameter("requestid");
		EditRequestCleanerManager ercm = new EditRequestCleanerManager();
				List<Request> requests = ercm.findEditCategoryAddressData(requestid);
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
					
		///�Ѵ String to Day In Month
						String a = requests.get(0).getDayInMonth();
						String[] allmonth = a.split(",");
					List<String> listMonth = new ArrayList<String>();
	
					for(int i=0;i< allmonth.length;i++) {
						listMonth.add(allmonth[i]);
						
					}	
					request.setAttribute("listMonth", listMonth);
					System.out.println("listMonth=="+listMonth.size());
					List<Member> members  = ercm.findCustomerDataForMember(user);
						int memid = 0 ;
						for(Member m : members) {
							memid = m.getMemberid();
						}
					List<Suggest> suggests = ercm.findEditCategoryAddressData();
					request.setAttribute("suggests", suggests);
					///Check data for Customer of Member
				
						List<Customer> customer = ercm.findRequestCleanerDataForCustomer(memid);
						request.setAttribute("customerdata", customer);
						int cusid =0;
						for (Customer customer2 : customer) {
							cusid = customer2.getMemberid();
						}
				CreateRequestCleanerManager em = new CreateRequestCleanerManager();
				List<Quotations> quotations = em.fineCleanerProvider(cusid);
					System.out.println("quotations"+quotations.size());
					List<ServicePerson> servicePersons = new ArrayList<ServicePerson>();
					List<Company> companies = new ArrayList<Company>();
					int quotationsize = 0;
						if(quotations.size() <= 3) {
							quotationsize = 0;
						}else {
							quotationsize = quotations.size()-3;
						}
					int providerid = 0;
						for(int i =quotationsize; i < quotations.size() ;i++) {
							if(quotations.get(i).getCleanerprovider().getPrivatetype().equals("บุคคล")) {
								providerid = quotations.get(i).getCleanerprovider().getMemberid();
								List<ServicePerson> sp = em.getListServicePerson(providerid);
								servicePersons.addAll(sp);
							}else {
								providerid = quotations.get(i).getCleanerprovider().getMemberid();
								companies.addAll(em.getListCompany(providerid));
							}
						}
							if(!companies.isEmpty()) {
								request.setAttribute("companies", companies);
							}
							if(!servicePersons.isEmpty()) {
								request.setAttribute("servicePersons", servicePersons);
							}
				
		return "editRequestCleaner"; 
	}

///Update Data Request Cleaner
	@RequestMapping(value = "/doisUpdateRequestCleaner", method = RequestMethod.POST)
	public ModelAndView getNewRequestData(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("viewRequestCleanerDetail");

		try {
			request.setCharacterEncoding("UTF-8");
	
			String memberid = request.getParameter("memberid");
			String requestid = request.getParameter("requestid");
		
			String cleanNo = request.getParameter("cleanNo");
	
			String cusid = request.getParameter("customerid");

		
			String serviceDate = request.getParameter("serviceDate");
			String listaddressType = request.getParameter("listaddressTypeSub");
			String abodeFormat = request.getParameter("abodeFormatsub");
			String timePeriod = request.getParameter("timePeriod");
			String animal = request.getParameter("animal");
			String priceMin = request.getParameter("priceMin");
			String priceMax = request.getParameter("priceMax");
			String note = request.getParameter("notes");
			String status = request.getParameter("status");
			
			System.out.println("priceMin"+priceMin+"priceMax"+priceMax);
			
		//Input Customer
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String subDistrict = request.getParameter("subDistrict");
			String district = request.getParameter("district");
			String province = request.getParameter("province");
			String postcode = request.getParameter("postcode");
			String latitude = request.getParameter("latitude");
			String longitude = request.getParameter("longitude");
			String doProvider = request.getParameter("listcleanerProvider");
			String[] personid = request.getParameterValues("personid");
			String[] companyid = request.getParameterValues("companyid");
			String selectProvider = "";
			if(doProvider.equals("ผู้ให้บริการที่เคยใช้งาน")) {
				status = "รอผู้ให้บริการยืนยัน";

				if(personid != null) {
					for(int i = 0 ; i < personid.length ; i++) {
						selectProvider = selectProvider + personid[i];
					}
				}
				if(companyid != null) {
					for(int i = 0; i <companyid.length;i++) {
						selectProvider = selectProvider +companyid[i];
					}
				}
			}else {
				doProvider = "ไม่มีผู้ให้บริการที่ต้องการ";
				selectProvider ="-";
			}
		///Input sugges
			String suggesid = request.getParameter("suggestid");
			String suggestPrice = request.getParameter("suggestPrice");
			String suggestTime = request.getParameter("suggestTime");
			String suggestType = request.getParameter("suggestType");
			String suggestFormat = request.getParameter("suggestFormat");
				System.out.println("suggesid"+suggesid+"suggestPrice"+suggestPrice+"suggestTime"+suggestTime+"suggestFormat"+suggestFormat+"suggestType"+suggestType);
			
			String  servicePeriod = request.getParameter("serviceTime");
			String  servicePeriod2 = request.getParameter("serviceTime2");
			String  servicePeriod3 = request.getParameter("serviceTime3");
			String weekNo = request.getParameter("weekNo");
			String[] dayInWeeks = request.getParameterValues("dayInWeed");
			String dayInWeek = "";
			if(cleanNo.equals("หนึ่งสัปดาหฺ์")) {
				if(dayInWeeks != null ) {
					for(int i = 0; i < dayInWeeks.length ; i++) {
						
								dayInWeek = dayInWeek  +  dayInWeeks[i];
					}
					servicePeriod = servicePeriod2;
				}else {
					weekNo = "-";
					dayInWeek = "-";
					
				}
			}else {
				weekNo = "-";
				dayInWeek = "-";
				
			}
			
			String[] m1 = {"มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม"};
			String[] mNo = {"1","2","3","4","5","6","7","8","9","10","11","12"};
			String mo =request.getParameter("pickMonths");
				String months = "";
					for (int i = 0; i < m1.length; i++) {
						if(mo.equals(mNo[i])) {
							months = m1[i];
						}
					}
					
			String monthNo =request.getParameter("monthNo");
			String [] dayInMonths =request.getParameterValues("dayInMonth");
			String dayInMonth = "";
			if(cleanNo.equals("หนึ่งเดือน")) {
				if(dayInMonths != null ) {
					for(int i = 0; i < dayInMonths.length ; i++) {
							dayInMonth = dayInMonth + dayInMonths[i];
					}
					servicePeriod = servicePeriod3;
				}else {
					months = "-";
					monthNo = "-";
					dayInMonth = "-";
					
				}
			}else {
				months = "-";
				monthNo = "-";
				dayInMonth = "-";
				
			}
			EditRequestCleanerManager ercm = new EditRequestCleanerManager();
			
			
			  Suggest suggest =  new  Suggest(Integer.parseInt(suggesid), suggestTime, suggestPrice, suggestType, suggestFormat);
				
			Login user = (Login) session.getAttribute("user");
				Customer cus = new Customer(Integer.parseInt(memberid), tel, email, address, subDistrict, district, province, postcode, latitude, longitude,
							user, Integer.parseInt(cusid), fname, lname);


					  
				Request requests = new	Request(Integer.parseInt(requestid), cleanNo,listaddressType, abodeFormat, timePeriod, servicePeriod, Double.parseDouble(priceMin), Double.parseDouble(priceMax), note, address,
						subDistrict, district, province, postcode, latitude, longitude, animal, status, doProvider, weekNo, dayInWeek,
						months,monthNo, dayInMonth);
									requests.setSelectProvider(selectProvider);
									requests.setCustomer(cus);
									requests.setSuggest(suggest);
									if(serviceDate != null && serviceDate != "") {
										DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
										Date dbay = df.parse(serviceDate);
										requests.setServiceDate(dbay);
								}else {
									DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
									requests.setServiceDate(df.parse("00/00/0000"));
								}
									
			message = ercm.isUpdateRequestCleaner(requests);
			
			
			  session.setAttribute("user", user);
			  ViewRequestCleanerDetailManager vrcdm = new ViewRequestCleanerDetailManager();
			  List<Request> requests2 = ercm.findEditCategoryAddressData(requestid);
			  request.setAttribute("listrequests", requests2);
			  System.out.println("requests View =="+requests2.size());
			  
			 ///�Ѵ String to Day In Week 
			  String week = requests2.get(0).getDayInWeek();
			  String[] allweek = week.split(",");
			  List<String> listWeek = new ArrayList<String>();
			   for(int i = 0 ; i < allweek.length ; i++){
				   listWeek.add(allweek[i]); 
			   } 
			   request.setAttribute("listWeek", listWeek);
			   		System.out.println("listWeek size =="+listWeek.size());
			  ///�Ѵ String to Day In Month
			   String a = requests2.get(0).getDayInMonth(); 
			   String[] allmonth = a.split(",");
			   List<String> listMonth = new ArrayList<String>();
			  
			   for(int i=0;i< allmonth.length;i++) { 
				   	listMonth.add(allmonth[i]);
			  
			  } 
			   request.setAttribute("listMonth", listMonth);
			   		System.out.println("listMonth=="+listMonth.size()); 
			   	List<Member> members = vrcdm.findCustomerDataForMember(user);
			   		int memid = 0 ; 
			   			for(Member m : members) { 
			   				memid = m.getMemberid(); 
			   			} 
			   	List<Suggest> suggests = vrcdm.findSuggestData(); 
			   	request.setAttribute("suggests", suggests); 
			  ///Check data for Customer of Member
			  
			  List<Customer> customer = vrcdm.findCustomerDataForCustomer(memid);
			  request.setAttribute("customerdata", customer);
			 
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}
	///Update Data Request Cleaner
		@RequestMapping(value = "/doCencalEditRequest", method = RequestMethod.GET)
		public ModelAndView CencalEditRequest(HttpServletRequest request,HttpSession session) {
			String message = "";
			ModelAndView mav = new ModelAndView("viewRequestCleanerDetail");

			try {
				request.setCharacterEncoding("UTF-8");
		
				String requestid = request.getParameter("id");
				Login user = (Login) session.getAttribute("user");
					
				
				EditRequestCleanerManager ercm = new EditRequestCleanerManager();
				  session.setAttribute("user", user);
				  ViewRequestCleanerDetailManager vrcdm = new ViewRequestCleanerDetailManager();
				  List<Request> requests2 = ercm.findEditCategoryAddressData(requestid);
				  request.setAttribute("listrequests", requests2);
				  System.out.println("requests View =="+requests2.size());
				  
				 ///�Ѵ String to Day In Week 
				  String week = requests2.get(0).getDayInWeek();
				  String[] allweek = week.split(",");
				  List<String> listWeek = new ArrayList<String>();
				   for(int i = 0 ; i < allweek.length ; i++){
					   listWeek.add(allweek[i]); 
				   } 
				   request.setAttribute("listWeek", listWeek);
				   		System.out.println("listWeek size =="+listWeek.size());
				  ///�Ѵ String to Day In Month
				   String a = requests2.get(0).getDayInMonth(); 
				   String[] allmonth = a.split(",");
				   List<String> listMonth = new ArrayList<String>();
				  
				   for(int i=0;i< allmonth.length;i++) { 
					   	listMonth.add(allmonth[i]);
				  
				  } 
				   request.setAttribute("listMonth", listMonth);
				   		System.out.println("listMonth=="+listMonth.size()); 
				   	List<Member> members = vrcdm.findCustomerDataForMember(user);
				   		int memid = 0 ; 
				   			for(Member m : members) { 
				   				memid = m.getMemberid(); 
				   			} 
				   	List<Suggest> suggests = vrcdm.findSuggestData(); 
				   	request.setAttribute("suggests", suggests); 
				  ///Check data for Customer of Member
				  
				  List<Customer> customer = vrcdm.findCustomerDataForCustomer(memid);
				  request.setAttribute("customerdata", customer);
				 
			} catch (Exception e) {
				e.printStackTrace();
				message = "Please try again....";
			}
			mav.addObject("message", message);
			return mav;
		}
}
