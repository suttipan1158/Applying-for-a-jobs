package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.EditAccountStatusManager;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.ServicePerson;


@Controller
public class EditAccountStatusComtroller {
	
	///Update data for Customer
	@RequestMapping(value = "/isEditAccountStatusCustomer", method = RequestMethod.POST)
	public ModelAndView getCategoryStatusCustomer(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listAccountCustomerDetail");

		try {
			Login user = (Login) session.getAttribute("user"); 
			session.setAttribute("user", user); 
			request.setCharacterEncoding("UTF-8");
			EditAccountStatusManager easm = new EditAccountStatusManager();
				String cusid = request.getParameter("cusid");
				String statustype = request.getParameter("statustype");
				List<Customer> customers = easm.findAccountCustomerID(cusid);
					String user1 = "";
						for(Customer c :customers) {
							user1 = c.getLogin().getUsername();
							System.out.println("user =="+ c.getLogin().getUsername());
						}
						
				List<Login> logins = easm.findLoginID(user1);
				message = easm.isEditAccountStatusCustomer(logins,statustype);
				
			
				List<Customer> customers2 = easm.viewAccountCustomerDetail(cusid);
						request.setAttribute("viewcustomers", customers2);
						request.removeAttribute("listcustomers");
		} catch (Exception e) {
			e.printStackTrace();
			message = "2";
		}
		mav.addObject("messageEditCustomer", message);
		return mav;
	}
	///Update data for Customer
		@RequestMapping(value = "/isEditAccountStatusCleanerProvider", method = RequestMethod.POST)
		public ModelAndView isEditAccountStatusCleanerProvider(HttpServletRequest request,HttpSession session) {
			String message = "";
			ModelAndView mav = new ModelAndView("listAccountCleanerProvider");

			try {
				request.setCharacterEncoding("UTF-8");
				EditAccountStatusManager easm = new EditAccountStatusManager();
					String allid = request.getParameter("allid");
					String statustype = request.getParameter("statustype");
					String accountType = request.getParameter("accountType");
					Login user = (Login) session.getAttribute("user"); 
					session.setAttribute("user", user); 
					if(accountType.equals("บริษัท")) {
						List<Company> companies = easm.findAccountCompanyID(allid);
						String user1 = "";
							for(Company c :companies) {
								user1 = c.getLogin().getUsername();
								System.out.println("user =="+ c.getLogin().getUsername());
							}
							
						List<Login> logins = easm.findLoginID(user1);
						message = easm.isEditAccountStatusCustomer(logins,statustype);
					
						List<Company> companies2= easm.findAccountCleanerProviderFromCompany(allid);
						request.setAttribute("viewCP", companies2);
							
					}else {
						List<ServicePerson> servicePersons =easm.findAccountServicePersonID(allid);
						String user1 = "";
						for(ServicePerson sp :servicePersons) {
							user1 = sp.getLogin().getUsername();
							System.out.println("user =="+ sp.getLogin().getUsername());
						}
						
					List<Login> logins = easm.findLoginID(user1);
					message = easm.isEditAccountStatusCustomer(logins,statustype);
					

					List<ServicePerson> servicePersons2 = easm.findAccountCleanerProviderFromServicePerson(allid);

						
					request.setAttribute("viewSP", servicePersons2);
						
					}
					
			} catch (Exception e) {
				e.printStackTrace();
				message = "2";
			}
			mav.addObject("messageEditCleanerProvider", message);
			return mav;
		}
}
