package com.it.workit.resumes.model;

public class AreaVO {
	private int areaNo;
	private String areaAdd1;
	private String areaAdd2;
	
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getAreaAdd1() {
		return areaAdd1;
	}
	public void setAreaAdd1(String areaAdd1) {
		this.areaAdd1 = areaAdd1;
	}
	public String getAreaAdd2() {
		return areaAdd2;
	}
	public void setAreaAdd2(String areaAdd2) {
		this.areaAdd2 = areaAdd2;
	}
	
	@Override
	public String toString() {
		return "AreaVO [areaNo=" + areaNo + ", areaAdd1=" + areaAdd1 + ", areaAdd2=" + areaAdd2 + "]";
	}
	
}
