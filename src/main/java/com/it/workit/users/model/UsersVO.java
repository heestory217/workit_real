package com.it.workit.users.model;

import java.sql.Timestamp;

public class UsersVO {
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userZipcode;
	private String userAddress;
	private String userHp;
	private int workkindNo;
	private String userExperience;
	private Timestamp userRegdate;
	private Timestamp userEnddate;
	private int userCorpcheck;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserHp() {
		return userHp;
	}
	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}
	public int getWorkkindNo() {
		return workkindNo;
	}
	public void setWorkkindNo(int workkindNo) {
		this.workkindNo = workkindNo;
	}
	public String getUserExperience() {
		return userExperience;
	}
	public void setUserExperience(String userExperience) {
		this.userExperience = userExperience;
	}
	public Timestamp getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}
	public Timestamp getUserEnddate() {
		return userEnddate;
	}
	public void setUserEnddate(Timestamp userEnddate) {
		this.userEnddate = userEnddate;
	}
	public int getUserCorpcheck() {
		return userCorpcheck;
	}
	public void setUserCorpcheck(int userCorpcheck) {
		this.userCorpcheck = userCorpcheck;
	}
	@Override
	public String toString() {
		return "UsersVO [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPassword="
				+ userPassword + ", userEmail=" + userEmail + ", userZipcode=" + userZipcode + ", userAddress="
				+ userAddress + ", userHp=" + userHp + ", workkindNo=" + workkindNo + ", userExperience="
				+ userExperience + ", userRegdate=" + userRegdate + ", userEnddate=" + userEnddate + ", userCorpcheck="
				+ userCorpcheck + "]";
	}
	
	
}
