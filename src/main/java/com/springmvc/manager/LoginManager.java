package com.springmvc.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.springmvc.hibernate.HibernateConnection;
import com.springmvc.model.Login;

public class LoginManager {
	public List<Login> isValidateLogin(String username ,String psw){
		List<Login> user = new ArrayList<Login>() ;
			SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			try{
				
				user = session.createQuery("From Login where username='"+
						username+"' and password='"+psw+"'").list();
					
					  session.close();	
				
				}catch(Exception e){
					System.out.println(e.getMessage());
			}
			return user;
	}
}
	
