package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.ListAccountCleanerProviderDetailMagamer;
import com.springmvc.manager.ListAccountCustomerDeatilManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.ServicePerson;

@Controller
public class ListAccountCustomerDetailController {
	@RequestMapping(value="/goListAccountCustomer",method=RequestMethod.GET)
	public String loadListAccountCustomerPage(HttpSession session,HttpServletRequest request){
		
		Login user = (Login) session.getAttribute("user");
		 session.setAttribute("user", user);
		ListAccountCustomerDeatilManager lacdm = new ListAccountCustomerDeatilManager();
			List<Customer> customers = lacdm.findNameAccountCustomer();
			request.setAttribute("listcustomers", customers);
			for (Customer customer : customers) {
				System.out.println("Session List Customer ---- "+customer.getFirsName());
			}
			
		
		
		return "listAccountCustomerDetail"; 
	}
	@RequestMapping(value = "/findListAccountCustomerName", method = RequestMethod.POST)
	public ModelAndView getCustomerNameData(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listAccountCustomerDetail");

		try {
			request.setCharacterEncoding("UTF-8");
			Login user = (Login) session.getAttribute("user");
			 session.setAttribute("user", user);
			ListAccountCustomerDeatilManager lacdm = new ListAccountCustomerDeatilManager();
				List<Customer> customers = lacdm.findNameAccountCustomer();
			String searchname = request.getParameter("sname");
				System.out.println("searchname===="+searchname);
				List<Customer> cus = new ArrayList<Customer>();
				for(Customer c : customers) {
					if(c.getFirsName().contains(searchname) || c.getLastName().contains(searchname)) {
						System.out.println("searchname2222===="+c.getFirsName());
						Login l = new Login(c.getLogin().getUsername(), c.getLogin().getPassword(), c.getLogin().getLoginType(), c.getLogin().getStatus());
						Customer c1 = new Customer(c.getMemberid(), c.getTel(), c.getEmail(), c.getAddress(), 
								c.getSubDistrict(), c.getDistrict(), c.getProvince(), c.getPostcode(), c.getLatitude(),
								c.getLongitude(), l, c.getCustomerid(), c.getFirsName(), c.getLastName());
						cus.add(c1);
					}
				}
				request.setAttribute("listcustomers", cus);
		
							
			message = "";	
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}
	@RequestMapping(value = "/findAccountCustomerDetail", method = RequestMethod.POST)
	public ModelAndView getAccountCustomerCategory(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listAccountCustomerDetail");

		try {
			request.setCharacterEncoding("UTF-8");
			
			 
			ListAccountCustomerDeatilManager lacdm = new ListAccountCustomerDeatilManager();

			String searchname = request.getParameter("searchname");
			
			String statusAccountType = request.getParameter("statusAccountType");
			System.out.println("statusAccountType =="+statusAccountType);
				
			List<Login> logins = lacdm.ListLogin();
						
							List<String> loginid = new ArrayList<String>();
								for(Login l : logins) {
									if(l.getStatus().equals(statusAccountType)) {
										loginid.add(l.getStatus());
										System.out.println("Status ===="+ String.valueOf(l.getStatus()));
									}
								}
								
								
							if(statusAccountType.equals("ทั้งหมด")) {
								List<Customer> customers = lacdm.findNameAccountCustomer();
								request.setAttribute("listcustomers", customers);
							}
							
						List<Customer> customers = lacdm.findNameAccountCustomer();
						
						if(searchname != "") {
							List<Customer> cus = new ArrayList<Customer>();
							int i = 0;
							for(Customer c : customers) {
									if( c.getLogin().getStatus().equals(statusAccountType)) {
										if(c.getFirsName().contains(searchname) || c.getLastName().contains(searchname) ) {
											System.out.println("searchname2222===="+c.getFirsName());
											
											Login l = new Login(c.getLogin().getUsername(), c.getLogin().getPassword(), c.getLogin().getLoginType(), c.getLogin().getStatus());
											Customer c1 = new Customer(c.getMemberid(), c.getTel(), c.getEmail(), c.getAddress(), 
													c.getSubDistrict(), c.getDistrict(), c.getProvince(), c.getPostcode(), c.getLatitude(),
													c.getLongitude(), l, c.getCustomerid(), c.getFirsName(), c.getLastName());
											cus.add(c1);
											i++;
										}
										
									}else if(c.getLogin().getStatus().equals(statusAccountType)) {
										System.out.println("searchname else ===="+c.getFirsName());
										
										
										Login l = new Login(c.getLogin().getUsername(), c.getLogin().getPassword(), c.getLogin().getLoginType(), c.getLogin().getStatus());
										Customer c1 = new Customer(c.getMemberid(), c.getTel(), c.getEmail(), c.getAddress(), 
												c.getSubDistrict(), c.getDistrict(), c.getProvince(), c.getPostcode(), c.getLatitude(),
												c.getLongitude(), l, c.getCustomerid(), c.getFirsName(), c.getLastName());
										cus.add(c1);
										i++;
										System.out.println("loginid.size()==="+loginid.size());
									}
								if(i > (loginid.size()-1)) {
								
									i--;
								}
								
							}
							request.setAttribute("listcustomers", cus);
						}else {
							List<Customer> cus = new ArrayList<Customer>();
							int i = 0;
							for(Customer c : customers) {
								if(c.getLogin().getStatus().equals(loginid.get(i))) {
									System.out.println("searchname2222===="+c.getFirsName());
									
									
									Login l = new Login(c.getLogin().getUsername(), c.getLogin().getPassword(), c.getLogin().getLoginType(), c.getLogin().getStatus());
									Customer c1 = new Customer(c.getMemberid(), c.getTel(), c.getEmail(), c.getAddress(), 
											c.getSubDistrict(), c.getDistrict(), c.getProvince(), c.getPostcode(), c.getLatitude(),
											c.getLongitude(), l, c.getCustomerid(), c.getFirsName(), c.getLastName());
									cus.add(c1);
									i++;
									System.out.println("loginid.size()==="+loginid.size());
								}
								
								if(i > (loginid.size()-1)) {
									i--;
								}
							}
							request.setAttribute("listcustomers", cus);
						}
						
				
						
						Login user = (Login) session.getAttribute("user");
						 session.setAttribute("user", user);
			message = "";	
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}
	//Start View Account Cleaner Provider Detail
		@RequestMapping(value="/viewAccountCustomer",method=RequestMethod.GET)
		public String getAccountCustomerID(HttpSession session,HttpServletRequest request){
			
				String id = request.getParameter("id");
				String type = request.getParameter("type");
				Login user = (Login) session.getAttribute("user");
				 session.setAttribute("user", user);
				ListAccountCustomerDeatilManager lacdm = new ListAccountCustomerDeatilManager();
			
				List<Customer> customers = lacdm.findAccountCustomerDetail(id);
				request.setAttribute("viewcustomers", customers);
				request.removeAttribute("listcustomers");
			return "listAccountCustomerDetail"; 
		}
}
