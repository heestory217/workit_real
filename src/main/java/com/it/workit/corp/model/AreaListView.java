package com.it.workit.corp.model;

public class AreaListView {
	private int resumeNo;//RESUME_NO
	private int areaNo;
	private int areaAdd1;	
	private int areaAdd2;
	
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
	public int getAreaAdd1() {
		return areaAdd1;
	}
	public void setAreaAdd1(int areaAdd1) {
		this.areaAdd1 = areaAdd1;
	}
	public int getAreaAdd2() {
		return areaAdd2;
	}
	public void setAreaAdd2(int areaAdd2) {
		this.areaAdd2 = areaAdd2;
	}
	@Override
	public String toString() {
		return "AreaListView [resumeNo=" + resumeNo + ", areaNo=" + areaNo + ", areaAdd1=" + areaAdd1 + ", areaAdd2="
				+ areaAdd2 + "]";
	}
	
	
}
