package com.it.workit.shoppingCart.model;

import java.sql.Timestamp;

public class ShoppingCartVO {
	private int shoppingcartNo;
	private int userNo;
	private int resumeNo;
	private Timestamp shoppingcartDate;
	
	public int getShoppingcartNo() {
		return shoppingcartNo;
	}
	public void setShoppingcartNo(int shoppingcartNo) {
		this.shoppingcartNo = shoppingcartNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public Timestamp getShoppingcartDate() {
		return shoppingcartDate;
	}
	public void setShoppingcartDate(Timestamp shoppingcartDate) {
		this.shoppingcartDate = shoppingcartDate;
	}
	
	@Override
	public String toString() {
		return "ShoppingCartVO [shoppingcartNo=" + shoppingcartNo + ", userNo=" + userNo + ", resumeNo=" + resumeNo
				+ ", shoppingcartDate=" + shoppingcartDate + "]";
	}
	
}
