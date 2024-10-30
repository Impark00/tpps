package com.ps.tp.vo;

import java.util.Date;

public class UserVO {
	private String userId;
	private String userPassword;
	private String userPasswordRe;
	private String userName;
	private String userPhone;
	private String userEmail;
	private Date userRegDate;
	private int verify;
	
	public String getUserId() {
		return userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public String getUserPasswordRe() {
		return userPasswordRe;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public int getVerify() {
		return verify;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public void setUserPasswordRe(String userPasswordRe) {
		this.userPasswordRe = userPasswordRe;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	
	
}
