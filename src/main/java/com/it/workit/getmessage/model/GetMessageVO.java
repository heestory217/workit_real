package com.it.workit.getmessage.model;

public class GetMessageVO {
	private int getMessageNo;
	private int getMessageReadflag;
	private int userNo;
	private int getMessageDelflag;
	private int getMessageImpflag;
	private int messageNo;
	
	public int getGetMessageNo() {
		return getMessageNo;
	}
	public void setGetMessageNo(int getMessageNo) {
		this.getMessageNo = getMessageNo;
	}
	public int getGetMessageReadflag() {
		return getMessageReadflag;
	}
	public void setGetMessageReadflag(int getMessageReadflag) {
		this.getMessageReadflag = getMessageReadflag;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getGetMessageDelflag() {
		return getMessageDelflag;
	}
	public void setGetMessageDelflag(int getMessageDelflag) {
		this.getMessageDelflag = getMessageDelflag;
	}
	public int getGetMessageImpflag() {
		return getMessageImpflag;
	}
	public void setGetMessageImpflag(int getMessageImpflag) {
		this.getMessageImpflag = getMessageImpflag;
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	
	@Override
	public String toString() {
		return "GetMessageVO [getMessageNo=" + getMessageNo + ", getMessageReadflag=" + getMessageReadflag + ", userNo="
				+ userNo + ", getMessageDelflag=" + getMessageDelflag + ", getMessageImpflag=" + getMessageImpflag
				+ ", messageNo=" + messageNo + "]";
	}
}
