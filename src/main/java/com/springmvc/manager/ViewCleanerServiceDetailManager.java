package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Quotations;

public class ViewCleanerServiceDetailManager {
	///List Quotations id table Quotations
		public List<Quotations> viewCleanerServiceDetail(String id){
			List<Quotations> list = new ArrayList<Quotations>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From Quotations where quotationsid ='"+ id+"'").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
			
}
