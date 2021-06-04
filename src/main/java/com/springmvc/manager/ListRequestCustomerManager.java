package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;
import com.springmvc.model.Suggest;

public class ListRequestCustomerManager {
	///List Request id  Table Request
	public List<Request> queryListRequestCustomer(List<String> rqs){
		List<Request> list = new ArrayList<Request>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
			 for(int i = 0 ; i < rqs.size() ; i ++) {
				 list.addAll( session.createQuery("From Request  where requestid ='"+rqs.get(i)+"'").list());
			 	System.out.println("requestid manager"+rqs.get(i));
			 }
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
		public List<Customer> findCustomerDataForCustomer(){
			List<Customer> list = new ArrayList<Customer>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From Customer ").list();
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
		
		///List Table Quotation
				public List<Quotations> getOfferQuotationData(int memberid){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Quotations where provider_id ='"+memberid+"'  order by request_id ASC").list();
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
					 		list = session.createQuery("From CleanerProvider where memberid ='"+ qid+"'").list();

					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
}
