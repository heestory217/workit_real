package com.it.workit.recruit.model;

public class CorpwantworkVO {
	private int corpwantedareaNo;//시퀀스
	private int workkindNo;//직무
	private int RecruitannounceNo;//공고번호
	
	public int getCorpwantedareaNo() {
		return corpwantedareaNo;
	}
	public void setCorpwantedareaNo(int corpwantedareaNo) {
		this.corpwantedareaNo = corpwantedareaNo;
	}
	public int getWorkkindNo() {
		return workkindNo;
	}
	public void setWorkkindNo(int workkindNo) {
		this.workkindNo = workkindNo;
	}
	public int getRecruitannounceNo() {
		return RecruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		RecruitannounceNo = recruitannounceNo;
	}
	
	@Override
	public String toString() {
		return "corpwantworkVO [corpwantedareaNo=" + corpwantedareaNo + ", workkindNo=" + workkindNo
				+ ", RecruitannounceNo=" + RecruitannounceNo + "]";
	}
}
