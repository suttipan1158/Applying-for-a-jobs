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

public class ListRequestCleanerManager {
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
			///List Table Request
				public List<Request> queryListRequestCleaner(int cusid){
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
				///List Table Request
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
				///List Quotations id table Quotations
				public List<Quotations> getQuotationsID(List<String> qid){
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
				///List CleanerProvider id table CleanerProvider
				public List<CleanerProvider> getCleanerProviderID(List<String> qid){
					List<CleanerProvider> list = new ArrayList<CleanerProvider>();
					List<CleanerProvider> list1 = new ArrayList<CleanerProvider>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	for(int i = 0; i < qid.size() ; i++) {
					 		list1.addAll(  session.createQuery("From CleanerProvider where privderid ='"+ Integer.parseInt(qid.get(i))+"'").list());
					 		System.out.println("qid.get(i) =="+qid.get(i));
					 		list.addAll(list1);
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
