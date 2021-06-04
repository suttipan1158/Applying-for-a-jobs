package com.springmvc.hibernate;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import com.springmvc.model.*;

public class HibernateConnection {
	public static SessionFactory sessionFactory;
	public static SessionFactory doHibernateConnection(){
	 Properties database = new Properties();
	 	 //database.setProperty("hibernate.hbm2ddl.auto", "create");
		 database.setProperty("hibernate.connection.driver_class","com.mysql.jdbc.Driver");
		 database.setProperty("hibernate.connection.username","root");
		 database.setProperty("hibernate.connection.password","1234");
		 database.setProperty("hibernate.connection.url","jdbc:mysql://localhost:3306/servicecleaner_5938_db");
		 database.setProperty("hibernate.dialect","org.hibernate.dialect.MySQL57Dialect");
	 Configuration cfg = new Configuration()
			 .setProperties(database)
			 .addPackage("com.springmvc.model")
			 .addAnnotatedClass(Login.class)
			 .addAnnotatedClass(Member.class)
			 .addAnnotatedClass(Customer.class)
			 .addAnnotatedClass(CleanerProvider.class)
			 .addAnnotatedClass(ServicePerson.class)
			 .addAnnotatedClass(Company.class)
			 .addAnnotatedClass(Suggest.class)
			 .addAnnotatedClass(Request.class)
			 .addAnnotatedClass(Review.class)
			 .addAnnotatedClass(Quotations.class);
	 StandardServiceRegistryBuilder ssrb =
			 new StandardServiceRegistryBuilder().applySettings(cfg.getProperties());
	 sessionFactory = cfg.buildSessionFactory(ssrb.build());
			return sessionFactory;

	}
}
