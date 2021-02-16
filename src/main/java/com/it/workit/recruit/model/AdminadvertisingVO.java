package com.it.workit.recruit.model;

import java.util.Date;

public class AdminadvertisingVO {
	private int orderNo;
	private String payNames;
	private String recruitNames;
	private int recruitannounceNo;
	private Date paidserviceStartdate;
	private Date paidserviceEnddate;
	private int adprove;
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getPayNames() {
		return payNames;
	}
	public void setPayNames(String payNames) {
		this.payNames = payNames;
	}
	public String getRecruitNames() {
		return recruitNames;
	}
	public void setRecruitNames(String recruitNames) {
		this.recruitNames = recruitNames;
	}
	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}
	public Date getPaidserviceStartdate() {
		return paidserviceStartdate;
	}
	public void setPaidserviceStartdate(Date paidserviceStartdate) {
		this.paidserviceStartdate = paidserviceStartdate;
	}
	public Date getPaidserviceEnddate() {
		return paidserviceEnddate;
	}
	public void setPaidserviceEnddate(Date paidserviceEnddate) {
		this.paidserviceEnddate = paidserviceEnddate;
	}
	public int getAdprove() {
		return adprove;
	}
	public void setAdprove(int adprove) {
		this.adprove = adprove;
	}
	
	@Override
	public String toString() {
		return "AdminadvertisingVO [orderNo=" + orderNo + ", payNames=" + payNames + ", recruitNames=" + recruitNames
				+ ", recruitannounceNo=" + recruitannounceNo + ", paidserviceStartdate=" + paidserviceStartdate
				+ ", paidserviceEnddate=" + paidserviceEnddate + ", adprove=" + adprove + "]";
	}
}
