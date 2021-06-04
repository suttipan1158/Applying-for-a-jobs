package com.springmvc.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.manager.RegisterManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.ServicePerson;

@Controller
public class RegisterController {

	/// link Go Register
	@RequestMapping(value = "/gotoRegister", method = RequestMethod.GET)
	public String loadRegisterPage() {
		return "register";
	}

	/// link Go Index
	@RequestMapping(value = "/doIndex", method = RequestMethod.GET)
	public ModelAndView loadIndexPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("index");
		
		try {
			request.setCharacterEncoding("UTF-8");
		
		RegisterManager rm = new RegisterManager();
			List<ServicePerson> sp = rm.getHibernateListServicePerson();
			List<Company> com = rm.getHibernateListCompany();
					request.setAttribute("listSP", sp);
					request.setAttribute("company", com);
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/getRegisterData", method = RequestMethod.POST)
	public ModelAndView getRegisterData(HttpServletRequest request) {
		String message = "";
		ModelAndView mav = new ModelAndView("index");

		try {
			request.setCharacterEncoding("UTF-8");
			RegisterManager rm = new RegisterManager();
			
			String typeAccount = request.getParameter("typeAccount");
			System.out.println("typeAccount001 ==="+typeAccount);
			if(typeAccount != null) {
				System.out.println("typeAccount ==="+typeAccount);
				List<Member> listmember = rm.getHibernateListMember();
				List<Customer> listcustomer = rm.getHibernateListCustomer();
				int mID = 0;
				int cusID = 0;
				System.out.println(listmember.size());
				System.out.println(listcustomer.size());
				for (Member m : listmember) {
				
					if(mID < m.getMemberid() ) {
						mID = m.getMemberid();
						System.out.println("mID"+mID+"  mID2"+m.getMemberid());
					}
				}
						if(mID != 0) {
		  					mID++;
		  				}else {
		  					mID = 100;
		  				}

				for (Customer c : listcustomer) {
					cusID = c.getCustomerid();
					
				}
						if(cusID != 0) {
							cusID++;
		  				}else {
		  					cusID = 1000;
		  				}
							
				String uname = request.getParameter("username");
				String pwd = request.getParameter("password");
				String pwdconfirm = request.getParameter("passwordconfirm");
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String birthday = request.getParameter("brithday");
				String tel = request.getParameter("tel");
				String email = request.getParameter("email");
				String address = request.getParameter("address");
				String subdistrict = request.getParameter("subDistrict");
				String district = request.getParameter("district");
				String province = request.getParameter("province");
				String postcode = request.getParameter("postcode");
				String longitude = request.getParameter("longitude");
				String latitude = request.getParameter("latitude");
				
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					///set data to variable
					Date dbay = df.parse(birthday);
					
				System.out.println("birthday"+dbay);
				
				Login login = new Login(uname, pwd, "ลูกค้า", "อนุญาตให้เข้าใช้งาน");
				Customer customer = new Customer(mID, tel, email, address, subdistrict, district, province, postcode,
						longitude, latitude, login, cusID, fname, lname);
				customer.setBirthDay(dbay);

				message = rm.isNewRegisterCustomer(customer);
			}else {
				if (ServletFileUpload.isMultipartContent(request)) {
					List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
						if (data.size() > 0) {
							String typeAccountProvider = data.get(0).getString("UTF-8");
							System.out.println("typeAccountProvider001 ==="+typeAccountProvider);
								if(typeAccountProvider.equals("2")) {
									System.out.println("typeAccountProvider ==="+typeAccountProvider);
										System.out.println("data Size"+data.size());
								
										  List<Member> listmember = rm.getHibernateListMember(); 
										  int mID = 0;
										  System.out.println("listmember ="+listmember.size());
										  List<CleanerProvider> listcp = rm.getHibernateListCleanerProvider(); 
										  int cpID = 0;
										  
										  List<ServicePerson> listsp = rm.getHibernateListServicePerson(); 
										  int spID = 0;
										
										String uname = data.get(1).getString("UTF-8");
										String pwd = data.get(2).getString("UTF-8");
										String pwdconfirm = data.get(3).getString("UTF-8");
										String fname = data.get(4).getString("UTF-8");
										String lname = data.get(5).getString("UTF-8");
										String birthday = data.get(6).getString("UTF-8");
										String tel = data.get(7).getString("UTF-8");
										String email = data.get(8).getString("UTF-8");
										String couplePhotoCards = new File(data.get(9).getName()).getName();
										String idCardsPhoto = new File(data.get(10).getName()).getName();
										String profilePhoto = new File(data.get(11).getName()).getName();
										String address = data.get(12).getString("UTF-8");
										String subdistrict = data.get(13).getString("UTF-8");
										String district = data.get(14).getString("UTF-8");
										String province = data.get(15).getString("UTF-8");
										String postcode = data.get(16).getString("UTF-8");
										String longitude = data.get(17).getString("UTF-8");
										String latitude = data.get(18).getString("UTF-8");
						
										  for(Member m : listmember) { 
											 int mID2 = m.getMemberid(); 
											  
												if(mID2 > mID) {
													mID = mID2;
												}
										  	} 
										  		if(mID != 0) {
										  			mID++;
										  		}else {
										  			mID = 100;
										  		}
										  		
										  		System.out.println("mID"+mID);
										 for(CleanerProvider cp : listcp) { 
												if(cp.getPrivderid() > cpID) {
													cpID = cp.getPrivderid();
												}
										 }
										  
										  		if(cpID != 0) { 
											  		cpID = cpID+1; 
										  		}else { 
											  		cpID = 1000; 
										  		}
										  System.out.println("cusID2"+cpID);
										  for(ServicePerson sp : listsp) { 
											  spID = sp.getPersonid(); 
										 } 
										  		if(spID != 0) { 
										  			spID++; 
										  		}else { 
										  			spID = 10000; 
										  		}
										  		
										  		String pathcPCards = request.getSession().getServletContext().getRealPath("/") +
														  "//WEB-INF//images//couplePhotoCards//"; 
												  data.get(9).write(new File(pathcPCards + File.separator + couplePhotoCards));
												 System.out.println("pathcPCards=="+pathcPCards);
												String pathcidCPhoto = request.getSession().getServletContext().getRealPath("/")
														+ "//WEB-INF//images//idCardsPhoto//";
												data.get(10).write(new File(pathcidCPhoto + File.separator + idCardsPhoto));
												 System.out.println("pathcidCPhoto =="+pathcidCPhoto);
												String pathcpfPhoto = request.getSession().getServletContext().getRealPath("/")
														+ "//WEB-INF//images//profileImgPerson//";
												data.get(11).write(new File(pathcpfPhoto + File.separator + profilePhoto));
												System.out.println("pathcpfPhoto =="+pathcpfPhoto);
										  System.out.println("spID2"+spID);
										 
										  DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
											///set data to variable
											Date dbay = df.parse(birthday);
										Login log = new Login(uname, pwd, "ให้บริการทำความสะอาด", "อนุญาตให้เข้าใช้งาน");
		
										ServicePerson sperson = new ServicePerson(mID, tel, email, address, subdistrict, district, province,
												postcode, latitude, longitude, log, cpID, "บุคคล", profilePhoto, spID, fname, lname,
												idCardsPhoto, couplePhotoCards);
										sperson.setBirthday(dbay);
		
										message = rm.isNewRegisterServicePerson(sperson); 
									}else {
										System.out.println("typeAccountProvider ==="+typeAccountProvider);

										System.out.println("data Size =="+data.size());
										
										  List<Member> listmember = rm.getHibernateListMember(); 
										  int mID = 0;
										  System.out.println("listmember ="+listmember.size());
										  List<CleanerProvider> listcp = rm.getHibernateListCleanerProvider(); 
										  int cpID = 0;
										  
										  List<Company> listcom = rm.getHibernateListCompany(); 
										  int comID = 0;

											String uname = data.get(1).getString("UTF-8");
											String pwd = data.get(2).getString("UTF-8");
											String pwdconfirm = data.get(3).getString("UTF-8");
											String companyName = data.get(4).getString("UTF-8");
											String contactName = data.get(5).getString("UTF-8");
											String fdFanpage = data.get(6).getString("UTF-8");
											String fdFanpageURL = data.get(7).getString("UTF-8");
											String webSite = data.get(8).getString("UTF-8");
											String webSiteURL = data.get(9).getString("UTF-8");
											String tel = data.get(10).getString("UTF-8");
											String email = data.get(11).getString("UTF-8");
											String businessLicense = new File(data.get(12).getName()).getName();
											String profilePhoto = new File(data.get(13).getName()).getName();
											String address = data.get(14).getString("UTF-8");
											String subdistrict = data.get(15).getString("UTF-8");
											String district = data.get(16).getString("UTF-8");
											String province = data.get(17).getString("UTF-8");
											String postcode = data.get(18).getString("UTF-8");
											String longitude = data.get(19).getString("UTF-8");
											String latitude = data.get(20).getString("UTF-8");

										  for(Member m : listmember) { 
												if(m.getMemberid() > mID) {
													mID = m.getMemberid();
												}
										  	} 
										  		if(mID != 0) {
										  			mID = mID+1;
										  		}else {
										  			mID = 100;
										  			
										  		}
										  		
										  		System.out.println("mID ="+mID);
										 for(CleanerProvider cp : listcp) { 

												if(cp.getPrivderid() > cpID) {
													cpID = cp.getPrivderid();
												}
										 }
										  		if(cpID != 0) { 
										  			cpID = cpID+1; 
										  		}else { 
											  		cpID = 1000; 
										  		}
										  System.out.println("cpID2 = "+cpID);
										  for(Company com : listcom) { 
											  comID = com.getCompanyid(); 
										 } 
										  		if(comID != 0) { 
										  			comID++; 
										  		}else { 
										  			comID = 10000; 
										  		}
										  System.out.println("comID2"+comID);
										 

										Login log = new Login(uname, pwd, "ให้บริการทำความสะอาด", "อนุญาตให้เข้าใช้งาน");

										Company com = new Company(mID, tel, email, address, subdistrict, district, province, postcode,
												latitude, longitude, log, cpID, "บริษัท", profilePhoto, comID, companyName, contactName, 
												businessLicense, fdFanpage,fdFanpageURL, webSite ,webSiteURL);
										 
										String pathcidCPhoto = request.getSession().getServletContext().getRealPath("/")
												+ "//WEB-INF//images//businessLicense//";
										data.get(12).write(new File(pathcidCPhoto + File.separator + businessLicense));
											System.out.println("pathcidCPhoto =="+pathcidCPhoto);
											
										String pathcpfPhoto = request.getSession().getServletContext().getRealPath("/")
												+ "//WEB-INF//images//profileImgCompany//";
										data.get(13).write(new File(pathcpfPhoto + File.separator + profilePhoto));
									
										 message = rm.isNewRegisterCompany(com); 
									}
							} else {
								System.out.println("ไม่มีข้อมูล");
							}
						}
				}
		} catch (Exception e) {
			e.printStackTrace();
			message = "2";
		}
		
		mav.addObject("msgRegister", message);
		return mav;
	}
}
