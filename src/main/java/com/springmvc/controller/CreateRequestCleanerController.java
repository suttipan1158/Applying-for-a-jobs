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
import com.springmvc.manager.RegisterManager;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;


@Controller
public class CreateRequestCleanerController {
	@RequestMapping(value="/goCreateRequestCleaner",method=RequestMethod.GET)
	public String getCustomerID(HttpSession session,HttpServletRequest request){
	
		Login user = (Login) session.getAttribute("user");
			session.setAttribute("user", user);
			CreateRequestCleanerManager em = new CreateRequestCleanerManager();
			List<Member> members  = em.findCustomerDataForMember(user);
				int memid = 0 ;
				for(Member m : members) {
					memid = m.getMemberid();
				}
			List<Suggest> suggests = em.findSuggestData();
//				session.setAttribute("suggests", suggests);
			request.setAttribute("suggests", suggests);
			///Check data for Customer of Member
		
				List<Customer> customer = em.findCustomerData(memid);
//				session.setAttribute("customerdata", customer);
				request.setAttribute("customerdata", customer);
					int cusid =0;
						for (Customer customer2 : customer) {
							cusid = customer2.getMemberid();
						}
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
//								session.setAttribute("companies", companies);
								request.setAttribute("companies", companies);
							}
							if(!servicePersons.isEmpty()) {
//								session.setAttribute("servicePersons", servicePersons);
								request.setAttribute("servicePersons", servicePersons);
							}
				
		return "createRequestCleaner"; 
	}
	@RequestMapping(value = "/createRequestCleaner", method = RequestMethod.POST)
	public ModelAndView getRegisterData(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("index");

		try {			
			request.setCharacterEncoding("UTF-8");
			
			CreateRequestCleanerManager crcm = new CreateRequestCleanerManager();
			List<Request> listrequests = crcm.getListRequest();
			int requestid = 0;
				for(Request r : listrequests) {
						if(requestid < r.getRequestid()) {
							requestid = r.getRequestid();
						}
				}
					if(requestid != 0) {
						requestid++;
	  				}else {
	  					requestid = 1;
	  				}
						
			String cleanNo = request.getParameter("nos");
			String abodeFormat = request.getParameter("cleanerProviderServiceType");
			String timePeriod = request.getParameter("timePeriod");
			String serviceDate = request.getParameter("startDate");
			
			double priceMin = Double.parseDouble(request.getParameter("priceMin"));
			double priceMax = Double.parseDouble(request.getParameter("priceMax"));
			String note = request.getParameter("notes");
			String animal = request.getParameter("listanimal");
			String status = request.getParameter("status");
			String longitude = request.getParameter("longitude");
			String latitude = request.getParameter("latitude");
			
			
			
			String  servicePeriod = request.getParameter("serviceTime");
			String  servicePeriod2 = request.getParameter("serviceTime2");
			String  servicePeriod3 = request.getParameter("serviceTime3");
			String[] dayInWeeks = request.getParameterValues("dayInWeeks");
			String weekNo =request.getParameter("weekNo");
			String dayInWeek = "";
			if(dayInWeeks != null ) {
				for(int i = 0; i < dayInWeeks.length ; i++) {
					dayInWeek = dayInWeek+  dayInWeeks[i];
				}
				servicePeriod = servicePeriod2;
			}else {
				weekNo = "-";
				dayInWeek = "-";
				
			}
			String[] m = {"มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม"};
			String[] m1 = {"1","2","3","4","5","6","7","8","9","10","11","12"};
			String mo =request.getParameter("pickMonths");
				String months = "";
					for (int i = 0; i < m.length; i++) {
						if(mo.equals(m1[i])) {
							months = m[i];
						}
					}
				String monthNo ="";
					if( mo.equals("4") || mo.equals("6") || mo.equals("9") || mo.equals("11")){
						 monthNo =request.getParameter("monthNo1");
						 
					}else if( mo.equals("2")){
						 monthNo =request.getParameter("monthNo3");
					}else {
						 monthNo =request.getParameter("monthNo2");
					}
					
			String [] dayInMonths =request.getParameterValues("dayInMonths");
			String dayInMonth = "";
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
				
		//// Customer 
			String memberid = request.getParameter("memberid");
			String customerid = request.getParameter("customerid"); 
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String subdistrict = request.getParameter("subDistrict");
			String district = request.getParameter("district");
			String province = request.getParameter("province");
			String postcode = request.getParameter("postcode");
			
	 ///Cleaner Provider
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
	///	Suggest	
			
			  List<Suggest> Listsuggests = crcm.findSuggestData(); 
			  String listaddressType = request.getParameter("listaddressType");
			  System.out.println("listaddressType=="+listaddressType.toString());
			  Suggest suggest =  new  Suggest();
					  for(Suggest s:Listsuggests) { 
						  if(s.getAddressType().equals(listaddressType)) { 
							  	suggest.setSuggestid(s.getSuggestid());
							  	suggest.setSuggestPrice(s.getSuggestPrice());
							  	suggest.setSuggestTime(s.getSuggestTime());
							  	suggest.setAddressType(s.getAddressType());
							  	suggest.setAddressFormat(s.getAddressFormat());
						  }
					  }
					  System.out.println("memberid =="+memberid);
						///set data to variable
			Login user = (Login) session.getAttribute("user");
			
			Customer customer = new Customer(Integer.parseInt(memberid), tel, email, address, subdistrict, district, province, postcode,
									latitude, longitude, user,Integer.parseInt(customerid), fname, lname);

			Request rq = new Request(requestid, cleanNo,listaddressType, abodeFormat, timePeriod, servicePeriod, priceMin, priceMax, note, address,
						subdistrict, district, province, postcode, latitude, longitude, animal, status, doProvider, weekNo, dayInWeek,
						months,monthNo, dayInMonth); 
							rq.setSelectProvider(selectProvider);
						
					
							
								if(serviceDate != null && serviceDate != "") {
										DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
										Date dbay = df.parse(serviceDate);
										rq.setServiceDate(dbay);
								}else {
									DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
									rq.setServiceDate(df.parse("00/00/0000"));
								}
								
								rq.setCustomer(customer);
								rq.setSuggest(suggest); 
			message = crcm.isCreateRequestCleaner(rq);
		} catch (Exception e) {
			e.printStackTrace();
			message = "2";
		}
		mav.addObject("messageCreate", message);
		return mav;
	}
}
