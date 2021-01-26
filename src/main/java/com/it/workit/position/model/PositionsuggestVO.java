package com.it.workit.position.model;

import java.sql.Timestamp;

public class PositionsuggestVO {
	 private int positionsuggestNo;
	 private String positionsuggestTitle;
	 private String positionsuggestPosition;
	 private int positionsuggestPrice;
	 private String positionsuggestContents;
	 private Timestamp positionsuggestRegdate;
	 private int sendDelflag;
	 private int userNo;
	 
	public int getPositionsuggestNo() {
		return positionsuggestNo;
	}
	public void setPositionsuggestNo(int positionsuggestNo) {
		this.positionsuggestNo = positionsuggestNo;
	}
	public String getPositionsuggestTitle() {
		return positionsuggestTitle;
	}
	public void setPositionsuggestTitle(String positionsuggestTitle) {
		this.positionsuggestTitle = positionsuggestTitle;
	}
	public String getPositionsuggestPosition() {
		return positionsuggestPosition;
	}
	public void setPositionsuggestPosition(String positionsuggestPosition) {
		this.positionsuggestPosition = positionsuggestPosition;
	}
	public int getPositionsuggestPrice() {
		return positionsuggestPrice;
	}
	public void setPositionsuggestPrice(int positionsuggestPrice) {
		this.positionsuggestPrice = positionsuggestPrice;
	}
	public String getPositionsuggestContents() {
		return positionsuggestContents;
	}
	public void setPositionsuggestContents(String positionsuggestContents) {
		this.positionsuggestContents = positionsuggestContents;
	}
	public Timestamp getPositionsuggestRegdate() {
		return positionsuggestRegdate;
	}
	public void setPositionsuggestRegdate(Timestamp positionsuggestRegdate) {
		this.positionsuggestRegdate = positionsuggestRegdate;
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
		return "PositionsuggestVO [positionsuggestNo=" + positionsuggestNo + ", positionsuggestTitle="
				+ positionsuggestTitle + ", positionsuggestPosition=" + positionsuggestPosition
				+ ", positionsuggestPrice=" + positionsuggestPrice + ", positionsuggestContents="
				+ positionsuggestContents + ", positionsuggestRegdate=" + positionsuggestRegdate + ", sendDelflag="
				+ sendDelflag + ", userNo=" + userNo + "]";
	}
	 
	 
}
