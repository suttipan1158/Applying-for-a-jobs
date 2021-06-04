package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.Member;
import com.springmvc.model.Quotations;
import com.springmvc.model.ServicePerson;

public class ViewCleanerProviderManager {
	///List Search Table Service Person + Address
			public List<ServicePerson> ViewCleanerProviderDetailOfServiceProson(String id){
				List<ServicePerson> list = new ArrayList<ServicePerson>();
				try{
				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				 Session session = sessionFactory.openSession();
				 session.beginTransaction();
				 	list = session.createQuery("From ServicePerson where personid ='"+ id+"'").list();
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
			///List Search Table Company 
					public List<Company> ViewCleanerProviderDetailOfCompany(String id){
						List<Company> list = new ArrayList<Company>();
						try{
						 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
						 Session session = sessionFactory.openSession();
						 session.beginTransaction();
						 	list = session.createQuery("From Company where companyid ='"+id+"'").list();
						 session.close();
						}catch(Exception e){
							e.printStackTrace();
						}
							return list;
						}
					///List Search Table Company 
					public List<Quotations> fineQuotationsID(int id){
						List<Quotations> list = new ArrayList<Quotations>();
						try{
						 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
						 Session session = sessionFactory.openSession();
						 session.beginTransaction();
						 	list = session.createQuery("From Quotations where provider_id ='"+id+"'").list();
						 session.close();
						}catch(Exception e){
							e.printStackTrace();
						}
							return list;
						}
}
