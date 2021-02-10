package com.it.workit.prohibit.model;

public class ProhibitJoinVO {
	private int prohibitjoinNo;
	private int userIndivNo;
	private int userCorpNo;
	
	public int getProhibitjoinNo() {
		return prohibitjoinNo;
	}
	public void setProhibitjoinNo(int prohibitjoinNo) {
		this.prohibitjoinNo = prohibitjoinNo;
	}
	public int getUserIndivNo() {
		return userIndivNo;
	}
	public void setUserIndivNo(int userIndivNo) {
		this.userIndivNo = userIndivNo;
	}
	public int getUserCorpNo() {
		return userCorpNo;
	}
	public void setUserCorpNo(int userCorpNo) {
		this.userCorpNo = userCorpNo;
	}
	
	@Override
	public String toString() {
		return "ProhibitJoinVO [prohibitjoinNo=" + prohibitjoinNo + ", userIndivNo=" + userIndivNo + ", userCorpNo="
				+ userCorpNo + "]";
	}

}
