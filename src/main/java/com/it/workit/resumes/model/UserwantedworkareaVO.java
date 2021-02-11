package com.it.workit.resumes.model;

import java.util.List;

public class UserwantedworkareaVO {
	//회원 희망 지역
	private int userwantedworkareaNo;
	private int resumeNo;
	private int areaNo;
	
	private List<UserwantedworkareaVO> userWorkArea;
	
	public List<UserwantedworkareaVO> getUserWorkArea() {
		return userWorkArea;
	}
	public void setUserWorkArea(List<UserwantedworkareaVO> userWorkArea) {
		this.userWorkArea = userWorkArea;
	}
	public int getUserwantedworkareaNo() {
		return userwantedworkareaNo;
	}
	public void setUserwantedworkareaNo(int userwantedworkareaNo) {
		this.userwantedworkareaNo = userwantedworkareaNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	
	@Override
	public String toString() {
		return "UserwantedworkareaVO [userwantedworkareaNo=" + userwantedworkareaNo + ", resumeNo=" + resumeNo + ", areaNo="
				+ areaNo + ", userWorkArea=" + userWorkArea + "]";
	}
	
	
}
