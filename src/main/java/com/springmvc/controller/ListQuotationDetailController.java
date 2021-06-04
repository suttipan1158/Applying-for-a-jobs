package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.ListCleanerProviderManager;
import com.springmvc.manager.ListQuotationDetailManager;
import com.springmvc.model.Company;
import com.springmvc.model.Quotations;
import com.springmvc.model.ServicePerson;

@Controller
public class ListQuotationDetailController {
	@RequestMapping(value="/goListQuotationDetail",method=RequestMethod.GET)
	public String getRequestCleanerID(HttpSession session,HttpServletRequest request){
		
			String id = request.getParameter("id");
			
			ListQuotationDetailManager lqdm = new ListQuotationDetailManager();
			List<Quotations> quotations = lqdm.findListQuotation(Integer.parseInt(id));
			request.setAttribute("listquotations", quotations);
				System.out.println("quotations size == "+quotations.size());
			List<String> person = new ArrayList<String>();
			List<String> company = new ArrayList<String>();
				for(Quotations q : quotations) {
					if(q.getCleanerprovider().getPrivatetype().equals("บุคคล")&& q.getCleanerprovider().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
						person.add(String.valueOf(q.getCleanerprovider().getMemberid()));
					}else if(q.getCleanerprovider().getPrivatetype().equals("บริษัท")&& q.getCleanerprovider().getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
						company.add(String.valueOf(q.getCleanerprovider().getMemberid()));
					}
				}
				List<ServicePerson> servicePersons = lqdm.findListQuotationServicePerson(person);
				List<Company> companies = lqdm.findListQuotationCompany(company);
				request.setAttribute("listSP", servicePersons);
				request.setAttribute("listCP", companies);
		
		return "listQuotationDetail"; 
	}
	@RequestMapping(value="/goViewQuotationDetail",method=RequestMethod.GET)
	public String getQuotationID(HttpSession session,HttpServletRequest request){
		
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			String idQ = request.getParameter("requestid");
			System.out.println("type ==============="+type);
			ListQuotationDetailManager lqdm = new ListQuotationDetailManager();
					if(type.equals("บุคคล")) {
						List<ServicePerson> servicePersons1 = lqdm.viewQuotationDetailServicePerson(id);
						int providerid =0;
						System.out.println("sp =="+servicePersons1.size());
							for(ServicePerson sp2: servicePersons1) {
								providerid = sp2.getMemberid();
								
							}
							
							List<Quotations> cp =lqdm.viewQuotationDetail(providerid);
							if(cp != null ) {
								System.out.println("cp =="+cp.size());
								double sumscore = 0;
								double totalscore = 0;
								int i = 0;
									for(Quotations q: cp) {
										//quotationid.add(String.valueOf(q.getQuotationsid()));
										if(q.getReview() != null) {
											System.out.println("Reviw Not Null");
											sumscore += q.getReview().getServiceScore();
										}else {
											System.out.println("Reviw == Null");
											sumscore += 0;
											i--;
										}
										i++;
									}
										totalscore = (sumscore/i);
										double SumStarRating = ((sumscore/i)/5)*100;
										
										if(Double.isNaN(totalscore)) {
											totalscore = 0.0;
										}
										
										Double d = new Double(SumStarRating);
										int x = d.intValue();
										System.out.println(totalscore);
										request.setAttribute("SumStarRating", String.valueOf(x));
										request.setAttribute("totalscore", String.valueOf(totalscore));	
										request.setAttribute("SumPopleReview", String.valueOf(i));	
							}
							List<Quotations> quotationsNo = new ArrayList<Quotations>();
							System.out.println("idQ ===="+idQ);
							for (Quotations q : cp) {
								System.out.println("===================== "+q.getRequest().getRequestid()+""+ Integer.parseInt(idQ));
								if (q.getRequest().getRequestid() == Integer.parseInt(idQ) ) {
								
										quotationsNo.add(q);
									
								}
							}
							request.setAttribute("listquotations", quotationsNo);
							 List<ServicePerson> sp = (List<ServicePerson>) request.getAttribute("listSP"); 
							 request.setAttribute("UplistSP", sp);
							 request.setAttribute("Review", cp);
							 request.setAttribute("viewSP", servicePersons1);
							 request.removeAttribute("listSP");
							 request.removeAttribute("viewCP");
								
					}else if(type.equals("บริษัท")) {
						List<Company> companies1 = lqdm.viewQuotationDetailCompany(id);
						int providerid =0;
						System.out.println("sp =="+companies1.size());
							for(Company com: companies1) {
								providerid = com.getMemberid();
								
							}
							
							List<Quotations> cp =lqdm.viewQuotationDetail(providerid);
							if(cp != null) {
								System.out.println("cp =="+cp.size());
								double sumscore = 0;
								double totalscore = 0;
								int i = 0;
									for(Quotations q: cp) {
										//quotationid.add(String.valueOf(q.getQuotationsid()));
										if(q.getReview() != null) {
											System.out.println("Reviw Not Null");
											sumscore += q.getReview().getServiceScore();
										}else {
											System.out.println("Reviw == Null");
											sumscore += 0;
											i--;
										}
										i++;
									}
										totalscore = (sumscore/i);
										double SumStarRating = ((sumscore/i)/5)*100;
										
										if(Double.isNaN(totalscore)) {
											totalscore = 0.0;
										}
										
										Double d = new Double(SumStarRating);
										int x = d.intValue();
										System.out.println(totalscore);
										request.setAttribute("SumStarRating", String.valueOf(x));
										request.setAttribute("totalscore", String.valueOf(totalscore));	
										request.setAttribute("SumPopleReview", String.valueOf(i));	
							}
							List<Quotations> quotationsNo = new ArrayList<Quotations>();
							System.out.println("idQ ===="+idQ);
							for (Quotations q : cp) {
								System.out.println("===================== "+q.getRequest().getRequestid()+""+ Integer.parseInt(idQ));
								if (q.getRequest().getRequestid() == Integer.parseInt(idQ)) {
									quotationsNo.add(q);
									
								}
							}
							request.setAttribute("listquotations", quotationsNo);
							List<Company> com = (List<Company>) request.getAttribute("listCP");
							request.setAttribute("UplistCP", com);
							request.setAttribute("Review", cp);
							request.setAttribute("viewCP", companies1);
							request.removeAttribute("listCP");
							request.removeAttribute("viewSP");
					}
					
		return "listQuotationDetail"; 
	}
}
