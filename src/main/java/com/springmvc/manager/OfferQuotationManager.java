package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Quotations;
import com.springmvc.model.Request;

public class OfferQuotationManager {
	///INSERT Table Quotation 
		public String isOfferQuotationData(Quotations quotations){
			 try{
				Session session =HibernateConnection.doHibernateConnection()
				.openSession();
				session.beginTransaction();
				session.save(quotations);
				session.getTransaction().commit();
				session.close();
				return "1";
			 }catch(Exception e){
				 e.printStackTrace();
				 return "2";
			 }
			}
	public List<Quotations> getOfferQuotationData(){
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
	///List Request id  Table Request
	public List<Request> getListRequestID(List<String> id){
		List<Request> list = new ArrayList<Request>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
			 for(int i = 0 ; i < id.size() ; i ++) {
				 list.addAll( session.createQuery("From Request  where requestid ='"+Integer.parseInt(id.get(i))+"'").list());
			 	System.out.println("requestid manager"+id.get(i));
			 }
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Table Request
			public List<Request> getListRequest(){
				List<Request> list = new ArrayList<Request>();
				try{
				 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
				 Session session = sessionFactory.openSession();
				 session.beginTransaction();
				 	list = session.createQuery("From Request  ").list();
				 session.close();
				}catch(Exception e){
					e.printStackTrace();
				}
					return list;
				}
			
	
}
