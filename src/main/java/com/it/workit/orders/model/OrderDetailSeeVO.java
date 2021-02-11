package com.it.workit.orders.model;

import java.sql.Timestamp;

//후기 열람권
public class OrderDetailSeeVO {
	private int orderNo;
	private int paidServiceNo;
	private Timestamp paidserviceEnddate;
	
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
	public Timestamp getPaidserviceEnddate() {
		return paidserviceEnddate;
	}
	public void setPaidserviceEnddate(Timestamp paidserviceEnddate) {
		this.paidserviceEnddate = paidserviceEnddate;
	}
	
	@Override
	public String toString() {
		return "OrderDetailSeeVO [orderNo=" + orderNo + ", paidServiceNo=" + paidServiceNo + ", paidserviceEnddate="
				+ paidserviceEnddate + "]";
	}
	
}
