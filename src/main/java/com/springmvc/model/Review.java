package com.springmvc.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="review")
public class Review {

	@Id
	private int reviewid;
	
	@Column(name="serviceScore")
	private int serviceScore;
	
	@Column(name="writeReview",length = 255)
	private String writeReview;
	
	@Column(name="reviewDate")
	private Date reviewDate;
	
	@OneToOne(mappedBy = "review",orphanRemoval=true)
	private Quotations quotation;

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewid, int serviceScore, String writeReview) {
		super();
		this.reviewid = reviewid;
		this.serviceScore = serviceScore;
		this.writeReview = writeReview;
	}

	public int getReviewid() {
		return reviewid;
	}

	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}

	public int getServiceScore() {
		return serviceScore;
	}

	public void setServiceScore(int serviceScore) {
		this.serviceScore = serviceScore;
	}

	public String getWriteReview() {
		return writeReview;
	}

	public void setWriteReview(String writeReview) {
		this.writeReview = writeReview;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public Quotations getQuotation() {
		return quotation;
	}

	public void setQuotation(Quotations quotation) {
		this.quotation = quotation;
	}
	

}
