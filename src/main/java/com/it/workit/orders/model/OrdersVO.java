package com.it.workit.orders.model;

import java.sql.Timestamp;

public class OrdersVO {
	private int orderNo;
	private int userNo;
	private String orderPaykind;
	private int couponNo;
	private int orderDiscount;
	private int orderPay;
	private Timestamp orderDate;
	
	//join을 위한 객체 생성
	private Timestamp paidserviceStartdate;
	private Timestamp paidserviceEnddate;
	private String paidserviceName;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getOrderPaykind() {
		return orderPaykind;
	}
	public void setOrderPaykind(String orderPaykind) {
		this.orderPaykind = orderPaykind;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public int getOrderDiscount() {
		return orderDiscount;
	}
	public void setOrderDiscount(int orderDiscount) {
		this.orderDiscount = orderDiscount;
	}
	public int getOrderPay() {
		return orderPay;
	}
	public void setOrderPay(int orderPay) {
		this.orderPay = orderPay;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public Timestamp getPaidserviceStartdate() {
		return paidserviceStartdate;
	}
	public void setPaidserviceStartdate(Timestamp paidserviceStartdate) {
		this.paidserviceStartdate = paidserviceStartdate;
	}
	public Timestamp getPaidserviceEnddate() {
		return paidserviceEnddate;
	}
	public void setPaidserviceEnddate(Timestamp paidserviceEnddate) {
		this.paidserviceEnddate = paidserviceEnddate;
	}
	public String getPaidserviceName() {
		return paidserviceName;
	}
	public void setPaidserviceName(String paidserviceName) {
		this.paidserviceName = paidserviceName;
	}
	@Override
	public String toString() {
		return "OrdersVO [orderNo=" + orderNo + ", userNo=" + userNo + ", orderPaykind=" + orderPaykind + ", couponNo="
				+ couponNo + ", orderDiscount=" + orderDiscount + ", orderPay=" + orderPay + ", orderDate=" + orderDate
				+ ", paidserviceStartdate=" + paidserviceStartdate + ", paidserviceEnddate=" + paidserviceEnddate
				+ ", paidserviceName=" + paidserviceName + "]";
	}
	
	
	
}
