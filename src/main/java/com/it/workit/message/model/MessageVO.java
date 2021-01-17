package com.it.workit.message.model;

import java.security.Timestamp;

public class MessageVO {
	private int messageNo;
	private String messageTitle;
	private String messageContent;
	private Timestamp messageRegdate;
	private int sendDelflag;
	private int userNo;
	
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Timestamp getMessageRegdate() {
		return messageRegdate;
	}
	public void setMessageRegdate(Timestamp messageRegdate) {
		this.messageRegdate = messageRegdate;
	}
	public int getSendDelflag() {
		return sendDelflag;
	}
	public void setSendDelflag(int sendDelflag) {
		this.sendDelflag = sendDelflag;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "MessageVO [messageNo=" + messageNo + ", messageTitle=" + messageTitle + ", messageContent="
				+ messageContent + ", messageRegdate=" + messageRegdate + ", sendDelflag=" + sendDelflag + ", userNo="
				+ userNo + "]";
	}
	
}
