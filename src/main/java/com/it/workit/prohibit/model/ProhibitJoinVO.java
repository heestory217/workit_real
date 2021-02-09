package com.it.workit.prohibit.model;

public class ProhibitJoinVO {
	private int prohibitjoinNo;
	private int userPersonalNo;
	private int userCorpNo;
	
	public int getProhibitjoinNo() {
		return prohibitjoinNo;
	}
	public void setProhibitjoinNo(int prohibitjoinNo) {
		this.prohibitjoinNo = prohibitjoinNo;
	}
	public int getUserPersonalNo() {
		return userPersonalNo;
	}
	public void setUserPersonalNo(int userPersonalNo) {
		this.userPersonalNo = userPersonalNo;
	}
	public int getUserCorpNo() {
		return userCorpNo;
	}
	public void setUserCorpNo(int userCorpNo) {
		this.userCorpNo = userCorpNo;
	}
	
	@Override
	public String toString() {
		return "ProhibitJoinVO [prohibitjoinNo=" + prohibitjoinNo + ", userPersonalNo=" + userPersonalNo
				+ ", userCorpNo=" + userCorpNo + "]";
	}
	
}
