package com.springmvc.manager;

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

public class FinishServiceManager {
	///UPDATE Table Quotation 
			public String isUpdateStatusCleanerService(List<Quotations> quotations,List<Customer> customer,List<Suggest> suggests){
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
						for(Quotations q: quotations) {
							q1.setQuotationsid(q.getQuotationsid());
							q1.setPriceOfferJob(q.getPriceOfferJob());
							q1.setPriceOffrtDate(q.getPriceOffrtDate());
							q1.setNote(q.getNote());
							q1.setStatus("ให้บริการเสร็จสิ้นแล้ว");
							
							request.setRequestid(q.getRequest().getRequestid());
							request.setCleanNo(q.getRequest().getCleanNo());
							request.setAbodeFormat(q.getRequest().getAbodeFormat());
							request.setAddressType(q.getRequest().getAddressType());
							request.setTimePeriod(q.getRequest().getTimePeriod());
							request.setServiceDate(q.getRequest().getServiceDate());
							request.setServicePeriod(q.getRequest().getServicePeriod());
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
							request.setStatus("บริการเสร็จสิ้น");
							request.setDoProvider(q.getRequest().getDoProvider());
							request.setWeekNo(q.getRequest().getWeekNo());
							request.setDayInWeek(q.getRequest().getDayInWeek());
							request.setMonthNo(q.getRequest().getMonthNo());
							request.setDayInMonth(q.getRequest().getDayInMonth());
							request.setSelectProvider(q.getRequest().getSelectProvider());
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
					session.getTransaction().commit();
					session.close();
					return "1";
				 }catch(Exception e){
					 e.printStackTrace();
					 return "2";
				 }
				}
			///List Quotations id table Quotations
					public List<Quotations> getQuotationsID(int qid){
						List<Quotations> list = new ArrayList<Quotations>();
						try{
						 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
						 Session session = sessionFactory.openSession();
						 session.beginTransaction();
						 
						 		list = session.createQuery("From Quotations where provider_id ='"+ qid +"'").list();
						 	
						 session.close();
						}catch(Exception e){
							e.printStackTrace();
						}
							return list;
						}
					///List Table Member
					public List<Member> findCleanerProviderDataForMember(Login login){
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
					///List CleanerProvider id table CleanerProvider
					public List<CleanerProvider> getCleanerProviderID(int qid){
						List<CleanerProvider> list = new ArrayList<CleanerProvider>();
						try{
						 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
						 Session session = sessionFactory.openSession();
						 session.beginTransaction();
						 	
						 		list.addAll(  session.createQuery("From CleanerProvider where memberid ='"+ qid +"'").list());
	
					
						 session.close();
						}catch(Exception e){
							e.printStackTrace();
						}
							return list;
						}
					///List Table Request
						public List<Request> getListRequest(int requestid){
							List<Request> list = new ArrayList<Request>();
							try{
							 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
							 Session session = sessionFactory.openSession();
							 session.beginTransaction();
							 	list = session.createQuery("From Request  where requestid='"+requestid+"'").list();
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
						public List<Suggest> findSuggestData(int suggestid){
							List<Suggest> list = new ArrayList<Suggest>();
							try{
							 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
							 Session session = sessionFactory.openSession();
							 session.beginTransaction();
							 	list = session.createQuery("From Suggest  where suggestid='"+suggestid+"'").list();
							 session.close();
							}catch(Exception e){
								e.printStackTrace();
							}
								return list;
							}
						///List Table Request
						public List<Request> getListRequest(){
							List<Request> list = new ArrayList<Request>();
							try{
							 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
							 Session session = sessionFactory.openSession();
							 session.beginTransaction();
							 	list = session.createQuery("From Request  ").list();
							 session.close();
							}catch(Exception e){
								e.printStackTrace();
							}
								return list;
							}
						///List Quotations id  Table Quotations
						public List<Quotations> getListQuotationID(List<String> id){
							List<Quotations> list = new ArrayList<Quotations>();
							try{
							 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
							 Session session = sessionFactory.openSession();
							 session.beginTransaction();
								 for(int i = 0 ; i < id.size() ; i ++) {
								 	list.addAll( session.createQuery("From Quotations  where quotationsid ='"+Integer.parseInt(id.get(i))+"'").list());
							
								 }
							 session.close();
							}catch(Exception e){
								e.printStackTrace();
							}
								return list;
							}
						///List Quotations id  Table Quotations
						public List<Quotations> getListQuotation(int memberid){
							List<Quotations> list = new ArrayList<Quotations>();
							try{
							 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
							 Session session = sessionFactory.openSession();
							 session.beginTransaction();
							 	list = session.createQuery("From Quotations where provider_id ='"+memberid+"'order by request_id ASC").list();
							 session.close();
							}catch(Exception e){
								e.printStackTrace();
							}
								return list;
							}
						
					
}
