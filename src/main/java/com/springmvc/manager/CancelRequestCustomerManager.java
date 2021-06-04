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

public class CancelRequestCustomerManager {
	///Delete Table Request Customer
	public String deleteRequestCleaner(List<Request> id,List<Quotations> qtt){
		 try{
			Session session =HibernateConnection.doHibernateConnection()
			.openSession();
			session.beginTransaction();
				for (int i = 0; i < qtt.size(); i++) {
					
					System.out.println(qtt.get(i));
					session.delete(qtt.get(i));
				}
				for (int i = 0; i < id.size(); i++) {
					session.delete(id.get(i));
				}
			session.getTransaction().commit();
			session.close();
			return "1";
		 }catch(Exception e){
			 e.printStackTrace();
			 return "2";
		 }
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
	///List Table Request
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
	///List Table Request
	public List<Request> getListRequest(int cusid){
		List<Request> list = new ArrayList<Request>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	list = session.createQuery("From Request  where customer_id='"+cusid+"'").list();
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Table Request
		public List<Request> getListRequestID(int id){
			List<Request> list = new ArrayList<Request>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	list = session.createQuery("From Request  where requestid ='"+id+"'").list();
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
	///List Quotations id table Quotations
	public List<Quotations> getQuotationsID(List<String> qid){
		List<Quotations> list = new ArrayList<Quotations>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	for(int i = 0; i < qid.size() ; i++) {
		 		list.addAll( session.createQuery("From Quotations where request_id ='"+ Integer.parseInt(qid.get(i))+"'").list());
		 	}
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List Quotations id table Quotations
		public List<Quotations> getListQuotationsID(String qid){
			List<Quotations> list = new ArrayList<Quotations>();
			try{
			 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
			 Session session = sessionFactory.openSession();
			 session.beginTransaction();
			 	
			 	list = session.createQuery("From Quotations where request_id ='"+ Integer.parseInt(qid)+"'").list();
			 	
			 session.close();
			}catch(Exception e){
				e.printStackTrace();
			}
				return list;
			}
	///List ServicePerson id table ServicePerson
	public List<ServicePerson> getServicePersonID(List<String> qid){
		List<ServicePerson> list = new ArrayList<ServicePerson>();
		List<ServicePerson> list1 = new ArrayList<ServicePerson>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	for(int i = 0; i < qid.size() ; i++) {
		 		list1.addAll(  session.createQuery("From ServicePerson where memberid ='"+ Integer.parseInt(qid.get(i))+"'").list());
		 		
		 		list.addAll(list1);
		 	}
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	///List ServicePerson id table ServicePerson
	public List<Company> getCompanyID(List<String> qid){
		List<Company> list = new ArrayList<Company>();
		List<Company> list1 = new ArrayList<Company>();
		try{
		 SessionFactory sessionFactory = HibernateConnection.doHibernateConnection();
		 Session session = sessionFactory.openSession();
		 session.beginTransaction();
		 	for(int i = 0; i < qid.size() ; i++) {
		 		list1.addAll(  session.createQuery("From Company where memberid ='"+ Integer.parseInt(qid.get(i))+"'").list());
		 		
		 		list.addAll(list1);
		 	}
		 session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
			return list;
		}
	
}
