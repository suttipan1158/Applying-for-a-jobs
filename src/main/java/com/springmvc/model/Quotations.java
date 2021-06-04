package com.springmvc.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="quotations")
public class Quotations {

	@Id
	private int quotationsid;
	
	@Column(name="priceOfferJob")
	private double priceOfferJob;
	
	@Column(name="note",columnDefinition = "TEXT")
	private String note;
	
	@Column(name="priceOffrtDate")
	private Date priceOffrtDate;
	
	@Column(name="status")
	private String status;
	
	@ManyToOne
    @JoinColumn(name="request_id", nullable=false)
    private Request request;
	
	@ManyToOne
    @JoinColumn(name="provider_id", nullable=false)
    private CleanerProvider cleanerprovider;
		
	 @OneToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "review_id")
	 private Review review;

	public Quotations() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Quotations(int quotationsid, double priceOfferJob, String note,  String status) {
		super();
		this.quotationsid = quotationsid;
		this.priceOfferJob = priceOfferJob;
		this.note = note;
		this.status = status;
	}

	public int getQuotationsid() {
		return quotationsid;
	}

	public void setQuotationsid(int quotationsid) {
		this.quotationsid = quotationsid;
	}

	public double getPriceOfferJob() {
		return priceOfferJob;
	}

	public void setPriceOfferJob(double priceOfferJob) {
		this.priceOfferJob = priceOfferJob;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getPriceOffrtDate() {
		return priceOffrtDate;
	}

	public void setPriceOffrtDate(Date priceOffrtDate) {
		this.priceOffrtDate = priceOffrtDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Request getRequest() {
		return request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

	public CleanerProvider getCleanerprovider() {
		return cleanerprovider;
	}

	public void setCleanerprovider(CleanerProvider cleanerprovider) {
		this.cleanerprovider = cleanerprovider;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}
	 
	 
}
