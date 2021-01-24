package com.it.workit.recruitBookmark.model;

public class RecruitannouncebookmarkVO {
	private int recruitannouncebookmarkNo;
	private int userNo;
	private int recruitannounceNo;
	
	public int getRecruitannouncebookmarkNo() {
		return recruitannouncebookmarkNo;
	}
	public void setRecruitannouncebookmarkNo(int recruitannouncebookmarkNo) {
		this.recruitannouncebookmarkNo = recruitannouncebookmarkNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}
	@Override
	public String toString() {
		return "RecruitannouncebookmarkVO [recruitannouncebookmarkNo=" + recruitannouncebookmarkNo + ", userNo="
				+ userNo + ", recruitannounceNo=" + recruitannounceNo + "]";
	}
	
	
}
