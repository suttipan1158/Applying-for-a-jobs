package com.springmvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.ListRequestCleanerManager;
import com.springmvc.manager.ListRequestCustomerManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.Suggest;

@Controller
public class ListRequestCustomerController {
	@RequestMapping(value="/goListRequestCustomer",method=RequestMethod.GET)
	public String loadListRequestCleanerPage(HttpSession session,HttpServletRequest request){
	
		Login user = (Login) session.getAttribute("user");
			
			ListRequestCustomerManager lrcm = new ListRequestCustomerManager();
			List<Member> members  = lrcm.findCustomerDataForMember(user);
			
				int memid = 0 ;
				String sd = "";
				
				for(Member m : members) {
					memid = m.getMemberid();
					System.out.println("membersID==="+memid);
					sd = m.getDistrict();
					
				}
				
				List<CleanerProvider> cp = lrcm.getCleanerProviderID(memid);
				String cpid = "";
					for(CleanerProvider clp : cp) {
						cpid = String.valueOf(clp.getPrivderid());
						System.out.println("CleanerProvider OD =="+clp.getPrivderid());
					}
				List<Quotations> quotations = lrcm.getOfferQuotationData(memid);
					System.out.println("quotations==="+quotations.size());
				 List<Request> requests = lrcm.getListRequest();
				
				 List<String> rqs = new ArrayList<String>();
				 int   q = 0;
				 for(int i =0 ; i < requests.size() ; i++) {
						 if(requests.get(i).getDistrict().equals(sd)) {
								if(quotations.size() != 0) {
								
									if(quotations.get(q).getRequest().getRequestid() != requests.get(i).getRequestid()) {
											System.out.println("getRequestid == "+requests.get(i).getRequestid()+"quotations =="+quotations.get(q).getRequest().getRequestid());
												rqs.add( String.valueOf(requests.get(i).getRequestid()));
												  q++; 
												  if(q >= quotations.size()) {
													  q = 0; 
													  }
										}	
									}else {
										rqs.add( String.valueOf(requests.get(i).getRequestid()));
									}
								}
					}
				 List<String> rqs02 = new ArrayList<String>();
				 Map<Integer, Integer> qttMap= new HashMap< Integer, Integer>();
				 
				 	for(int j = 0 ;j < quotations.size();j++ ) {
				 		qttMap.put(j, quotations.get(j).getRequest().getRequestid());
				 	}
					for(int i = 0; i < rqs.size();i++) {
						for(int j = 0 ;j < qttMap.size();j++) {
							if(Integer.parseInt(rqs.get(i)) == qttMap.get(j)) {
								System.out.println(" rqs == quotations=="+rqs.get(i));
								rqs02.add(rqs.get(i));
							}
						}
					}
					
						for(int i = 0; i < rqs.size();i++) {
							System.out.println("rqs =="+ rqs.get(i));
							for(int j = 0 ;j < rqs02.size();j++) {
								System.out.println("rqs02 =="+rqs02.get(j));
								if( rqs.get(i).equals(rqs02.get(j))) {
									
									System.out.println("remove==="+rqs.remove(i) + "rqs02 == "+rqs02.get(j));
									 rqs.remove(new Integer(i));
									if(j ==  rqs02.size()) {
										j = 0;
									}
								}
								
							}
					}
					
					
				 	
					for(String s : rqs) {
					
						System.out.println("rqs01 =="+s);
					}
					List<Request> rq01 = new ArrayList<Request>();
					List<Request> rq02 = new ArrayList<Request>();
					List<Request>  rq = lrcm.queryListRequestCustomer(rqs);
					
					
						for(int i = 0 ; i < rq.size() ; i++ ) {
							System.out.println("rq ==="+rq.get(i).getRequestid());
							if(rq.get(i).getStatus().equals("รอยืนยันใบเสนอราคา") && rq.get(i).getCustomer().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
								rq01.add(rq.get(i));
							}else if(rq.get(i).getStatus().equals("รอผู้ให้บริการยืนยัน") && rq.get(i).getCustomer().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")){
								if(!rq.get(i).getSelectProvider().equals("-")) {
									String a = rq.get(i).getSelectProvider();
									String[] allmonth = a.split(",");
									
									for(int x=0;x< allmonth.length;x++) {
										System.out.println("allmonth == "+allmonth[x]);
										if(allmonth[x].equals(cpid)) {
											rq02.add(rq.get(i));
										}
									}
								}	
							}
						}
						System.out.println("rq01.size()=========="+rq01.size());
						System.out.println("rq02.size()=========="+rq02.size());
						request.setAttribute("listrequest01", rq01);
						request.setAttribute("listrequest02", rq02);
						request.setAttribute("statusPick", "ทั้งหมด");
					request.setAttribute("user", user);
		return "listRequestCustomer"; 
	}
	@RequestMapping(value="/searchGetAddressType",method=RequestMethod.POST)
	public ModelAndView getAddressType(HttpServletRequest request,HttpSession session) {
			String message = "";
		ModelAndView mav = new ModelAndView("listRequestCustomer");
		try {
		request.setCharacterEncoding("UTF-8");
		String subdistrict = request.getParameter("subDistrict");
		String district = request.getParameter("district");
		String province = request.getParameter("province");
		String postcode = request.getParameter("postcode");
		String statusType = request.getParameter("statusType");
		Login user = (Login) session.getAttribute("user");
		
		ListRequestCustomerManager lrcm = new ListRequestCustomerManager();
		List<Member> members  = lrcm.findCustomerDataForMember(user);
			int memid = 0 ;
			String sd = ""; 
			for(Member m : members) {
				memid = m.getMemberid();
				sd = m.getDistrict();
			}
			List<CleanerProvider> cp = lrcm.getCleanerProviderID(memid);
			String cpid = "";
				for(CleanerProvider clp : cp) {
					cpid = String.valueOf(clp.getPrivderid());
					System.out.println("CleanerProvider OD =="+clp.getPrivderid());
				}
			List<Quotations> quotations = lrcm.getOfferQuotationData(memid);
				System.out.println("quotations==="+quotations.size());
			 List<Request> requests = lrcm.getListRequest();
			 int q = 0;
			 List<String> rqs = new ArrayList<String>();
			 System.out.println("subdistrict===="+subdistrict);
			 for(int i =0 ; i < requests.size() ; i++) {
				 if(subdistrict != "") {
					 if(requests.get(i).getSubDistrict().equals(subdistrict) && requests.get(i).getDistrict().equals(district)
							 && requests.get(i).getProvince().equals(province) && requests.get(i).getPostcode().equals(postcode)) {
						if(quotations.size() != 0) {
							
							if(requests.get(i).getRequestid() != quotations.get(q).getRequest().getRequestid()) {		
									rqs.add( String.valueOf(requests.get(i).getRequestid()));
										q++;
										 if(q >= quotations.size()) {
											q = 0;
										}
							}	
						}else {
							rqs.add( String.valueOf(requests.get(i).getRequestid()));
//							q++;
//							 if(q >= quotations.size()) {
//								q = 0;
//							}
						}
					}
				 }else {
					 if(requests.get(i).getDistrict().equals(sd)) {
							if(quotations.size() != 0) {
								if(requests.get(i).getRequestid() != quotations.get(q).getRequest().getRequestid()) {
										rqs.add( String.valueOf(requests.get(i).getRequestid()));
											q++;
											 if(q >= quotations.size()) {
												q = 0;
											}
									}	
								}else {
									rqs.add( String.valueOf(requests.get(i).getRequestid()));
//									q++;
//									 if(q >= quotations.size()) {
//										q = 0;
//									}
								}
							}
				 }
			}
			 
			 Map<Integer, Integer> attMaps = new HashMap<Integer, Integer>();
			 	for (int i = 0 ; i < quotations.size() ; i++) {
					attMaps.put(i, quotations.get(i).getRequest().getRequestid());
				}
			 	
			 	List<String> rqs2 = rqs;
			 	 Map<String, String> rqsMaps = new HashMap<String, String>();
			 	for(int i = 0 ; i < rqs2.size();i++) {
			 		System.out.println("RQS == "+ rqs2.get(i));
			 		for(int j =0 ; j< attMaps.size();j++) {
			 			System.out.println("attMap ="+attMaps.get(j));
			 			if(rqs2.get(i).equals(String.valueOf(attMaps.get(j)))) {
			 				System.out.println("Add RQS == "+rqs2.get(i));
			 				rqs2.remove(rqs2.get(i));
			 			}
			 		}
			 	}
		
				List<Request> rq01 = new ArrayList<Request>();
				List<Request> rq02 = new ArrayList<Request>();
				List<Request>  rq = lrcm.queryListRequestCustomer(rqs2);
					for(int i = 0 ; i < rq.size() ; i++) {
						if(statusType.equals("รอยืนยันใบเสนอราคา") && rq.get(i).getCustomer().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
							rq01.add(rq.get(i));
							
						}else if(statusType.equals("รอผู้ให้บริการยืนยัน") && rq.get(i).getCustomer().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
							if(!rq.get(i).getSelectProvider().equals("-")) {
								String a = rq.get(i).getSelectProvider();
								String[] allmonth = a.split(",");
								
								for(int x=0;x< allmonth.length;x++) {
									System.out.println("allmonth == "+allmonth[x]);
									if(allmonth[x].equals(cpid)) {
										rq02.add(rq.get(i));
									}
								}
							}	
						}else {
							if(rq.get(i).getStatus().equals("รอยืนยันใบเสนอราคา") && rq.get(i).getCustomer().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
								rq01.add(rq.get(i));
							}else if(rq.get(i).getStatus().equals("รอผู้ให้บริการยืนยัน") && rq.get(i).getCustomer().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")){
								if(!rq.get(i).getSelectProvider().equals("-")) {
									String a = rq.get(i).getSelectProvider();
									String[] allmonth = a.split(",");
									
									for(int x=0;x< allmonth.length;x++) {
										System.out.println("allmonth == "+allmonth[x]);
										if(allmonth[x].equals(cpid)) {
											rq02.add(rq.get(i));
										}
									}
								}	
							}
						}
					}
					request.setAttribute("listrequest01", rq01);
					request.setAttribute("listrequest02", rq02);
					request.setAttribute("statusPick", statusType);
					request.setAttribute("user", user);
					message = "";	
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}
}
