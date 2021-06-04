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
import com.springmvc.manager.OfferQuotationManager;
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
public class OfferQuotationController {
	@RequestMapping(value="/isOfferQuotationData",method=RequestMethod.POST)
	public ModelAndView getOfferQuotationData(HttpServletRequest request,HttpSession session) {
			String message = "";
			ModelAndView mav = new ModelAndView("listRequestCustomer");
				
			List<Request> requests = (List<Request>) session.getAttribute("requests");
			
			List<CleanerProvider> listprovider = (List<CleanerProvider>) session.getAttribute("listprovider");
			try {			
				OfferQuotationManager oqm = new OfferQuotationManager();
				List<Quotations> listquotations = oqm.getOfferQuotationData();
				request.setCharacterEncoding("UTF-8");
				
				String priceofferjob = request.getParameter("priceofferjob");
				String priceofferdate = request.getParameter("priceofferdate");
				String noteOffer = request.getParameter("noteOffer");
				String statusoffer = request.getParameter("statusoffer");
				
				int quotationsid = 0;
					for(Quotations q : listquotations) {
						if(quotationsid < q.getQuotationsid()) {
							quotationsid = q.getQuotationsid();
						}
					}
						if(quotationsid != 0) {
							quotationsid++;
		  				}else {
		  					quotationsid = 100;
		  				}
				Request rq = new Request();
					for(Request r : requests) {
						rq.setRequestid(r.getRequestid());
						rq.setCleanNo(r.getCleanNo());
						rq.setAddressType(r.getAddressType());
						rq.setAbodeFormat(r.getAbodeFormat());
						rq.setTimePeriod(r.getTimePeriod());
						rq.setServiceDate(r.getServiceDate());
						rq.setServicePeriod(r.getServicePeriod());
						rq.setSelectProvider(r.getSelectProvider());
						rq.setPriceMin(r.getPriceMin());
						rq.setPriceMax(r.getPriceMax());
						rq.setNote(r.getNote());
						rq.setAddress(r.getAddress());
						rq.setSubDistrict(r.getSubDistrict());
						rq.setDistrict(r.getDistrict());
						rq.setProvince(r.getProvince());
						rq.setPostcode(r.getPostcode());
						rq.setLatitude(r.getLatitude());
						rq.setLongitude(r.getLongitude());
						rq.setAnimal(r.getAnimal());
						rq.setStatus(r.getStatus());
						rq.setDoProvider(r.getDoProvider());
						rq.setWeekNo(r.getWeekNo());
						rq.setDayInWeek(r.getDayInWeek());
						rq.setMonthNo(r.getMonthNo());
						rq.setDayInMonth(r.getDayInMonth());
					}
				CleanerProvider cp = new CleanerProvider();
						for(CleanerProvider c : listprovider) {
								cp.setMemberid(c.getMemberid());
								cp.setTel(c.getTel());
								cp.setEmail(c.getEmail());
								cp.setAddress(c.getAddress());
								cp.setSubDistrict(c.getSubDistrict());
								cp.setDistrict(c.getDistrict());
								cp.setProvince(c.getProvince());
								cp.setPostcode(c.getPostcode());
								cp.setLatitude(c.getLatitude());
								cp.setLongitude(c.getLongitude());
								cp.setPrivderid(c.getPrivderid());
								cp.setProfilePhoto(c.getProfilePhoto());
						}
				Quotations quotations = new Quotations(quotationsid, Double.parseDouble(priceofferjob), noteOffer, statusoffer);
						DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
						Date dbay = df.parse(priceofferdate);
							quotations.setPriceOffrtDate(dbay);
							quotations.setRequest(rq);
							quotations.setCleanerprovider(cp);
					message = oqm.isOfferQuotationData(quotations);
					
	///Return New Data List Request Customer
					List<Quotations> listquotations1 = oqm.getOfferQuotationData();
				List<Quotations> qtt = new ArrayList<Quotations>();
					for(Quotations q : listquotations1) {
						if(q.getCleanerprovider().getMemberid() == listprovider.get(0).getMemberid()) {
							qtt.add(q);
						}
					}
					 List<Request> listrequests = oqm.getListRequest();
				int q = 0 ;
				List<String> rqs = new ArrayList<String>();
				for(int i = 0 ; i< listrequests.size() ; i++) {
					if(listrequests.get(i).getDistrict().equals(listprovider.get(0).getDistrict())) {
						if(qtt.size() != 0) {
							if(qtt.get(q).getRequest().getRequestid() != listrequests.get(i).getRequestid()) {
								System.out.println("getRequestid == "+listrequests.get(i).getRequestid()+"quotations =="+qtt.get(q).getRequest().getRequestid());
								
								rqs.add( String.valueOf(listrequests.get(i).getRequestid()));

									  q++; 
									  if(q >= qtt.size()) {
										  q = 0; 
										  }
							}	
						}
						}
					}
				
				 List<String> rqs02 = new ArrayList<String>();
					for(int i = 0; i < rqs.size();i++) {
						for(int j = 0 ;j < qtt.size();j++) {
							if(Integer.parseInt(rqs.get(i)) == qtt.get(j).getRequest().getRequestid()) {
								System.out.println(" rqs == quotations=="+rqs.get(i));
								rqs02.add(rqs.get(i));
							}
						}
					}
					for(int i = 0; i < rqs.size();i++) {
						for(int j = 0 ;j < rqs02.size();j++) {
							if(rqs.get(i).equals(rqs02.get(j))) {
								rqs.remove(i);
							}
							
						}
					}
				 	
					for(String s : rqs) {
					
						System.out.println("rqs01 =="+s);
					}
					List<Request> rq01 = new ArrayList<Request>();
					List<Request> rq02 = new ArrayList<Request>();
					List<Request>  rq03 = oqm.getListRequestID(rqs);
				
						for(Request r : rq03) {
							if(r.getStatus().equals("รอยืนยันใบเสนอราคา")) {
								rq01.add(r);
							}else if(r.getStatus().equals("รอผู้ให้บริการยืนยัน")){
								rq02.add(r);
							}
						}
						System.out.println("rq01.size()=========="+rq01.size());
						System.out.println("rq02.size()=========="+rq02.size());
						request.setAttribute("listrequest01", rq01);
						request.setAttribute("listrequest02", rq02);
						request.setAttribute("statusPick", "ทั้งหมด");

			} catch (Exception e) {
				e.printStackTrace();
				message = "2";
			}
			mav.addObject("messageOffer", message);
			return mav;
	}
}
