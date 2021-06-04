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
import com.springmvc.model.ServicePerson;

public class EditProfileManager {
	///List Table Member
	public List<Member> findMemberData(Login login){
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
		public List<Customer> findMemberDataForCustomer(int memberid){
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
		///List Table Cleaner Provider
				public List<CleanerProvider> findMemberDataForCleanerProvider(int memberid){
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
		public List<ServicePerson> findMemberDataForServicePerson(int privderid){
			List<ServicePerson> list = new ArrayList<ServicePerson>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From ServicePerson  where privderid = '"+privderid+"'").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
		///List Table Company
		public List<Company> findMemberDataForCompany(int privderid){
			List<Company> list = new ArrayList<Company>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From Company  where privderid = '"+privderid+"'").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
	///EDIT Table Customer And Member And Login
		public String isUpdateProfileDataCustomer(Customer cus){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				session.update(cus);
				session.getTransaction().commit();
				session.close();
				return "1";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "2";
			 }
			}
		///EDIT Table ServicePerson And CleanerProvider And Member And Login
		public String isUpdateProfileDataServicePerson(ServicePerson sp){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				session.update(sp);
				session.getTransaction().commit();
				session.close();
				return "1";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "2";
			 }
			}
		///EDIT Table Company And CleanerProvider And Member And Login
		public String isUpdateProfileDataCompany(Company com){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				session.update(com);
				session.getTransaction().commit();
				session.close();
				return "1";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "2";
			 }
			}
		///EDIT Table Customer And Member And Login
		public String isDeletedateProfileData(Login login){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				session.delete(login);;
				session.getTransaction().commit();
				session.close();
				return "Sign Up Successfully...";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "User is already there with this username";
			 }
			}
		
	
}
