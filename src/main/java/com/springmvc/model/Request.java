package com.springmvc.model;

import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="request")
public class Request {

	@Id
	private int requestid;
	
	@Column(name="cleanNo",length = 45)
	private String cleanNo;
	
	@Column(name="addressType",length = 100)
	private String addressType;
	
	@Column(name="abodeFormat",length = 100)
	private String abodeFormat;
	
	@Column(name="timePeriod",length = 45)
	private String timePeriod;
	
	@Column(name="serviceDate")
	private Date serviceDate;
	
	@Column(name="servicePeriod",length = 45)
	private String servicePeriod; 
	
	@Column(name="priceMin")
	private double priceMin;
	
	@Column(name="priceMax")
	private double priceMax;
	
	@Column(name="note",columnDefinition="TEXT")
	private String note;
	
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
	
	@Column(name="animal",length = 45)
	private String animal;
	
	@Column(name="status",length = 100)
	private String status;
	
	@Column(name="doProvider")
	private String doProvider;
	
	@Column(name="selectProvider")
	private String selectProvider;
	
	@Column(name="weekNo")
	private String weekNo;
	
	@Column(name="dayInWeek")
	private String dayInWeek;
	
	@Column(name="months" ,length = 45)
	private String months;
	
	@Column(name="monthNo")
	private String monthNo;
	
	@Column(name="dayInMonth")
	private String dayInMonth;
	
	@ManyToOne
    @JoinColumn(name="customer_id", nullable=false)
    private Customer customer;
	
	@ManyToOne
    @JoinColumn(name="suggest_id", nullable=false)
    private Suggest suggest;
	
	@OneToMany(mappedBy="request")
	private List<Quotations> quotationid = new Vector<Quotations>();

	public Request() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Request(int requestid, String cleanNo, String addressType, String abodeFormat, String timePeriod, String servicePeriod,
			double priceMin, double priceMax, String note, String address, String subDistrict, String district,
			String province, String postcode, String latitude, String longitude, String animal, String status,
			String doProvider, String weekNo, String dayInWeek,String months, String monthNo, String dayInMonth) {
		super();
		this.requestid = requestid;
		this.cleanNo = cleanNo;
		this.addressType = addressType;
		this.abodeFormat = abodeFormat;
		this.timePeriod = timePeriod;
		this.servicePeriod = servicePeriod;
		this.priceMin = priceMin;
		this.priceMax = priceMax;
		this.note = note;
		this.address = address;
		this.subDistrict = subDistrict;
		this.district = district;
		this.province = province;
		this.postcode = postcode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.animal = animal;
		this.status = status;
		this.doProvider = doProvider;
		this.weekNo = weekNo;
		this.dayInWeek = dayInWeek;
		this.months = months;
		this.monthNo = monthNo;
		this.dayInMonth = dayInMonth;
	}

	public int getRequestid() {
		return requestid;
	}

	public void setRequestid(int requestid) {
		this.requestid = requestid;
	}

	public String getCleanNo() {
		return cleanNo;
	}

	public void setCleanNo(String cleanNo) {
		this.cleanNo = cleanNo;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getAbodeFormat() {
		return abodeFormat;
	}

	public void setAbodeFormat(String abodeFormat) {
		this.abodeFormat = abodeFormat;
	}

	public String getTimePeriod() {
		return timePeriod;
	}

	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public String getServicePeriod() {
		return servicePeriod;
	}

	public void setServicePeriod(String servicePeriod) {
		this.servicePeriod = servicePeriod;
	}

	public double getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(double priceMin) {
		this.priceMin = priceMin;
	}

	public double getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(double priceMax) {
		this.priceMax = priceMax;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getAnimal() {
		return animal;
	}

	public void setAnimal(String animal) {
		this.animal = animal;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDoProvider() {
		return doProvider;
	}

	public void setDoProvider(String doProvider) {
		this.doProvider = doProvider;
	}

	public String getWeekNo() {
		return weekNo;
	}

	public void setWeekNo(String weekNo) {
		this.weekNo = weekNo;
	}

	public String getDayInWeek() {
		return dayInWeek;
	}

	public void setDayInWeek(String dayInWeek) {
		this.dayInWeek = dayInWeek;
	}

	public String getMonthNo() {
		return monthNo;
	}
	
	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}

	public void setMonthNo(String monthNo) {
		this.monthNo = monthNo;
	}

	public String getDayInMonth() {
		return dayInMonth;
	}

	public void setDayInMonth(String dayInMonth) {
		this.dayInMonth = dayInMonth;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Suggest getSuggest() {
		return suggest;
	}

	public void setSuggest(Suggest suggest) {
		this.suggest = suggest;
	}

	public List<Quotations> getQuotationid() {
		return quotationid;
	}

	public void setQuotationid(List<Quotations> quotationid) {
		this.quotationid = quotationid;
	}

	public String getSelectProvider() {
		return selectProvider;
	}

	public void setSelectProvider(String selectProvider) {
		this.selectProvider = selectProvider;
	}
	
}
