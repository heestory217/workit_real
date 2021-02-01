package com.it.workit.orders.model;

public class OrderDetailDelRvVO {
	private int orderNo;
	private int paidServiceNo;
	private int corpreviewNo;

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
	public int getCorpreviewNo() {
		return corpreviewNo;
	}
	public void setCorpreviewNo(int corpreviewNo) {
		this.corpreviewNo = corpreviewNo;
	}
	
	@Override
	public String toString() {
		return "OrderDetailDelRvVO [orderNo=" + orderNo + ", paidServiceNo=" + paidServiceNo + ", corpreviewNo="
				+ corpreviewNo + "]";
	}
	
}
