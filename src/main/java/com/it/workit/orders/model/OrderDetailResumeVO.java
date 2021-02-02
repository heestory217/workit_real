package com.it.workit.orders.model;

public class OrderDetailResumeVO {
	private int orderNo;
	private int paidServiceNo;
	private int resumeNo;
	private int resumeRead;	//구매한 이력서 읽음여부 확인 컬럼
	
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
	public int getResumeRead() {
		return resumeRead;
	}
	public void setResumeRead(int resumeRead) {
		this.resumeRead = resumeRead;
	}
	
	@Override
	public String toString() {
		return "OrderDetailResumeVO [orderNo=" + orderNo + ", paidServiceNo=" + paidServiceNo + ", resumeNo=" + resumeNo
				+ ", resumeRead=" + resumeRead + "]";
	}
	
}
