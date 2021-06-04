package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.Member;
import com.springmvc.model.Request;
import com.springmvc.model.Suggest;

public class EditRequestCleanerManager {
	///List Search Table Service Person + Address
	public List<Request> findEditCategoryAddressData(String id){
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
	public List<Customer> findRequestCleanerDataForCustomer(int memberid){
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
	public List<Suggest> findEditCategoryAddressData(){
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
	///EDIT Table Request Cleaner And Member And Login
			public String isUpdateRequestCleaner(Request request){
				 try{
					Session session =HibernateConnection.doHibernateConnection()
					.openSession();
					session.beginTransaction();
					session.update(request);
					session.getTransaction().commit();
					session.close();
					return "Sign Up Successfully...";
				 }catch(Exception e){
					 e.printStackTrace();
					 return "User is already there with this username";
				 }
				}
}
