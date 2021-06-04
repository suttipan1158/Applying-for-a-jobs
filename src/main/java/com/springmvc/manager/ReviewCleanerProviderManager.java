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
import com.springmvc.model.Review;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

public class ReviewCleanerProviderManager {
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
	///List CleanerProvider id table CleanerProvider
	public List<CleanerProvider> getCleanerProviderID(List<String> qid){
		List<CleanerProvider> list = new ArrayList<CleanerProvider>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	for(int i = 0; i < qid.size() ; i++) {
		 		list.addAll(session.createQuery("From CleanerProvider where privderid ='"+ Integer.parseInt(qid.get(i))+"'").list());
		 	
		 	}
		 	System.out.println("qid.size() =="+qid.size());
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List ServicePerson id table ServicePerson
	public List<ServicePerson> getServicePersonID(List<String> qid){
		List<ServicePerson> list = new ArrayList<ServicePerson>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	for(int i = 0; i < qid.size() ; i++) {
		 		list.addAll(session.createQuery("From ServicePerson where memberid ='"+ Integer.parseInt(qid.get(i))+"'").list());
		
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
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	for(int i = 0; i < qid.size() ; i++) {
		 		list.addAll(session.createQuery("From Company where memberid ='"+ Integer.parseInt(qid.get(i))+"'").list());
		 	}
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Review id table Review
		public List<Review> getListReview(){
			List<Review> list = new ArrayList<Review>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 		list =  session.createQuery("From Review ").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///List Review id table Review
		public List<Review> getReviewID(int qid){
			List<Review> list = new ArrayList<Review>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();

			 		list = session.createQuery("From Review where reviewid ='"+ qid+"'").list();

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
			 		list = session.createQuery("From CleanerProvider where privderid ='"+ qid+"'").list();
			 
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///INSERT Table Review 
				public String isReviewCleanerProvider(Review review){
					 try{
						Session session =HibernateConnection.doHibernateConnection()
						.openSession();
						session.beginTransaction();
						session.save(review);
						session.getTransaction().commit();
						session.close();
						return "Sign Up Successfully...";
					 }catch(Exception e){
						 e.printStackTrace();
						 return "User is already there with this username";
					 }
					}
	///EDIT Table Quotation 
		public String UpdateQuotations(List<Quotations> quotations,List<Customer> cus,List<Request> requests,Review review){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				Login login = new Login();
				Customer customer = new Customer();
				
					for(Customer c : cus) {
						customer.setMemberid(c.getMemberid());
						customer.setTel(c.getTel());
						customer.setEmail(c.getEmail());
						customer.setAddress(c.getAddress());
						customer.setSubDistrict(c.getSubDistrict());
						customer.setDistrict(c.getDistrict());
						customer.setProvince(c.getProvince());
						customer.setPostcode(c.getPostcode());
						customer.setLatitude(c.getLatitude());
						customer.setLongitude(c.getLongitude());
						customer.setCustomerid(c.getCustomerid());
						customer.setFirsName(c.getFirsName());
						customer.setLastName(c.getLastName());
							login.setUsername(c.getLogin().getUsername());
							login.setPassword(c.getLogin().getPassword());
							login.setLoginType(c.getLogin().getLoginType());
							login.setStatus(c.getLogin().getStatus());
					}
						customer.setLogin(login);
				Suggest suggest = new Suggest();
				Request requests2 = new Request();
						for(Request r : requests) {
							requests2.setRequestid(r.getRequestid());
							requests2.setCleanNo(r.getCleanNo());
							requests2.setAbodeFormat(r.getAbodeFormat());
							requests2.setAddressType(r.getAddressType());
							requests2.setSelectProvider(r.getSelectProvider());
							requests2.setTimePeriod(r.getTimePeriod());
							requests2.setServiceDate(r.getServiceDate());
							requests2.setServicePeriod(r.getServicePeriod());
							requests2.setPriceMin(r.getPriceMin());
							requests2.setPriceMax(r.getPriceMax());
							requests2.setNote(r.getNote());
							requests2.setAddress(r.getAddress());
							requests2.setSubDistrict(r.getSubDistrict());
							requests2.setDistrict(r.getDistrict());
							requests2.setProvince(r.getProvince());
							requests2.setPostcode(r.getPostcode());
							requests2.setLatitude(r.getLatitude());
							requests2.setLongitude(r.getLongitude());
							requests2.setAnimal(r.getAnimal());
							requests2.setStatus(r.getStatus());
							requests2.setDoProvider(r.getDoProvider());
							requests2.setWeekNo(r.getWeekNo());
							requests2.setDayInWeek(r.getDayInWeek());
							requests2.setMonthNo(r.getMonthNo());
							requests2.setDayInMonth(r.getDayInMonth());
								suggest.setSuggestid(r.getSuggest().getSuggestid());
								suggest.setAddressType(r.getSuggest().getAddressType());
								suggest.setAddressFormat(r.getSuggest().getAddressFormat());
								suggest.setSuggestPrice(r.getSuggest().getSuggestPrice());
								suggest.setSuggestTime(r.getSuggest().getSuggestTime());
						}
							requests2.setSuggest(suggest);
							requests2.setCustomer(customer);
							Quotations q1 = new Quotations();
							
							CleanerProvider cp = new CleanerProvider();
								for(Quotations q: quotations) {
									q1.setQuotationsid(q.getQuotationsid());
									q1.setPriceOfferJob(q.getPriceOfferJob());
									q1.setPriceOffrtDate(q.getPriceOffrtDate());
									q1.setNote(q.getNote());
									q1.setStatus("ให้บริการเสร็จสิ้นแล้ว");
									
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
								q1.setRequest(requests2);
								q1.setReview(review);
								
				session.update(q1);
				session.update(requests2);
				session.getTransaction().commit();
				session.close();
				return "Sign Up Successfully...";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "User is already there with this username";
			 }
			}
		
		///List Search Table Service Person + Address
		public List<Request> ViewRequestCleanerDetail(String id){
			List<Request> list = new ArrayList<Request>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From Request where requestid ='"+ id+"'").list();
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
}
