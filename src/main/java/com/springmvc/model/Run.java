package com.springmvc.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;

public class Run {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		Session session = sessionFactory.openSession();
	

	}

}
