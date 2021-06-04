package com.springmvc.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.ListCleanerProviderManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Review;
import com.springmvc.model.ServicePerson;

@Controller
public class ListCleanerProviderController {
	@RequestMapping(value="/gotest",method=RequestMethod.GET)
	public String loadtestPage(HttpSession session,HttpServletRequest request){
		ListCleanerProviderManager lcpm = new ListCleanerProviderManager();
	
				List<ServicePerson> sp = lcpm.listCleanerProviderServicePerson();
				List<Company> com = lcpm.listCleanerProviderCompany();
				request.setAttribute("searchSP", sp);
				request.setAttribute("searchCOM", com);
				Login user = (Login) session.getAttribute("user"); 
				session.setAttribute("user", user);
		
		return "test"; 
	}
	
	@RequestMapping(value="/goListCleanerProvider",method=RequestMethod.GET)
	public String getLocationData(HttpSession session,HttpServletRequest request){
		ListCleanerProviderManager lcpm = new ListCleanerProviderManager();
				List<ServicePerson> sp = lcpm.listCleanerProviderServicePerson();
				List<Company> com = lcpm.listCleanerProviderCompany();
				
				List<Quotations> qtt = lcpm.getQuotations();
					List<Quotations> qttReview = new ArrayList<Quotations>();
					for (int i = 0; i < qtt.size() ; i++) {
						if(qtt.get(i).getReview() != null) {
							qttReview.add(qtt.get(i));
						}
					}
					Map<String, String>  reviewID = new HashMap<String, String>();
					for (int i = 0; i < qttReview.size(); i++) {
						reviewID.put(String.valueOf(qttReview.get(i).getCleanerprovider().getMemberid()), String.valueOf(qttReview.get(i).getCleanerprovider().getMemberid()));
					}
					
					System.out.println(reviewID.size());
					List<String> rw = new ArrayList<String>();
						for (Entry<String, String> entry : reviewID.entrySet()) {
							 System.out.print("Key: " + entry.getKey() + ", ");
					          System.out.println("Value: " + entry.getValue());
							rw.add(String.valueOf(entry.getKey()));
						}
						
						List<Quotations> q2 = new ArrayList<Quotations>();
					for (int i = 0; i < rw.size(); i++) {
						int q = 0;
						 int no = 0;
						for (int j = 0; j < qttReview.size(); j++) {
							if(rw.get(i).equals(String.valueOf(qttReview.get(j).getCleanerprovider().getMemberid()))) {
								
									q += qttReview.get(j).getReview().getServiceScore();
								
								no++;
								System.out.println(" ID :"+ rw.get(i));
								System.out.println(" Score :"+ q + " no :"+no);
							}
						}
						Quotations q3 = new Quotations(Integer.parseInt(rw.get(i)),0.0,String.valueOf(q),String.valueOf(no)); 
							q2.add(q3);
					}
				
					for (Quotations string : q2) {
						System.out.println("id :"+string.getQuotationsid()+" Job :"+string.getPriceOfferJob()+" Note: "+string.getNote()+" Status: "+string.getStatus());
					}
					
					request.setAttribute("searchSP", sp);
					request.setAttribute("searchCOM", com);
					request.removeAttribute("searchAddress");
					request.setAttribute("providerReview", q2);
		return "listCleanerProvider"; 
	}
}
