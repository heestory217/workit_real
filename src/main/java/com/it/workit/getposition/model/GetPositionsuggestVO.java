package com.it.workit.getposition.model;

public class GetPositionsuggestVO {
	private int getPositionNo;
	private int userNo;	//받는 회원번호
	private int getPositionsuggestReadFlag;	//읽기여부
	private int getPositionsuggestDelFlag;	//삭제여부
	private int positionsuggestNo;	//포지션제안번호

	public int getGetPositionNo() {
		return getPositionNo;
	}
	public void setGetPositionNo(int getPositionNo) {
		this.getPositionNo = getPositionNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getGetPositionsuggestReadFlag() {
		return getPositionsuggestReadFlag;
	}
	public void setGetPositionsuggestReadFlag(int getPositionsuggestReadFlag) {
		this.getPositionsuggestReadFlag = getPositionsuggestReadFlag;
	}
	public int getGetPositionsuggestDelFlag() {
		return getPositionsuggestDelFlag;
	}
	public void setGetPositionsuggestDelFlag(int getPositionsuggestDelFlag) {
		this.getPositionsuggestDelFlag = getPositionsuggestDelFlag;
	}
	public int getPositionsuggestNo() {
		return positionsuggestNo;
	}
	public void setPositionsuggestNo(int positionsuggestNo) {
		this.positionsuggestNo = positionsuggestNo;
	}
	
	@Override
	public String toString() {
		return "GetPositionsuggestVO [getPositionNo=" + getPositionNo + ", userNo=" + userNo
				+ ", getPositionsuggestReadFlag=" + getPositionsuggestReadFlag + ", getPositionsuggestDelFlag="
				+ getPositionsuggestDelFlag + ", positionsuggestNo=" + positionsuggestNo + "]";
	}

}
