package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Company;
import com.springmvc.model.ServicePerson;

public class ListAccountCleanerProviderDetailMagamer {
	
	///List Table ServicePerson
			public List<ServicePerson> queryListAccuntCleanerProviderPerson(){
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
				public List<Company>queryListAccuntCleanerProviderCompany(){
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
			
	//////************************** View Account Cleaner Provider Detail ********************************
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
