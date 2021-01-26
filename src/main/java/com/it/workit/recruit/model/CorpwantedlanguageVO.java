package com.it.workit.recruit.model;

public class CorpwantedlanguageVO {
	private int corpwantworkNo;//시퀀스
	private int languageNo;//언어
	private int RecruitannounceNo;//공고번호
	
	public int getCorpwantworkNo() {
		return corpwantworkNo;
	}
	public void setCorpwantworkNo(int corpwantworkNo) {
		this.corpwantworkNo = corpwantworkNo;
	}
	public int getLanguageNo() {
		return languageNo;
	}
	public void setLanguageNo(int languageNo) {
		this.languageNo = languageNo;
	}
	public int getRecruitannounceNo() {
		return RecruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		RecruitannounceNo = recruitannounceNo;
	}
	@Override
	public String toString() {
		return "corpwantedlanguageVO [corpwantworkNo=" + corpwantworkNo + ", languageNo=" + languageNo
				+ ", RecruitannounceNo=" + RecruitannounceNo + "]";
	}
}