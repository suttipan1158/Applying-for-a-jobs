package com.springmvc.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="serviceperson")
@PrimaryKeyJoinColumn(name="privderid")
public class ServicePerson extends CleanerProvider {

	@Column(name="personid", nullable = false)
	private int personid;
	
	@Column(name="firstName", length = 32)
	private String firstName;
	
	@Column(name="lastName", length = 32)
	private String lastName;
	
	@Column(name="birthday")
	private Date birthday;
	
	@Column(name="idCardsPhoto", length = 20)
	private String idCardsPhoto;
	
	@Column(name="couplePhotoidCards", length = 20)
	private String couplePhotoidCards;

	public ServicePerson() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServicePerson(int memberid, String tel, String email, String address, String subDistrict, String district,
			String province, String postcode, String latitude, String longitude, Login login, int privderid,
			String privatetype, String profilePhoto,int personid, String firstName, String lastName,String idCardsPhoto,
			String couplePhotoidCards) {
		super(memberid, tel, email, address, subDistrict, district, province, postcode, latitude, longitude, login, privderid,
				privatetype, profilePhoto);
		// TODO Auto-generated constructor stub

		this.personid = personid;
		this.firstName = firstName;
		this.lastName = lastName;
		this.idCardsPhoto = idCardsPhoto;
		this.couplePhotoidCards = couplePhotoidCards;
	}

	public int getPersonid() {
		return personid;
	}

	public void setPersonid(int personid) {
		this.personid = personid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getIdCardsPhoto() {
		return idCardsPhoto;
	}

	public void setIdCardsPhoto(String idCardsPhoto) {
		this.idCardsPhoto = idCardsPhoto;
	}

	public String getCouplePhotoidCards() {
		return couplePhotoidCards;
	}

	public void setCouplePhotoidCards(String couplePhotoidCards) {
		this.couplePhotoidCards = couplePhotoidCards;
	} 
	
	
	
}
