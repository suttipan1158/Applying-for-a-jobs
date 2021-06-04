package com.springmvc.manager;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

public class ConfirmQuotationManager {
	///UPDATE Table Quotation 
		public String updateRequestCleanerDetail(List<Quotations> listOfferWin,List<Customer> customer,List<Suggest> suggests,List<Quotations> listOfferLose){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				
				Customer cus = new Customer();
					for(Customer c : customer) {
						cus.setMemberid(c.getMemberid());
						cus.setTel(c.getTel());
						cus.setEmail(c.getEmail());
						cus.setAddress(c.getAddress());
						cus.setSubDistrict(c.getSubDistrict());
						cus.setDistrict(c.getDistrict());
						cus.setProvince(c.getProvince());
						cus.setPostcode(c.getPostcode());
						cus.setLongitude(c.getLongitude());
						cus.setLatitude(c.getLatitude());
						cus.setCustomerid(c.getCustomerid());
						cus.setFirsName(c.getFirsName());
						cus.setLastName(c.getLastName());
					}
				Suggest suggest = new Suggest();
					for(Suggest s: suggests) {
						suggest.setSuggestid(s.getSuggestid());
						suggest.setAddressFormat(s.getAddressFormat());
						suggest.setAddressType(s.getAddressType());
						suggest.setSuggestPrice(s.getSuggestPrice());
						suggest.setSuggestTime(s.getSuggestTime());
					}
					
				Quotations q1 = new Quotations();
				
				Request request = new Request();
					request.setCustomer(cus);
					request.setSuggest(suggest);
				CleanerProvider cp = new CleanerProvider();
					for(Quotations q: listOfferWin) {
						q1.setQuotationsid(q.getQuotationsid());
						q1.setPriceOfferJob(q.getPriceOfferJob());
						q1.setPriceOffrtDate(q.getPriceOffrtDate());
						q1.setNote(q.getNote());
						q1.setStatus("รอให้บริการ");
						
						request.setRequestid(q.getRequest().getRequestid());
						request.setCleanNo(q.getRequest().getCleanNo());
						request.setAddressType(q.getRequest().getAddressType());
						request.setAbodeFormat(q.getRequest().getAbodeFormat());
						request.setTimePeriod(q.getRequest().getTimePeriod());
						request.setServiceDate(q.getRequest().getServiceDate());
						request.setServicePeriod(q.getRequest().getServicePeriod());
						request.setSelectProvider(q.getRequest().getSelectProvider());
						request.setPriceMin(q.getRequest().getPriceMin());
						request.setPriceMax(q.getRequest().getPriceMax());
						request.setNote(q.getRequest().getNote());
						request.setAddress(q.getRequest().getAddress());
						request.setSubDistrict(q.getRequest().getSubDistrict());
						request.setDistrict(q.getRequest().getDistrict());
						request.setProvince(q.getRequest().getProvince());
						request.setPostcode(q.getRequest().getPostcode());
						request.setLatitude(q.getRequest().getLatitude());
						request.setLongitude(q.getRequest().getLongitude());
						request.setAnimal(q.getRequest().getAnimal());
						request.setStatus("รอรับบริการทำความสะอาด");
						request.setDoProvider(q.getRequest().getDoProvider());
						request.setWeekNo(q.getRequest().getWeekNo());
						request.setDayInWeek(q.getRequest().getDayInWeek());
						request.setMonthNo(q.getRequest().getMonthNo());
						request.setDayInMonth(q.getRequest().getDayInMonth());
						
								cp.setMemberid(q.getCleanerprovider().getMemberid());
								cp.setTel(q.getCleanerprovider().getTel());
								cp.setEmail(q.getCleanerprovider().getEmail());
								cp.setAddress(q.getCleanerprovider().getAddress());
								cp.setSubDistrict(q.getCleanerprovider().getSubDistrict());
								cp.setDistrict(q.getCleanerprovider().getDistrict());
								cp.setProvince(q.getCleanerprovider().getProvince());
								cp.setPostcode(q.getCleanerprovider().getPostcode());
								cp.setLatitude(q.getCleanerprovider().getLatitude());
								cp.setLongitude(q.getCleanerprovider().getLongitude());
								cp.setPrivderid(q.getCleanerprovider().getPrivderid());
								cp.setProfilePhoto(q.getCleanerprovider().getProfilePhoto());
					}
					q1.setCleanerprovider(cp);
					q1.setRequest(request);
					
					session.update(q1);
					session.update(request);
					
					List<Quotations> allQuotationLose = new ArrayList<Quotations>();
					CleanerProvider cp2 = new CleanerProvider();
						for(Quotations q: listOfferLose) {
							
							Quotations q2 = new Quotations();
							q2.setQuotationsid(q.getQuotationsid());
							q2.setPriceOfferJob(q.getPriceOfferJob());
							q2.setPriceOffrtDate(q.getPriceOffrtDate());
							q2.setNote(q.getNote());
							q2.setStatus("คำขอไม่ได้รับเลือก");
							
							Request request2 = new Request();
							request2.setCustomer(cus);
							request2.setSuggest(suggest);
								request2.setRequestid(q.getRequest().getRequestid());
								request2.setCleanNo(q.getRequest().getCleanNo());
								request2.setAddressType(q.getRequest().getAddressType());
								request2.setAbodeFormat(q.getRequest().getAbodeFormat());
								request2.setTimePeriod(q.getRequest().getTimePeriod());
								request2.setServiceDate(q.getRequest().getServiceDate());
								request2.setServicePeriod(q.getRequest().getServicePeriod());
								request2.setSelectProvider(q.getRequest().getSelectProvider());
								request2.setPriceMin(q.getRequest().getPriceMin());
								request2.setPriceMax(q.getRequest().getPriceMax());
								request2.setNote(q.getRequest().getNote());
								request2.setAddress(q.getRequest().getAddress());
								request2.setSubDistrict(q.getRequest().getSubDistrict());
								request2.setDistrict(q.getRequest().getDistrict());
								request2.setProvince(q.getRequest().getProvince());
								request2.setPostcode(q.getRequest().getPostcode());
								request2.setLatitude(q.getRequest().getLatitude());
								request2.setLongitude(q.getRequest().getLongitude());
								request2.setAnimal(q.getRequest().getAnimal());
								request2.setStatus("รอรับบริการทำความสะอาด");
								request2.setDoProvider(q.getRequest().getDoProvider());
								request2.setWeekNo(q.getRequest().getWeekNo());
								request2.setDayInWeek(q.getRequest().getDayInWeek());
								request2.setMonthNo(q.getRequest().getMonthNo());
								request2.setDayInMonth(q.getRequest().getDayInMonth());
							
								cp2.setMemberid(q.getCleanerprovider().getMemberid());
								cp2.setTel(q.getCleanerprovider().getTel());
								cp2.setEmail(q.getCleanerprovider().getEmail());
								cp2.setAddress(q.getCleanerprovider().getAddress());
								cp2.setSubDistrict(q.getCleanerprovider().getSubDistrict());
								cp2.setDistrict(q.getCleanerprovider().getDistrict());
								cp2.setProvince(q.getCleanerprovider().getProvince());
								cp2.setPostcode(q.getCleanerprovider().getPostcode());
								cp2.setLatitude(q.getCleanerprovider().getLatitude());
								cp2.setLongitude(q.getCleanerprovider().getLongitude());
								cp2.setPrivderid(q.getCleanerprovider().getPrivderid());
								cp2.setProfilePhoto(q.getCleanerprovider().getProfilePhoto());
								
								q2.setCleanerprovider(cp2);
								q2.setRequest(request2);
								
								allQuotationLose.add(q2);
						}
						for(Quotations editQ: allQuotationLose) {
							session.update(editQ);
						}

				session.getTransaction().commit();
				session.close();
				return "1";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "2";
			 }
			}
		///List Quotations id table Quotations
				public List<Quotations> getCleanerServiceID(String qid){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
				
					 		list = session.createQuery("From Quotations where request_id ='"+ Integer.parseInt(qid)+"'").list();
					
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Quotations id table Quotations
				public List<Quotations> ListQuotation(){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
				
					 		list = session.createQuery("From Quotations ").list();
					
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Table Member
				public List<Member> findCustomerDataForMember(Login login){
					List<Member> list = new ArrayList<Member>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Member m where login_id = '"+login.getUsername()+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Table Custoemr
				public List<Customer> findCustomerDataForCustomer(int memberid){
					List<Customer> list = new ArrayList<Customer>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Customer  where memberid = '"+memberid+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Table Suggest
				public List<Suggest> findSuggestData(){
					List<Suggest> list = new ArrayList<Suggest>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Suggest  ").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
		///// Go To List Request Cleaner
				///List Table Request
				public List<Request> getListRequest(int cusid){
					List<Request> list = new ArrayList<Request>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Request  where customer_id='"+cusid+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Quotations id table Quotations
				public List<Quotations> getCleanerServiceID(List<String> qid){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	for(int i = 0; i < qid.size() ; i++) {
					 		list.addAll( session.createQuery("From Quotations where request_id ='"+ Integer.parseInt(qid.get(i))+"'").list());
					 	}
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List ServicePerson id table ServicePerson
				public List<ServicePerson> getServicePersonID(List<String> qid){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					List<ServicePerson> list1 = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	for(int i = 0; i < qid.size() ; i++) {
					 		list1.addAll(  session.createQuery("From ServicePerson where memberid ='"+ Integer.parseInt(qid.get(i))+"'").list());
					 		
					 		list.addAll(list1);
					 	}
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List ServicePerson id table ServicePerson
				public List<Company> getCompanyID(List<String> qid){
					List<Company> list = new ArrayList<Company>();
					List<Company> list1 = new ArrayList<Company>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	for(int i = 0; i < qid.size() ; i++) {
					 		list1.addAll(  session.createQuery("From Company where memberid ='"+ Integer.parseInt(qid.get(i))+"'").list());
					 		
					 		list.addAll(list1);
					 	}
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				
}
