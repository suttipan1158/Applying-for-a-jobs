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

public class ListCleanerProviderManager {
	///List Table CleanerProvider
	public List<CleanerProvider> listCleanerProvider(){
		List<CleanerProvider> list = new ArrayList<CleanerProvider>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From CleanerProvider").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Table ServicePerson
		public List<ServicePerson> listCleanerProviderServicePerson(){
			List<ServicePerson> list = new ArrayList<ServicePerson>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From ServicePerson").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
	///List Table ServicePerson
			public List<Company> listCleanerProviderCompany(){
				List<Company> list = new ArrayList<Company>();
				try{
				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				 Session session = sessionFactory.openSession();
				 session.beginTransaction();
				 	list = session.createQuery("From Company").list();
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
			public List<Quotations> getQuotations(){
				List<Quotations> list = new ArrayList<Quotations>();
				try{
				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				 Session session = sessionFactory.openSession();
				 session.beginTransaction();
				 
				 		list = session.createQuery("From Quotations ").list();
				 	
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
}
