package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Company;
import com.springmvc.model.Customer;
import com.springmvc.model.Login;
import com.springmvc.model.ServicePerson;


public class EditAccountStatusManager {
////************************** Edit Account Customer ********************
	///List Search Table Service Person + Address
			public List<Customer> getListAccountCustomer(){
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
				 			}
				 		}
				 	System.out.println(list.size());
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
	///List Search Table Service Person + Address
		public List<Customer> findAccountCustomerID(String id){
			List<Customer> list = new ArrayList<Customer>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();

			 		list = session.createQuery("From Customer where customerid ='"+Integer.parseInt(id)+"'").list();
			 	
			 	System.out.println(list.size());
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///List Login ID Table Login
				public List<Login> findLoginID(String id){
					List<Login> list = new ArrayList<Login>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();

					 		list = session.createQuery("From Login where username ='"+id+"'").list();
					 	
					 	System.out.println(list.size());
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
		///EDIT Table Quotation 
		public String isEditAccountStatusCustomer(List<Login> logins,String statustype){
					 try{
						Session session =HibernateConnection.doHibernateConnection()
						.openSession();
						session.beginTransaction();
						Login login = new Login();
						
							for(Login l : logins) {
								
								login.setUsername(l.getUsername());
								login.setPassword(l.getPassword());
								login.setLoginType(l.getLoginType());
								login.setStatus(statustype);
							}
								
						session.update(login);
						session.getTransaction().commit();
						session.close();
						return "1";
					 }catch(Exception e){
						 e.printStackTrace();
						 return "2";
					 }
					}
		public List<Customer> viewAccountCustomerDetail(String id){
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
	////************************** Edit Account Cleaner Provider ********************
		
		///List Search Table Service Person + Address
				public List<Company> findAccountCompanyID(String id){
					List<Company> list = new ArrayList<Company>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();

					 		list = session.createQuery("From Company where companyid ='"+Integer.parseInt(id)+"'").list();
					 	
					 	System.out.println(list.size());
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Service Person id Table Service Person
				public List<ServicePerson> findAccountServicePersonID(String id){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();

					 		list = session.createQuery("From ServicePerson where personid ='"+Integer.parseInt(id)+"'").list();
					 	
					 	System.out.println(list.size());
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Company Table Company
				public List<Company> findListCompany(){
					List<Company> list = new ArrayList<Company>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();

					 		list = session.createQuery("From Company ").list();
					 	
					 	System.out.println(list.size());
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Service Person  Table Service Person
				public List<ServicePerson> findListServicePerson(){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();

					 		list = session.createQuery("From ServicePerson ").list();
					 	
					 	System.out.println(list.size());
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				public List<Company> findAccountCleanerProviderFromCompany(String id){
					List<Company> list = new ArrayList<Company>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Company where companyid ='"+Integer.parseInt(id)+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List Table ServicePerson
				public List<ServicePerson> findAccountCleanerProviderFromServicePerson(String id){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 		list = session.createQuery("From ServicePerson where  personid ='"+Integer.parseInt(id)+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
}
