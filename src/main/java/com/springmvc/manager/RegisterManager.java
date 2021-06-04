package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.ServicePerson;


public class RegisterManager {
	
///INSERT Table Customer And Member And Login
	public String isNewRegisterCustomer(Customer cus){
		 try{
			Session session =HibernateConnection.doHibernateConnection()
			.openSession();
			session.beginTransaction();
			session.save(cus);
			session.getTransaction().commit();
			session.close();
			return "1";
		 }catch(Exception e){
			 e.printStackTrace();
			 return "2";
		 }
		}
	///INSERT Table ServicePerson And CleanerProvider And Member And Login
		public String isNewRegisterServicePerson(ServicePerson sp){
			 try{
				Session session =HibernateConnection.doHibernateConnection().openSession();
				session.beginTransaction();
				session.save(sp);
				session.getTransaction().commit();
				session.close();
				return "1";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "2";
				 
			 }
			}
	///INSERT Table Company And CleanerProvider And Member And Login
			public String isNewRegisterCompany(Company com){
				 try{
					Session session =HibernateConnection.doHibernateConnection().openSession();
					session.beginTransaction();
					session.save(com);
					session.getTransaction().commit();
					session.close();
					return "1";
				 }catch(Exception e){
					 e.printStackTrace();
					 return "2";
					 
				 }
				}
///List Table Member
	public List<Member> getHibernateListMember(){
		List<Member> list = new ArrayList<Member>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From Member").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
///List Table Customer
	public List<Customer> getHibernateListCustomer(){
		List<Customer> list = new ArrayList<Customer>();
		try{
			SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			 list = session.createQuery("From Customer").list();
			 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
///List Table CleanerProvider
	public List<CleanerProvider> getHibernateListCleanerProvider(){
		List<CleanerProvider> list = new ArrayList<CleanerProvider>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From CleanerProvider").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Table CleanerProvider
		public List<CleanerProvider> getListCleanerProviderID(List<String> id){
			List<CleanerProvider> list = new ArrayList<CleanerProvider>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	for(String s : id) {
			 		list.addAll(session.createQuery("From CleanerProvider where memberid='"+s+"'").list());
			 	}
			 	
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///List Table ServicePerson
		public List<ServicePerson> getHibernateListServicePerson(){
			List<ServicePerson> list = new ArrayList<ServicePerson>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From ServicePerson").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///List Table ServicePerson
				public List<ServicePerson> getListServicePersonID(List<String> id){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	for(int i = 0 ; i < id.size() ; i++) {
					 		
					 		list.addAll(session.createQuery("From ServicePerson where memberid ='"+id.get(i)+"'").list());
					 	}
					 	
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
	///List Table Company
			public List<Company> getHibernateListCompany(){
				List<Company> list = new ArrayList<Company>();
				try{
				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				 Session session = sessionFactory.openSession();
				 session.beginTransaction();
				 	list = session.createQuery("From Company").list();
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
			///List Table Company
			public List<Company> getListCompanyID(List<String> id){
				List<Company> list = new ArrayList<Company>();
				try{
				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				 Session session = sessionFactory.openSession();
				 session.beginTransaction();
				 	for(int i = 0 ; i < id.size() ; i++) {
				 		
				 		list.addAll(session.createQuery("From Company where memberid ='"+id.get(i)+"'").list());
				 	}
				 	
				 	
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
		///List Table Quotations
				public List<Quotations> getQuotation(){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Quotations").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Where member id Table Company
				public List<Quotations> getQuotationid(List<String> id){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	for(int i =0 ; i <id.size() ; i++) {
					 		list.addAll(session.createQuery("From Quotations where provider_id ='"+id.get(i)+"'").list());
					 	}
					 	
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}

}
