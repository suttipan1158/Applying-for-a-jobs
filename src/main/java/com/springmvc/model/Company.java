package com.springmvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="company")
@PrimaryKeyJoinColumn(name="privderid")
public class Company extends CleanerProvider {

	@Column(name="companyid", nullable = false)
	private int companyid;
	
	@Column(name="companyName", length = 45)
	private String companyName;
	
	@Column(name="contactName", length = 45)
	private String contactName;
	
	@Column(name="businessLicense", length = 45)
	private String businessLicense;
	
	@Column(name="facebookFanpage", length = 45)
	private String facebookFanpage;

	@Column(name="facebookFanpageURL")
	private String facebookFanpageURL;
	
	@Column(name="webSite", length = 45)
	private String webSite;

	@Column(name="webSiteURL")
	private String webSiteURL;

	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Company(int memberid, String tel, String email, String address, String subDistrict, String district,
			String province, String postcode, String latitude, String longitude, Login login, int privderid,
			String privatetype, String profilePhoto,int companyid, String companyName, String contactName, String businessLicense,
			String facebookFanpage, String facebookFanpageURL,String webSite, String webSiteURL) {
		super(memberid, tel, email, address, subDistrict, district, province, postcode, latitude, longitude, login, privderid,
				privatetype, profilePhoto);
		// TODO Auto-generated constructor stub
		this.companyid = companyid;
		this.companyName = companyName;
		this.contactName = contactName;
		this.businessLicense = businessLicense;
		this.facebookFanpage = facebookFanpage;
		this.facebookFanpageURL = facebookFanpageURL;
		this.webSite = webSite;
		this.webSiteURL = webSiteURL;
	}

	public int getCompanyid() {
		return companyid;
	}

	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getBusinessLicense() {
		return businessLicense;
	}

	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}

	public String getFacebookFanpage() {
		return facebookFanpage;
	}

	public void setFacebookFanpage(String facebookFanpage) {
		this.facebookFanpage = facebookFanpage;
	}

	public String getWebSite() {
		return webSite;
	}

	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}

	public String getFacebookFanpageURL() {
		return facebookFanpageURL;
	}

	public void setFacebookFanpageURL(String facebookFanpageURL) {
		this.facebookFanpageURL = facebookFanpageURL;
	}

	public String getWebSiteURL() {
		return webSiteURL;
	}

	public void setWebSiteURL(String webSiteURL) {
		this.webSiteURL = webSiteURL;
	}
	
	
}
