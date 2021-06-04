package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.CleanerProvider;
import com.springmvc.model.Company;
import com.springmvc.model.ServicePerson;

public class SearchCleanerProviderManager {
	///List Table CleanerProvider
	public List<CleanerProvider> searchCleanerProviderCategory(){
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
/// Search Location
//			public List<ServicePerson> searchCleanerProviderLocationPerson(String subdistrict, String district, String province, String postcode){
//				List<ServicePerson> list = new ArrayList<ServicePerson>();
//				try{
//				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
//				 Session session = sessionFactory.openSession();
//				 session.beginTransaction();
//				 	list = session.createQuery("From ServicePerson where subDistrict ='"+subdistrict+"' and district ='"+district+"' and province ='"+province+
//				 								"'and postcode ='"+postcode+"'").list();
//				 session.close();
//				}catch(Exception e){
//					e.printStackTrace();
//				}
//					return list;
//				}
//
//			public List<Company> searchCleanerProviderLocationCompany(String subdistrict, String district, String province, String postcode){
//				List<Company> list = new ArrayList<Company>();
//				try{
//				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
//				 Session session = sessionFactory.openSession();
//				 session.beginTransaction();
//				 	list = session.createQuery("From Company where subDistrict ='"+subdistrict+"' and district ='"+district+"' and province ='"+province+
//				 								"'and postcode ='"+postcode+"'").list();
//				 session.close();
//				}catch(Exception e){
//					e.printStackTrace();
//				}
//					return list;
//				}
			///List Search Table Service Person + Address
	public List<ServicePerson> searchCleanerProviderCategoryPerson(String subdistrict, String district, String province, String postcode){
		List<ServicePerson> list = new ArrayList<ServicePerson>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From ServicePerson where subDistrict ='"+subdistrict+"' and district ='"+district+"' and province ='"+province+
		 								"'and postcode ='"+postcode+"'").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Search Table Company 
	public List<Company> searchCleanerProviderCategoryCompany(String subdistrict, String district, String province, String postcode){
		List<Company> list = new ArrayList<Company>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From Company where subDistrict ='"+subdistrict+"' and district ='"+district+"' and province ='"+province+
		 								"'and postcode ='"+postcode+"'").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
}
