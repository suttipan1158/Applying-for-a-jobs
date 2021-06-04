package com.springmvc.model;

import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="customer")

@PrimaryKeyJoinColumn(name="memberid")
public class Customer extends Member{
	
	@Column (name="customerid",nullable = false )
	private int customerid;
	
	@Column (name="firsName",nullable = false ,length = 32)
	private String firsName;
	
	@Column (name="lastName",nullable = false ,length = 32)
	private String lastName;
	
	@Column (name="birthDay")
	private Date birthDay ;
	
	@OneToMany(mappedBy="customer")
	private List<Request> requestid = new Vector<Request>();

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(int memberid, String tel, String email, String address, String subDistrict, String district,
			String province, String postcode, String latitude, String longitude ,Login login,int customerid, String firsName, String lastName) {
		super(memberid, tel, email, address, subDistrict, district, province, postcode, latitude, longitude,login);
		// TODO Auto-generated constructor stub
		this.customerid = customerid;
		this.firsName = firsName;
		this.lastName = lastName;

	}


	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getFirsName() {
		return firsName;
	}

	public void setFirsName(String firsName) {
		this.firsName = firsName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public List<Request> getRequestid() {
		return requestid;
	}

	public void setRequestid(List<Request> requestid) {
		this.requestid = requestid;
	}
	
	
}
