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

public class ViewRequestCustomerDetaileManager {
	///List Search Table Service Person + Address
	public List<Request> viewRequestCustomerDetaile(String id){
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
	///List Table Cleaner Provider
		public List<CleanerProvider> findCleanerProviderDatas(int memberid){
			List<CleanerProvider> list = new ArrayList<CleanerProvider>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From CleanerProvider  where memberid = '"+memberid+"'").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///List Table Service Person
				public List<ServicePerson> findServicePersonDatas(int memberid){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From ServicePerson  where memberid = '"+memberid+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
		///List Table Company
				public List<Company> findCompanyDatas(int memberid){
					List<Company> list = new ArrayList<Company>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Company  where memberid = '"+memberid+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
}
