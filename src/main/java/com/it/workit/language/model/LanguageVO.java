package com.it.workit.language.model;

public class LanguageVO {
	private int languageNo;
	private String languageName;
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
		return "LanguageVO [languageNo=" + languageNo + ", languageName=" + languageName + "]";
	}
	
	
}
