package com.it.workit.orders.model;

public class OrderDetailResumeVO {
	private int orderNo;
	private int paidServiceNo;
	private int resumeNo;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getPaidServiceNo() {
		return paidServiceNo;
	}
	public void setPaidServiceNo(int paidServiceNo) {
		this.paidServiceNo = paidServiceNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	
	@Override
	public String toString() {
		return "OrderDetailResume [orderNo=" + orderNo + ", paidServiceNo=" + paidServiceNo + ", resumeNo=" + resumeNo
				+ "]";
	}
	
}
