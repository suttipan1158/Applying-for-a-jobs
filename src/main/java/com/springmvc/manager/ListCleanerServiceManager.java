package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;

public class ListCleanerServiceManager {
	///List Table Quotation
	public List<Quotations> viewCleanerServiceDetail(int memberid){
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
			///List Quotations id  Table Quotations
					public List<Quotations> queryListCleanerService(List<String> id){
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
			
}
