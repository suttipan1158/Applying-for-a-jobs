package com.springmvc.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.springmvc.manager.EditProfileManager;
import com.springmvc.manager.RegisterManager;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.ServicePerson;

@Controller
public class EditProfileController {
	///line Go doEditProfile
			@RequestMapping(value="/goEditProfile",method=RequestMethod.GET)
				public String getMemberID(HttpSession session,HttpServletRequest request){
					
					Login user = (Login) session.getAttribute("user"); 
						session.setAttribute("user", user);
					EditProfileManager em = new EditProfileManager();
					List<Member> members  = em.findMemberData(user);
						int memid = 0 ;
						for(Member m : members) {
							memid = m.getMemberid();
						}
					///Check data for Customer of Member
				
						List<Customer> customer = em.findMemberDataForCustomer(memid);
						request.setAttribute("customerdata", customer);
					
						///Check data for Customer of Member	
						List<CleanerProvider> cp = em.findMemberDataForCleanerProvider(memid);
							
							int providerid = 0 ;
							String providertype = "";
							for(CleanerProvider m : cp) {
								providerid = m.getPrivderid();
								providertype = m.getPrivatetype();
							}
							request.setAttribute("providerid", providerid);
							request.setAttribute("providertype", providertype);
								List<ServicePerson> sp = em.findMemberDataForServicePerson(providerid);
								request.setAttribute("ServicePerson", sp);
								List<Company> com = em.findMemberDataForCompany(providerid);
								request.setAttribute("Company", com);
		
					return "editProfile"; 
				}
	///Update data for Customer
			@RequestMapping(value = "/getEditProfileData", method = RequestMethod.POST)
			public ModelAndView getEditProfileDataCustomer(HttpServletRequest request,HttpSession session, Model md) {
				String message = "";
				ModelAndView mav = new ModelAndView("editProfile");

				try {
					request.setCharacterEncoding("UTF-8");
					EditProfileManager em = new EditProfileManager();
					String typeAccount = request.getParameter("typeAccount");
					Login user = (Login) session.getAttribute("user"); 
					if(typeAccount != null) {
						int memberid = Integer.parseInt(request.getParameter("memberid"));
						String loginid = request.getParameter("loginid");
						String uname = request.getParameter("loginid");
						String pwd = request.getParameter("password");
						String pwdconfirm = request.getParameter("passwordconfirm");
						int cusid = Integer.parseInt(request.getParameter("cusid"));
						String fname = request.getParameter("fnames");
						String lname = request.getParameter("lnames");
						String birthday = request.getParameter("brithday");
						String tel = request.getParameter("tel");
						String email = request.getParameter("email");
						String address = request.getParameter("address");
						String subdistrict = request.getParameter("subDistrict");
						String district = request.getParameter("district");
						String province = request.getParameter("province");
						String postcode = request.getParameter("postcode");
						String latitude = request.getParameter("latitude01");
						String longitude = request.getParameter("longitude01");
						
						System.out.println(latitude+"   55555  "+longitude);
						DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
							Date dbay = df.parse(birthday);
						Login login = new Login(uname, pwd, "ลูกค้า", "อนุญาตให้เข้าใช้งาน");
						Customer customer = new Customer(memberid, tel, email, address, subdistrict, district, province, postcode,
								latitude,longitude,login, cusid, fname, lname);
						customer.setBirthDay(dbay);

						
						message = em.isUpdateProfileDataCustomer(customer);
					
							
								session.setAttribute("user", user);
							List<Member> members  = em.findMemberData(user);
								int memid = 0 ;
								for(Member m : members) {
									memid = m.getMemberid();
								}
							///Check data for Customer of Member
						
								List<Customer> cus = em.findMemberDataForCustomer(memid);
								request.setAttribute("customerdata", cus);
							
					}else {
						if (ServletFileUpload.isMultipartContent(request)) {
							List<FileItem> data = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
							  String typeAccountProvider = data.get(0).getString("UTF-8");
							  System.out.println("typeAccountProvider ==" + typeAccountProvider);
							  	if (data.size() > 0) {
									if(typeAccountProvider.equals("2")) {
										
										System.out.println("Data Size = "+data.size());
										request.setCharacterEncoding("UTF-8");
	
										String pwd = data.get(1).getString("UTF-8");
										String fname = data.get(3).getString("UTF-8");
										String lname = data.get(4).getString("UTF-8");
										String  birthday= data.get(5).getString("UTF-8");
										String tel = data.get(6).getString("UTF-8");
										String email= data.get(7).getString("UTF-8");
										String address = data.get(8).getString("UTF-8");
										String subdistrict = data.get(9).getString("UTF-8");
										String district = data.get(10).getString("UTF-8");
										String province = data.get(11).getString("UTF-8");
										String postcode = data.get(12).getString("UTF-8");
										String longitude = data.get(13).getString("UTF-8");
										String latitude = data.get(14).getString("UTF-8");
										String couplePhotoCards = new File(data.get(16).getName()).getName();
										String idCardsPhoto = new File(data.get(17).getName()).getName();
										String profilePhoto = new File(data.get(18).getName()).getName();
											
										System.out.println("couplePhotoCards ="+couplePhotoCards);
										System.out.println("idCardsPhoto ="+idCardsPhoto);
										System.out.println("profilePhoto ="+profilePhoto);
										List<ServicePerson> sp = (List<ServicePerson>) session.getAttribute("ServicePerson");
											if(couplePhotoCards.isEmpty()) {
												couplePhotoCards = sp.get(0).getCouplePhotoidCards();
											}
											if(idCardsPhoto.isEmpty()){
												idCardsPhoto = sp.get(0).getIdCardsPhoto();
											}
											if(profilePhoto.isEmpty()){
												profilePhoto = sp.get(0).getProfilePhoto();
											}
										
										int cpid = 0; 
										int mID =0;
										int spID=0;
										for(ServicePerson sps : sp) {
											mID = sps.getMemberid();
											spID = sps.getPersonid();
										}		
										
										List<CleanerProvider> cleanerProviders = em.findMemberDataForCleanerProvider(mID);
										for (CleanerProvider cp : cleanerProviders) {
											cpid = cp.getPrivderid();
										}
										  DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
											///set data to variable
											Date dbay = df.parse(birthday);
										Login login = new Login(user.getUsername(), pwd, "ให้บริการทำความสะอาด", "อนุญาตให้เข้าใช้งาน");
	
										ServicePerson sperson = new ServicePerson(mID, tel, email, address, subdistrict, district, province,
												postcode, latitude, longitude, login, cpid, "บุคคล", profilePhoto, spID, fname, lname,
												idCardsPhoto, couplePhotoCards);
										sperson.setBirthday(dbay);
	
										
										  String pathcPCards = request.getSession().getServletContext().getRealPath("/") +
												  "//WEB-INF//images//couplePhotoCards//"; 
										  data.get(16).write(new File(pathcPCards + File.separator + couplePhotoCards));
										 
										String pathcidCPhoto = request.getSession().getServletContext().getRealPath("/")
												+ "//WEB-INF//images//idCardsPhoto//";
										data.get(17).write(new File(pathcidCPhoto + File.separator + idCardsPhoto));
	
										String pathcpfPhoto = request.getSession().getServletContext().getRealPath("/")
												+ "//WEB-INF//images//profileImgPerson//";
										data.get(18).write(new File(pathcpfPhoto + File.separator + profilePhoto));
										
										System.out.println("pathcpfPhoto ="+pathcpfPhoto);
										message = em.isUpdateProfileDataServicePerson(sperson);
										session.removeAttribute("ServicePerson");
									}else {
										System.out.println("Data Size = "+data.size());
										request.setCharacterEncoding("UTF-8");

								
										String pwd = data.get(1).getString("UTF-8");
										String pwdconfirm = data.get(2).getString("UTF-8");
										String companyName = data.get(3).getString("UTF-8");
										String contactName = data.get(4).getString("UTF-8");
										String fdFanpage = data.get(5).getString("UTF-8");
										String fdFanpageURL = data.get(6).getString("UTF-8");
										String webSite = data.get(7).getString("UTF-8");
										String webSiteURL = data.get(8).getString("UTF-8");
										String tel = data.get(9).getString("UTF-8");
										String email = data.get(10).getString("UTF-8");
										String address = data.get(11).getString("UTF-8");
										String subdistrict = data.get(12).getString("UTF-8");
										String district = data.get(13).getString("UTF-8");
										String province = data.get(14).getString("UTF-8");
										String postcode = data.get(15).getString("UTF-8");
										String latitude = data.get(16).getString("UTF-8");
										String longitude = data.get(17).getString("UTF-8");
										System.out.println(pwd+" "+companyName+" "+address+" "+longitude);
								
										String businessLicense = new File(data.get(19).getName()).getName();
										String profilePhoto = new File(data.get(20).getName()).getName();
											
										
										System.out.println("businessLicense ="+businessLicense);
										System.out.println("profilePhoto ="+profilePhoto);
										List<Company> comp = (List<Company>) session.getAttribute("Company");
										System.out.println("Comp Size =="+ companyName.length());
											if(businessLicense.isEmpty()) {
												businessLicense = comp.get(0).getBusinessLicense();
											}
											if(profilePhoto.isEmpty()){
												profilePhoto = comp.get(0).getProfilePhoto();
											}
											System.out.println("businessLicense1 ="+businessLicense);
											System.out.println("profilePhoto2 ="+profilePhoto);
										
										int cpid = 0;
										int mID =0;
										int comID=0;
										for(Company com : comp) {
											mID = com.getMemberid() ;
											comID = com.getCompanyid();
											System.out.println("comID ="+comID);
										}		
										
										List<CleanerProvider> cleanerProviders = em.findMemberDataForCleanerProvider(mID);
											for (CleanerProvider cp : cleanerProviders) {
												cpid = cp.getPrivderid();
											}
										System.out.println("cpid =="+ cpid);
										Login login = new Login(user.getUsername(), pwd, "ให้บริการทำความสะอาด", "อนุญาตให้เข้าใช้งาน");

										Company company = new Company(mID, tel, email, address, subdistrict, district, province, postcode,
												latitude,longitude, login, cpid,"บริษัท",profilePhoto,	comID,companyName,contactName, 
												businessLicense, fdFanpage,fdFanpageURL, webSite,webSiteURL);
										
										String pathcidCPhoto = request.getSession().getServletContext().getRealPath("/")
												+ "//WEB-INF//images//businessLicense//";
										data.get(19).write(new File(pathcidCPhoto + File.separator + businessLicense));
											System.out.println("pathcidCPhoto =="+pathcidCPhoto);
											
										String pathcpfPhoto = request.getSession().getServletContext().getRealPath("/")
												+ "//WEB-INF//images//profileImgCompany//";
										data.get(20).write(new File(pathcpfPhoto + File.separator + profilePhoto));
										
										System.out.println("pathcpfPhoto ="+pathcpfPhoto);
										message = em.isUpdateProfileDataCompany(company);
										session.setAttribute("user", user);
										session.removeAttribute("Company");
									}
									if(message.equals("1")) {
										///list Data And send go EditProfile => Session
										
										List<Member> membersload  = em.findMemberData(user);
											int mid = 0 ;
											for(Member m : membersload) {
												mid = m.getMemberid();
											}
											
											///Check data for Customer of Member	
											List<CleanerProvider> cp = em.findMemberDataForCleanerProvider(mid);
												
												int providerid = 0 ;
												String providertype = "";
												for(CleanerProvider m : cp) {
													providerid = m.getPrivderid();
													providertype = m.getPrivatetype();
												
												}
												System.out.println("providertype = "+providertype);
												request.setAttribute("providertype", providertype);
												if(providertype.equals("บุคคล")) {
													List<ServicePerson> sps = em.findMemberDataForServicePerson(providerid);
													request.setAttribute("ServicePerson", sps);
												}else {
													List<Company> com = em.findMemberDataForCompany(providerid);
													request.setAttribute("Company", com);
												}
													
										}
						  	} else {
								System.out.println("ไม่สามารถแก้ไขข้อมูลได้");
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					message = "2";
				}
				mav.addObject("message1", message);
				return mav;
			}
}
