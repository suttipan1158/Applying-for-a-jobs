package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.ServicePerson;
import com.springmvc.model.Suggest;

public class CreateRequestCleanerManager {
	
	///List Table Quotations
	public List<Quotations> fineCleanerProvider(int cusid){
		List<Request> list = new ArrayList<Request>();
		List<Quotations> listQuotations = new ArrayList<Quotations>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From Request  where customer='"+cusid+"'").list();
		 	for(Request r:list) {
		 		listQuotations.addAll(session.createQuery("From Quotations  where request='"+r.getRequestid()+"'"
		 				+ "and status='"+"ให้บริการเสร็จสิ้นแล้ว"+"'").list()); 
		 	}
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return listQuotations;
		}
	
	///List Table ServicePerson
	public List<ServicePerson> getListServicePerson(int providerid){
		List<ServicePerson> list = new ArrayList<ServicePerson>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From ServicePerson  where memberid='"+providerid+"'").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Table Company
		public List<Company> getListCompany(int providerid){
			List<Company> list = new ArrayList<Company>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From Company  where memberid='"+providerid+"'").list();
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
			public List<Customer> findCustomerData(int memberid){
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
			///INSERT Table Request Customer
			public String isCreateRequestCleaner(Request request){
				 try{
					Session session =HibernateConnection.doHibernateConnection()
					.openSession();
					session.beginTransaction();
					session.save(request);
					session.getTransaction().commit();
					session.close();
					return "1";
				 }catch(Exception e){
					 e.printStackTrace();
					 return "2";
				 }
				}
}
