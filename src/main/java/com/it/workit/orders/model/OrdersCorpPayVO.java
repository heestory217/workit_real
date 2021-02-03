package com.it.workit.orders.model;

import java.sql.Timestamp;

public class OrdersCorpPayVO {
	private int orderNo;
	private int userNo;
	private String orderPaykind;
	private int couponNo;
	private int orderDiscount;
	private int orderPay;
	private Timestamp orderDate;
	
	private String payName;
	private int recruitannounceNo;
	private int resumeNo;
	private int corpreviewNo;
	
	private Timestamp paidservicestartdate;
	private Timestamp paidserviceenddate;
	private String recruitname;
	private String resumtitle;
	private String oneline;
	
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
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}
	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getCorpreviewNo() {
		return corpreviewNo;
	}
	public void setCorpreviewNo(int corpreviewNo) {
		this.corpreviewNo = corpreviewNo;
	}
	public Timestamp getPaidservicestartdate() {
		return paidservicestartdate;
	}
	public void setPaidservicestartdate(Timestamp paidservicestartdate) {
		this.paidservicestartdate = paidservicestartdate;
	}
	public Timestamp getPaidserviceenddate() {
		return paidserviceenddate;
	}
	public void setPaidserviceenddate(Timestamp paidserviceenddate) {
		this.paidserviceenddate = paidserviceenddate;
	}
	public String getRecruitname() {
		return recruitname;
	}
	public void setRecruitname(String recruitname) {
		this.recruitname = recruitname;
	}
	public String getResumtitle() {
		return resumtitle;
	}
	public void setResumtitle(String resumtitle) {
		this.resumtitle = resumtitle;
	}
	public String getOneline() {
		return oneline;
	}
	public void setOneline(String oneline) {
		this.oneline = oneline;
	}
	@Override
	public String toString() {
		return "OrdersCorpPayVO [orderNo=" + orderNo + ", userNo=" + userNo + ", orderPaykind=" + orderPaykind
				+ ", couponNo=" + couponNo + ", orderDiscount=" + orderDiscount + ", orderPay=" + orderPay
				+ ", orderDate=" + orderDate + ", payName=" + payName + ", recruitannounceNo=" + recruitannounceNo
				+ ", resumeNo=" + resumeNo + ", corpreviewNo=" + corpreviewNo + ", paidservicestartdate="
				+ paidservicestartdate + ", paidserviceenddate=" + paidserviceenddate + ", recruitname=" + recruitname
				+ ", resumtitle=" + resumtitle + ", oneline=" + oneline + "]";
	}
	
	
}
