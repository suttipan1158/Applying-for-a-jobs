package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.SearchCleanerProviderManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.ServicePerson;

@Controller
public class SearchCleanerProviderController {
//	@RequestMapping(value = "/searchLocation", method = RequestMethod.POST)
//	public ModelAndView getLocationData(HttpServletRequest request,HttpSession session,Model m) {
//		String message = "";
//		ModelAndView mav = new ModelAndView("listCleanerProvider");
//
//		try {
//			request.setCharacterEncoding("UTF-8");
//			SearchCleanerProviderManager scpm = new SearchCleanerProviderManager();
//
//			String subdistrict = request.getParameter("subDistrict");
//			String district = request.getParameter("district");
//			String province = request.getParameter("province");
//			String postcode = request.getParameter("postcode");
//			String providerType = request.getParameter("providerType");
//		
//				
//			message = "";	
//		} catch (Exception e) {
//			e.printStackTrace();
//			message = "Please try again....";
//		}
//		mav.addObject("message", message);
//		return mav;
//	}
	@RequestMapping(value = "/searchCleanerProviderCategory", method = RequestMethod.POST)
	public ModelAndView getAddressandCategoryProvider(HttpServletRequest request,HttpSession session,Model m) {
		String message = "";
		ModelAndView mav = new ModelAndView("listCleanerProvider");

		try {
			request.setCharacterEncoding("UTF-8");
			SearchCleanerProviderManager scpm = new SearchCleanerProviderManager();

			String subdistrict = request.getParameter("subDistrict");
			String district = request.getParameter("district");
			String province = request.getParameter("province");
			String postcode = request.getParameter("postcode");
			String providerType = request.getParameter("providerType");
			
			System.out.println("subdistrict =="+subdistrict);
			List<CleanerProvider> cp = scpm.searchCleanerProviderCategory();
			
				for(int i = 0 ; i < cp.size() ; i++) {
					if(providerType.equals("บุคคล")) {
						if(subdistrict != "") {
							List<ServicePerson> sp = scpm.searchCleanerProviderCategoryPerson(subdistrict, district, province, postcode);
							request.setAttribute("searchSP", sp); 
							request.removeAttribute("searchCOM");
							request.setAttribute("searchAddress", "ตำบล "+subdistrict+" อำเภอ "+district+" จังหวัด "+province+"  "+postcode+" ประเภทผู้ให้บริการ "+providerType);
						}else {
							List<ServicePerson> sp = scpm.listCleanerProviderServicePerson();
							request.setAttribute("searchSP", sp);
							request.removeAttribute("searchCOM");
							request.setAttribute("searchAddress", " ประเภทผู้ให้บริการ  "+providerType);
						}
						
					}else if(providerType.equals("บริษัท")) {
						if(subdistrict != "") {
							List<Company> com = scpm.searchCleanerProviderCategoryCompany(subdistrict, district, province, postcode);
							request.setAttribute("searchCOM", com);
							request.removeAttribute("searchSP");
							request.setAttribute("searchAddress", "ตำบล "+subdistrict+" อำเภอ "+district+" จังหวัด "+province+"  "+postcode+" ประเภทผู้ให้บริการ "+providerType);
						}else {
							List<Company> com = scpm.listCleanerProviderCompany();
							request.setAttribute("searchCOM", com);
							request.removeAttribute("searchSP");
							request.setAttribute("searchAddress", " ประเภทผู้ให้บริการ  "+providerType);
						}
					}else {
						if(subdistrict != "") {
							List<ServicePerson> sp = scpm.searchCleanerProviderCategoryPerson(subdistrict, district, province, postcode);
							request.setAttribute("searchSP", sp);
							List<Company> com = scpm.searchCleanerProviderCategoryCompany(subdistrict, district, province, postcode);
							request.setAttribute("searchCOM", com);
							request.setAttribute("searchAddress", "ตำบล "+subdistrict+" อำเภอ "+district+" จังหวัด "+province+"  "+postcode+" ประเภทผู้ให้บริการ "+providerType);
						}else {
							List<ServicePerson> sp = scpm.listCleanerProviderServicePerson();
							List<Company> com = scpm.listCleanerProviderCompany();
							request.setAttribute("searchSP", sp);
							request.setAttribute("searchCOM", com);
							request.setAttribute("searchAddress", " ประเภทผู้ให้บริการ  "+providerType);
						}
						
					}
				}
				
			message = "";	
		} catch (Exception e) {
			e.printStackTrace();
			message = "Please try again....";
		}
		mav.addObject("message", message);
		return mav;
	}

}
