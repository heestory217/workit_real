package com.it.workit.resumes.model;

import java.util.List;

public class ResumeOpen2VO {
	private List<UserwantedworkareaVO> userWorkArea;
	private List<Integer> userLanguage;
	private List<String> areaAdd1;
	private List<String> areaAdd2;
	
	
	public List<UserwantedworkareaVO> getUserWorkArea() {
		return userWorkArea;
	}
	public void setUserWorkArea(List<UserwantedworkareaVO> userWorkArea) {
		this.userWorkArea = userWorkArea;
	}
	
	
	public List<Integer> getUserLanguage() {
		return userLanguage;
	}
	public void setUserLanguage(List<Integer> userLanguage) {
		this.userLanguage = userLanguage;
	}
	public List<String> getAreaAdd1() {
		return areaAdd1;
	}
	public void setAreaAdd1(List<String> areaAdd1) {
		this.areaAdd1 = areaAdd1;
	}
	public List<String> getAreaAdd2() {
		return areaAdd2;
	}
	public void setAreaAdd2(List<String> areaAdd2) {
		this.areaAdd2 = areaAdd2;
	}
	
	@Override
	public String toString() {
		return "ResumeOpenVO [userWorkArea=" + userWorkArea + ", userLanguage=" + userLanguage + "]";
	}
	
}
