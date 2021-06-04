package com.springmvc.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class Login {
	
	@Id
	private String username;
	
	@Column(name="password",nullable = false,length = 15)
	private String password;
	
	@Column(name="loginType",length = 30)
	private String loginType;
	
	@Column(name="status",length = 30)
	private String status;

	@OneToOne(mappedBy = "login",orphanRemoval=true)
	private Member member;

	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Login(String username, String password, String loginType, String status) {
		super();
		this.username = username;
		this.password = password;
		this.loginType = loginType;
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
}
