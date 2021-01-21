package com.it.workit.users.model;

import java.sql.Timestamp;

public class UsersVO {
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPassword;
	private String userZipcode;
	private String userAddress;
	private int workkindNo;
	private String userExperience;
	private Timestamp userRegdate;
	private Timestamp userEnddate;
	private int userCorpcheck;
	private String userHp1;
	private String userHp2;
	private String userHp3;
	private String userEmail1;
	private String userEmail2;
	private String userAddressdetail;
	
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
	public String getUserHp1() {
		return userHp1;
	}
	public void setUserHp1(String userHp1) {
		this.userHp1 = userHp1;
	}
	public String getUserHp2() {
		return userHp2;
	}
	public void setUserHp2(String userHp2) {
		this.userHp2 = userHp2;
	}
	public String getUserHp3() {
		return userHp3;
	}
	public void setUserHp3(String userHp3) {
		this.userHp3 = userHp3;
	}
	public String getUserEmail1() {
		return userEmail1;
	}
	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}
	public String getUserAddressdetail() {
		return userAddressdetail;
	}
	public void setUserAddressdetail(String userAddressdetail) {
		this.userAddressdetail = userAddressdetail;
	}
	
	@Override
	public String toString() {
		return "UsersVO [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPassword="
				+ userPassword + ", userZipcode=" + userZipcode + ", userAddress=" + userAddress + ", workkindNo="
				+ workkindNo + ", userExperience=" + userExperience + ", userRegdate=" + userRegdate + ", userEnddate="
				+ userEnddate + ", userCorpcheck=" + userCorpcheck + ", userHp1=" + userHp1 + ", userHp2=" + userHp2
				+ ", userHp3=" + userHp3 + ", userEmail1=" + userEmail1 + ", userEmail2=" + userEmail2
				+ ", userAddressdetail=" + userAddressdetail + "]";
	}
	
	
}
