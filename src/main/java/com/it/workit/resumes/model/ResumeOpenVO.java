package com.it.workit.resumes.model;

import java.util.List;

public class ResumeOpenVO {
	private List<UserwantedworkareaVO> userWorkArea;
	private List<CorpuselanguageVO> userLanguage;
	
	
	public List<UserwantedworkareaVO> getUserWorkArea() {
		return userWorkArea;
	}
	public void setUserWorkArea(List<UserwantedworkareaVO> userWorkArea) {
		this.userWorkArea = userWorkArea;
	}
	public List<CorpuselanguageVO> getUserLanguage() {
		return userLanguage;
	}
	public void setUserLanguage(List<CorpuselanguageVO> userLanguage) {
		this.userLanguage = userLanguage;
	}
	
	@Override
	public String toString() {
		return "ResumeOpenVO [userWorkArea=" + userWorkArea + ", userLanguage=" + userLanguage + "]";
	}
	
}
