package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.ViewCleanerProviderManager;
import com.springmvc.model.Company;
import com.springmvc.model.Quotations;
import com.springmvc.model.ServicePerson;

@Controller
public class ViewCleanerProviderController {
	@RequestMapping(value="/goViewCleanerProvider",method=RequestMethod.GET)
	public String getCleanerProviderID(HttpSession session,HttpServletRequest request){
		

			String id = request.getParameter("id");
			String type = request.getParameter("type");
				
				
				System.out.println("Seemore ==="+id);
		ViewCleanerProviderManager vcpm = new ViewCleanerProviderManager();
			if(type.equals("บุคคล")) {
				List<ServicePerson> sp = vcpm.ViewCleanerProviderDetailOfServiceProson(id);
					int providerid =0;
					System.out.println("sp =="+sp.size());
						for(ServicePerson sp2: sp) {
							providerid = sp2.getMemberid();
							
						}
						
						List<Quotations> cp =vcpm.fineQuotationsID(providerid);
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
							
								
						request.setAttribute("listQuotations", cp);
						request.setAttribute("searchSP", sp);
						request.removeAttribute("searchCOM");
			}else if(type.equals("บริษัท")){
				List<Company> com = vcpm.ViewCleanerProviderDetailOfCompany(id);
				int providerid =0;
				System.out.println("sp =="+com.size());
					for(Company company: com) {
						providerid = company.getMemberid();
						
					}
					
					List<Quotations> cp =vcpm.fineQuotationsID(providerid);
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
				
					request.setAttribute("listQuotations", cp);
					request.setAttribute("searchCOM", com);
					request.removeAttribute("searchSP");
			}
			
			
		return "viewCleanerProvider"; 
	}
}
