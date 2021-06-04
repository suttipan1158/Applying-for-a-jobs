package com.springmvc.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="member")
@Inheritance(strategy = InheritanceType.JOINED)
public class Member {
	
	@Id
	private int memberid;
	
	@Column(name="tel",length = 10)
	private String tel;
	
	@Column(name="email",length = 50)
	private String email;
	
	@Column(name="address",length = 45)
	private String address;
	
	@Column(name="subDistrict",length = 20)
	private String subDistrict;
	
	@Column(name="district",length = 20)
	private String district;
	
	@Column(name="province",length = 20)
	private String province;
	
	@Column(name="postcode",length = 5)
	private String postcode;
	
	@Column(name="latitude",length = 45)
	private String latitude;
	
	@Column(name="longitude",length = 45)
	private String longitude;

	@Transient
	private Customer customer;
	
	@Transient
	private CleanerProvider cleanerProvider;
	
	@OneToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "login_id")
	 private Login login;

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int memberid, String tel, String email, String address, String subDistrict, String district,
			String province, String postcode, String latitude, String longitude, Login login) {
		super();
		this.memberid = memberid;
		this.tel = tel;
		this.email = email;
		this.address = address;
		this.subDistrict = subDistrict;
		this.district = district;
		this.province = province;
		this.postcode = postcode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.login = login;
	}

	public Member(String subDistrict, String district, String province, String postcode) {
		super();
		this.subDistrict = subDistrict;
		this.district = district;
		this.province = province;
		this.postcode = postcode;
	}

	public int getMemberid() {
		return memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSubDistrict() {
		return subDistrict;
	}

	public void setSubDistrict(String subDistrict) {
		this.subDistrict = subDistrict;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public CleanerProvider getCleanerProvider() {
		return cleanerProvider;
	}

	public void setCleanerProvider(CleanerProvider cleanerProvider) {
		this.cleanerProvider = cleanerProvider;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}
	
	
}
