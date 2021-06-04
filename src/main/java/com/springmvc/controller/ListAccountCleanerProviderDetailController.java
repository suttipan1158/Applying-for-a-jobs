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
import com.springmvc.manager.ListCleanerProviderManager;
import com.springmvc.manager.ListQuotationDetailManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.ServicePerson;

@Controller
public class ListAccountCleanerProviderDetailController {
	@RequestMapping(value="/goListAccountCleanerProvider",method=RequestMethod.GET)
	public String loadListAccountCleanerProviderPage(HttpSession session,HttpServletRequest request){
		ListAccountCleanerProviderDetailMagamer lacpdm = new ListAccountCleanerProviderDetailMagamer();
		
				List<ServicePerson> sp = lacpdm.queryListAccuntCleanerProviderPerson();
				List<Company> com = lacpdm.queryListAccuntCleanerProviderCompany();
				request.setAttribute("listServicePerson", sp);
				request.setAttribute("listCompany", com);
		
		
		return "listAccountCleanerProvider"; 
	}
	@RequestMapping(value = "/findListAccountCleanerProviderName", method = RequestMethod.POST)
	public ModelAndView getCleanerProviderName(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listAccountCleanerProvider");

		try {
			request.setCharacterEncoding("UTF-8");
			ListAccountCleanerProviderDetailMagamer lacpdm = new ListAccountCleanerProviderDetailMagamer();

			String searchname = request.getParameter("sname");
			
			List<ServicePerson> sp = lacpdm.queryListAccuntCleanerProviderPerson();
			List<Company> com = lacpdm.queryListAccuntCleanerProviderCompany();
			
			List<ServicePerson> servicePersons = new ArrayList<ServicePerson>();
				for(ServicePerson s: sp) {
					if(s.getFirstName().contains(searchname) || s.getLastName().contains(searchname)) {
						Login login = new Login(s.getLogin().getUsername(), s.getLogin().getPassword(), s.getLogin().getLoginType(), s.getLogin().getStatus());
						ServicePerson servicePerson01 = new ServicePerson(s.getMemberid(), s.getTel(), s.getEmail(), s.getAddress(),
								s.getSubDistrict(), s.getDistrict(), s.getProvince(), s.getPostcode(), s.getLatitude(), s.getLongitude(),
								login, s.getPrivderid(), s.getPrivatetype(), s.getProfilePhoto(), s.getPersonid(), s.getFirstName(),
								s.getLastName(), s.getIdCardsPhoto(), s.getCouplePhotoidCards());
						servicePersons.add(servicePerson01);
					}
				}
				List<Company> companies = new ArrayList<Company>();
				for(Company c : com) {
					if(c.getCompanyName().contains(searchname)) {
						Login login = new Login(c.getLogin().getUsername(), c.getLogin().getPassword(), c.getLogin().getLoginType(), c.getLogin().getStatus());
						Company company01 = new Company(c.getMemberid(), c.getTel(), c.getEmail(), c.getAddress(), c.getSubDistrict(),
								c.getDistrict(), c.getProvince(), c.getPostcode(), c.getLatitude(), c.getLongitude(), login, c.getPrivderid(), 
								c.getPrivatetype(), c.getProfilePhoto(), c.getCompanyid(), c.getCompanyName(), c.getContactName(), c.getBusinessLicense(), 
								c.getFacebookFanpage(),c.getFacebookFanpageURL(), c.getWebSite(),c.getWebSiteURL());
						companies.add(company01);
					}
				}
				request.setAttribute("listServicePerson", servicePersons);
				request.setAttribute("listCompany", companies);
				
				
			message = "";	
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}
	@RequestMapping(value = "/findListAccountCleanerProvider", method = RequestMethod.POST)
	public ModelAndView getCategoryAccount(HttpServletRequest request,HttpSession session) {
		String message = "";
		ModelAndView mav = new ModelAndView("listAccountCleanerProvider");

		try {
			request.setCharacterEncoding("UTF-8");
			ListAccountCleanerProviderDetailMagamer lacpdm = new ListAccountCleanerProviderDetailMagamer();

			String searchname = request.getParameter("searchname");
			String statusAccountType = request.getParameter("statusAccountType");
			String providerType = request.getParameter("providerType");
			
			System.out.println("searchname =="+searchname);
			List<ServicePerson> sp = lacpdm.queryListAccuntCleanerProviderPerson();
			List<Company> com = lacpdm.queryListAccuntCleanerProviderCompany();
			
			List<ServicePerson> servicePersons1 = new ArrayList<ServicePerson>();
			if(providerType.equals("บุคคล")  || providerType.equals("ทั้งหมด")) {
				List<ServicePerson> servicePersons = new ArrayList<ServicePerson>();
				if(searchname != "") {
					for(ServicePerson s: sp) {
						if(s.getFirstName().contains(searchname) || s.getLastName().contains(searchname)) {
							Login login = new Login(s.getLogin().getUsername(), s.getLogin().getPassword(), s.getLogin().getLoginType(), s.getLogin().getStatus());
							ServicePerson servicePerson01 = new ServicePerson(s.getMemberid(), s.getTel(), s.getEmail(), s.getAddress(),
									s.getSubDistrict(), s.getDistrict(), s.getProvince(), s.getPostcode(), s.getLatitude(), s.getLongitude(),
									login, s.getPrivderid(), s.getPrivatetype(), s.getProfilePhoto(), s.getPersonid(), s.getFirstName(),
									s.getLastName(), s.getIdCardsPhoto(), s.getCouplePhotoidCards());
							servicePersons.add(servicePerson01);
						}
					}
				}else {
					servicePersons.addAll(sp);
				}
				
				for(ServicePerson s1 : servicePersons){
					if(s1.getLogin().getStatus().equals(statusAccountType)) {
						Login login = new Login(s1.getLogin().getUsername(), s1.getLogin().getPassword(), s1.getLogin().getLoginType(), s1.getLogin().getStatus());
						ServicePerson servicePerson01 = new ServicePerson(s1.getMemberid(), s1.getTel(), s1.getEmail(), s1.getAddress(),
								s1.getSubDistrict(), s1.getDistrict(), s1.getProvince(), s1.getPostcode(), s1.getLatitude(), s1.getLongitude(),
								login, s1.getPrivderid(), s1.getPrivatetype(), s1.getProfilePhoto(), s1.getPersonid(), s1.getFirstName(),
								s1.getLastName(), s1.getIdCardsPhoto(), s1.getCouplePhotoidCards());
						servicePersons1.add(servicePerson01);
					}else if(statusAccountType.equals("อนุญาตให้เข้าใช้งาน")){
						Login login = new Login(s1.getLogin().getUsername(), s1.getLogin().getPassword(), s1.getLogin().getLoginType(), s1.getLogin().getStatus());
						ServicePerson servicePerson01 = new ServicePerson(s1.getMemberid(), s1.getTel(), s1.getEmail(), s1.getAddress(),
								s1.getSubDistrict(), s1.getDistrict(), s1.getProvince(), s1.getPostcode(), s1.getLatitude(), s1.getLongitude(),
								login, s1.getPrivderid(), s1.getPrivatetype(), s1.getProfilePhoto(), s1.getPersonid(), s1.getFirstName(),
								s1.getLastName(), s1.getIdCardsPhoto(), s1.getCouplePhotoidCards());
						servicePersons1.add(servicePerson01);
					}
				}
			}
			request.setAttribute("listServicePerson", servicePersons1);
				
			List<Company> companies1 = new ArrayList<Company>();
			if(providerType.equals("บริษัท") || providerType.equals("ทั้งหมด")) {
				List<Company> companies = new ArrayList<Company>();
				if(searchname != "") {
					for(Company c : com) {
						if(c.getCompanyName().contains(searchname)) {
							Login login = new Login(c.getLogin().getUsername(), c.getLogin().getPassword(), c.getLogin().getLoginType(), c.getLogin().getStatus());
							Company company01 = new Company(c.getMemberid(), c.getTel(), c.getEmail(), c.getAddress(), c.getSubDistrict(),
									c.getDistrict(), c.getProvince(), c.getPostcode(), c.getLatitude(), c.getLongitude(), login, c.getPrivderid(), 
									c.getPrivatetype(), c.getProfilePhoto(), c.getCompanyid(), c.getCompanyName(), c.getContactName(), c.getBusinessLicense(), 
									c.getFacebookFanpage(),c.getFacebookFanpageURL(), c.getWebSite(),c.getWebSiteURL());
							companies.add(company01);
						}
					}
				}else {
						
					companies.addAll(com);
				}
				
				
				for(Company c1 : companies) {
					if(c1.getLogin().getStatus().equals(statusAccountType)) {
						Login login = new Login(c1.getLogin().getUsername(), c1.getLogin().getPassword(), c1.getLogin().getLoginType(), c1.getLogin().getStatus());
						Company company01 = new Company(c1.getMemberid(), c1.getTel(), c1.getEmail(), c1.getAddress(), c1.getSubDistrict(),
								c1.getDistrict(), c1.getProvince(), c1.getPostcode(), c1.getLatitude(), c1.getLongitude(), login, c1.getPrivderid(), 
								c1.getPrivatetype(), c1.getProfilePhoto(), c1.getCompanyid(), c1.getCompanyName(), c1.getContactName(), c1.getBusinessLicense(), 
								c1.getFacebookFanpage(),c1.getFacebookFanpageURL(), c1.getWebSite(),c1.getWebSiteURL());
						
						companies1.add(company01);
					}else if(statusAccountType.equals("อนุญาตให้เข้าใช้งาน")){
						Login login = new Login(c1.getLogin().getUsername(), c1.getLogin().getPassword(), c1.getLogin().getLoginType(), c1.getLogin().getStatus());
						Company company01 = new Company(c1.getMemberid(), c1.getTel(), c1.getEmail(), c1.getAddress(), c1.getSubDistrict(),
								c1.getDistrict(), c1.getProvince(), c1.getPostcode(), c1.getLatitude(), c1.getLongitude(), login, c1.getPrivderid(), 
								c1.getPrivatetype(), c1.getProfilePhoto(), c1.getCompanyid(), c1.getCompanyName(), c1.getContactName(), c1.getBusinessLicense(), 
								c1.getFacebookFanpage(),c1.getFacebookFanpageURL(), c1.getWebSite(),c1.getWebSiteURL());
						
						companies1.add(company01);
					}
				}
			}
						
			request.setAttribute("listCompany", companies1);
			message = "";	
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}
//Start View Account Cleaner Provider Detail
	@RequestMapping(value="/findAccountCleanerProvider",method=RequestMethod.GET)
	public String getAccountID(HttpSession session,HttpServletRequest request){
		
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			
			ListAccountCleanerProviderDetailMagamer lacpm = new ListAccountCleanerProviderDetailMagamer();
		
				List<ServicePerson> servicePersons = new ArrayList<ServicePerson>();
				List<Company> companies = new ArrayList<Company>();
					if(type.equals("บุคคล")) {
						servicePersons = lacpm.findAccountCleanerProviderFromServicePerson(id);
						
					}else if(type.equals("บริษัท")) {
						companies= lacpm.findAccountCleanerProviderFromCompany(id);
					
					}
					request.setAttribute("viewCP", companies);
					request.setAttribute("viewSP", servicePersons);
					request.removeAttribute("listServicePerson");
					request.removeAttribute("listCompany");
		return "listAccountCleanerProvider"; 
	}
}
