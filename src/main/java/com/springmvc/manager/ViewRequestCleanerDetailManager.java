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

public class ViewRequestCleanerDetailManager {

	///List Search Table Service Person + Address
			public List<Request> queryViewRequesCleanertDetail(String id){
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
				public List<Quotations> getQuotationsID(String qid){
					List<Quotations> list = new ArrayList<Quotations>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	
					 list = session.createQuery("From Quotations where request_id ='"+ qid+"'").list();
					 	
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List ServicePerson id table ServicePerson
				public List<ServicePerson> getServicePersonID(String qid){
					List<ServicePerson> list = new ArrayList<ServicePerson>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
				
						list = session.createQuery("From ServicePerson where memberid ='"+ Integer.parseInt(qid)+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
				///List ServicePerson id table ServicePerson
				public List<Company> getCompanyID(String qid){
					List<Company> list = new ArrayList<Company>();
					try{
					 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
					 Session session = sessionFactory.openSession();
					 session.beginTransaction();
					 	list = session.createQuery("From Company where memberid='"+Integer.parseInt(qid)+"'").list();
					 session.close();
					}catch(Exception e){
						e.printStackTrace();
					}
						return list;
					}
}
