package com.it.workit.orders.model;

public class OrderDetailAdVO {
	private int orderNo;
	private int paidServiceNo;
	private int recruitannounceNo;
	
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
	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}
	
	@Override
	public String toString() {
		return "OrderDetailAdVO [orderNo=" + orderNo + ", paidServiceNo=" + paidServiceNo + ", recruitannounceNo="
				+ recruitannounceNo + "]";
	}
	

}
