package com.it.workit.resumes.model;

import java.util.List;

public class CorpuselanguageVO {
	//회원 사용 언어
	private int corpuselanguageNo;
	private int languageNo;
	private int resumeNo;
	
	private List<CorpuselanguageVO> userLanguage;
	
	public int getCorpuselanguageNo() {
		return corpuselanguageNo;
	}
	public void setCorpuselanguageNo(int corpuselanguageNo) {
		this.corpuselanguageNo = corpuselanguageNo;
	}
	public int getLanguageNo() {
		return languageNo;
	}
	public void setLanguageNo(int languageNo) {
		this.languageNo = languageNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	
	public List<CorpuselanguageVO> getUserLanguage() {
		return userLanguage;
	}
	public void setUserLanguage(List<CorpuselanguageVO> userLanguage) {
		this.userLanguage = userLanguage;
	}
	@Override
	public String toString() {
		return "CorpuselanguageVO [corpuselanguageNo=" + corpuselanguageNo + ", languageNo=" + languageNo
				+ ", resumeNo=" + resumeNo + ", userLanguage=" + userLanguage + "]";
	}
	
}
