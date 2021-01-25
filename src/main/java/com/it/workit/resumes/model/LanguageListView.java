package com.it.workit.resumes.model;

public class LanguageListView {
	private int resumeNo;
	private int languageNo;
	private String languageName;
	
	
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getLanguageNo() {
		return languageNo;
	}
	public void setLanguageNo(int languageNo) {
		this.languageNo = languageNo;
	}
	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
	@Override
	public String toString() {
		return "LanguageListView [resumeNo=" + resumeNo + ", languageNo=" + languageNo + ", languageName="
				+ languageName + "]";
	}
	
}
