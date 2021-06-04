package com.springmvc.model;

import java.util.List;
import java.util.Vector;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="suggest")
public class Suggest {

	@Id
	private int suggestid;
	
	@Column(name="suggestTime",length = 45)
	private String suggestTime;
	
	@Column(name="suggestPrice",length = 45)
	private String suggestPrice;
	
	@Column(name="addressType",length = 100)
	private String addressType;
	
	@Column(name="addressFormat")
	private String addressFormat;
	
	@OneToMany(mappedBy="suggest")
	private List<Request> requestid = new Vector<Request>();

	public Suggest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Suggest(int suggestid, String suggestTime, String suggestPrice, String addressType, String addressFormat) {
		super();
		this.suggestid = suggestid;
		this.suggestTime = suggestTime;
		this.suggestPrice = suggestPrice;
		this.addressType = addressType;
		this.addressFormat = addressFormat;
	}



	public int getSuggestid() {
		return suggestid;
	}

	public void setSuggestid(int suggestid) {
		this.suggestid = suggestid;
	}

	public String getSuggestTime() {
		return suggestTime;
	}

	public void setSuggestTime(String suggestTime) {
		this.suggestTime = suggestTime;
	}

	public String getSuggestPrice() {
		return suggestPrice;
	}

	public void setSuggestPrice(String suggestPrice) {
		this.suggestPrice = suggestPrice;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getAddressFormat() {
		return addressFormat;
	}

	public void setAddressFormat(String addressFormat) {
		this.addressFormat = addressFormat;
	}

	public List<Request> getRequestid() {
		return requestid;
	}

	public void setRequestid(List<Request> requestid) {
		this.requestid = requestid;
	}
	
	
}
