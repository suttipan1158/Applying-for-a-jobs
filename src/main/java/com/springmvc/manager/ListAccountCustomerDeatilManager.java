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
import com.springmvc.model.ServicePerson;

public class ListAccountCustomerDeatilManager {
	///List Search Table Service Person + Address
		public List<Customer> findNameAccountCustomer(){
			List<Customer> list = new ArrayList<Customer>();
			List<Customer> list1 = new ArrayList<Customer>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();

			 	list1 = session.createQuery("From Customer ").list();
			 	
			 		for(Customer c :list1) {
			 			if(c.getLogin().getLoginType().equals("ลูกค้า")) {
			 				list.add(c);
			 				System.out.println("list.add(c);"+c);
			 			}
			 		}
			 	System.out.println(list.size());
			 	session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
	///List Table Login
	public List<Login> ListLogin(){
		List<Login> list = new ArrayList<Login>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From Login").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	
	//////************************** View Account Cleaner Provider Detail ********************************
	public List<Customer> findAccountCustomerDetail(String id){
		List<Customer> list = new ArrayList<Customer>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From Customer where customerid ='"+Integer.parseInt(id)+"'").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
}
