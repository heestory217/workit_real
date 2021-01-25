package com.it.workit.paidService.model;

public class PaidServiceVO {
	private int paidServiceNo;
    private String paidServiceName;
    private String paidServiceExp;	//서비스 설명
    private int paidServicePrice;
    
	public int getPaidServiceNo() {
		return paidServiceNo;
	}
	public void setPaidServiceNo(int paidServiceNo) {
		this.paidServiceNo = paidServiceNo;
	}
	public String getPaidServiceName() {
		return paidServiceName;
	}
	public void setPaidServiceName(String paidServiceName) {
		this.paidServiceName = paidServiceName;
	}
	public String getPaidServiceExp() {
		return paidServiceExp;
	}
	public void setPaidServiceExp(String paidServiceExp) {
		this.paidServiceExp = paidServiceExp;
	}
	public int getPaidServicePrice() {
		return paidServicePrice;
	}
	public void setPaidServicePrice(int paidServicePrice) {
		this.paidServicePrice = paidServicePrice;
	}
	
	@Override
	public String toString() {
		return "PaidServiceVO [paidServiceNo=" + paidServiceNo + ", paidServiceName=" + paidServiceName
				+ ", paidServiceExp=" + paidServiceExp + ", paidServicePrice=" + paidServicePrice + "]";
	}
    
}
