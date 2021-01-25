package com.it.workit.recruitBookmark.model;

import java.sql.Timestamp;

public class RecruitannouncebookmarkVO {
	private int recruitannouncebookmarkNo;
	private int userNo;
	private int recruitannounceNo;
	
	//join을 위한 객체 추가
	private String recruitannounceTitle;
	private Timestamp recruitannounceStartdate;
	private Timestamp recruitannounceEnddate;
	private String recruitannounceScarrer;
	private String recruitannounceSworkkind;
	private String recruitannounceSpay;
	
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
	
	public String getRecruitannounceTitle() {
		return recruitannounceTitle;
	}
	public void setRecruitannounceTitle(String recruitannounceTitle) {
		this.recruitannounceTitle = recruitannounceTitle;
	}
	public Timestamp getRecruitannounceStartdate() {
		return recruitannounceStartdate;
	}
	public void setRecruitannounceStartdate(Timestamp recruitannounceStartdate) {
		this.recruitannounceStartdate = recruitannounceStartdate;
	}
	public Timestamp getRecruitannounceEnddate() {
		return recruitannounceEnddate;
	}
	public void setRecruitannounceEnddate(Timestamp recruitannounceEnddate) {
		this.recruitannounceEnddate = recruitannounceEnddate;
	}
	public String getRecruitannounceScarrer() {
		return recruitannounceScarrer;
	}
	public void setRecruitannounceScarrer(String recruitannounceScarrer) {
		this.recruitannounceScarrer = recruitannounceScarrer;
	}
	public String getRecruitannounceSworkkind() {
		return recruitannounceSworkkind;
	}
	public void setRecruitannounceSworkkind(String recruitannounceSworkkind) {
		this.recruitannounceSworkkind = recruitannounceSworkkind;
	}
	public String getRecruitannounceSpay() {
		return recruitannounceSpay;
	}
	public void setRecruitannounceSpay(String recruitannounceSpay) {
		this.recruitannounceSpay = recruitannounceSpay;
	}
	
	@Override
	public String toString() {
		return "RecruitannouncebookmarkVO [recruitannouncebookmarkNo=" + recruitannouncebookmarkNo + ", userNo="
				+ userNo + ", recruitannounceNo=" + recruitannounceNo + ", recruitannounceTitle=" + recruitannounceTitle
				+ ", recruitannounceStartdate=" + recruitannounceStartdate + ", recruitannounceEnddate="
				+ recruitannounceEnddate + ", recruitannounceScarrer=" + recruitannounceScarrer
				+ ", recruitannounceSworkkind=" + recruitannounceSworkkind + ", recruitannounceSpay="
				+ recruitannounceSpay + "]";
	}
	
	
}
