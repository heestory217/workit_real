package com.it.workit.question.model;

public class CmtyuserinfoVO {
	private String userNicknum;
    private int userNo;
    private String userNickname;
	public String getUserNicknum() {
		return userNicknum;
	}
	public void setUserNicknum(String userNicknum) {
		this.userNicknum = userNicknum;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	
	@Override
	public String toString() {
		return "CmtyuserinfoVO [userNicknum=" + userNicknum + ", userNo=" + userNo + ", userNickname=" + userNickname
				+ "]";
	}
    
	
    
    
}
