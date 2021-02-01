package com.it.workit.resumes.model;

import java.util.List;

public class AwardVO {
	private int awardNo; //번호
	private int resumeNo; //이력서 번호
	private String awardAbout; //내역
	private String awardDate; //기간
	
	private List<AwardVO> AwardVOList;
	
	public int getAwardNo() {
		return awardNo;
	}
	public void setAwardNo(int awardNo) {
		this.awardNo = awardNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getAwardAbout() {
		return awardAbout;
	}
	public void setAwardAbout(String awardAbout) {
		this.awardAbout = awardAbout;
	}
	public String getAwardDate() {
		return awardDate;
	}
	public void setAwardDate(String awardDate) {
		this.awardDate = awardDate;
	}
	
	
	public List<AwardVO> getAwardVOList() {
		return AwardVOList;
	}
	public void setAwardVOList(List<AwardVO> awardVOList) {
		AwardVOList = awardVOList;
	}
	
	
	@Override
	public String toString() {
		return "AwardVO [awardNo=" + awardNo + ", resumeNo=" + resumeNo + ", awardAbout=" + awardAbout + ", awardDate="
				+ awardDate + ", AwardVOList=" + AwardVOList + "]";
	}
	
	
}
