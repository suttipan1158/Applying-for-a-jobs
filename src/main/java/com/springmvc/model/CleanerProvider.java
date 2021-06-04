package com.springmvc.model;

import java.util.List;
import java.util.Vector;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="cleanerprovider")
@PrimaryKeyJoinColumn(name="memberid")
public class CleanerProvider extends Member{
	
	
	@Column (name="privderid",nullable = false )
	private int privderid;
	
	@Column(name="privatetype",length = 10)
	private String privatetype;
	
	@Column(name="profilePhoto",length = 20)
	private String profilePhoto;
	
	@Transient
	private ServicePerson servicePerson;

	@Transient
	private Company company;
	
	@OneToMany(mappedBy="cleanerprovider")
	private List<Quotations> quotation = new Vector<Quotations>();

	public CleanerProvider() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CleanerProvider(int memberid, String tel, String email, String address, String subDistrict, String district,
			String province, String postcode, String latitude, String longitude, Login login,int privderid, String privatetype, String profilePhoto) {
		super(memberid, tel, email, address, subDistrict, district, province, postcode, latitude, longitude, login);
		// TODO Auto-generated constructor stub
	
		this.privderid = privderid;
		this.privatetype = privatetype;
		this.profilePhoto = profilePhoto;
	}

	public int getPrivderid() {
		return privderid;
	}

	public void setPrivderid(int privderid) {
		this.privderid = privderid;
	}

	public String getPrivatetype() {
		return privatetype;
	}

	public void setPrivatetype(String privatetype) {
		this.privatetype = privatetype;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

	public ServicePerson getServicePerson() {
		return servicePerson;
	}

	public void setServicePerson(ServicePerson servicePerson) {
		this.servicePerson = servicePerson;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<Quotations> getQuotation() {
		return quotation;
	}

	public void setQuotation(List<Quotations> quotation) {
		this.quotation = quotation;
	}
	
	

}
