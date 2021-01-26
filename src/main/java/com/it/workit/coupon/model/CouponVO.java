package com.it.workit.coupon.model;

import java.sql.Timestamp;

public class CouponVO {
	private int couponNo;
	private String couponName;
	private int couponRate;
	private Timestamp couponStartdate;
	private Timestamp couponEnddate;
	
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getCouponRate() {
		return couponRate;
	}
	public void setCouponRate(int couponRate) {
		this.couponRate = couponRate;
	}
	public Timestamp getCouponStartdate() {
		return couponStartdate;
	}
	public void setCouponStartdate(Timestamp couponStartdate) {
		this.couponStartdate = couponStartdate;
	}
	public Timestamp getCouponEnddate() {
		return couponEnddate;
	}
	public void setCouponEnddate(Timestamp couponEnddate) {
		this.couponEnddate = couponEnddate;
	}
	
	@Override
	public String toString() {
		return "CouponVO [couponNo=" + couponNo + ", couponName=" + couponName + ", couponRate=" + couponRate
				+ ", couponStartdate=" + couponStartdate + ", couponEnddate=" + couponEnddate + "]";
	}
	
	
}
