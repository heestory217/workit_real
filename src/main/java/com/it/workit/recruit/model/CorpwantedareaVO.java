package com.it.workit.recruit.model;

public class CorpwantedareaVO {
	private int corpwantedareaNo;//시퀀스
	private int areaNo;//직무
	private int RecruitannounceNo;//공고번호
	public int getCorpwantedareaNo() {
		return corpwantedareaNo;
	}
	public void setCorpwantedareaNo(int corpwantedareaNo) {
		this.corpwantedareaNo = corpwantedareaNo;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public int getRecruitannounceNo() {
		return RecruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		RecruitannounceNo = recruitannounceNo;
	}
	@Override
	public String toString() {
		return "corpwantedareaVO [corpwantedareaNo=" + corpwantedareaNo + ", areaNo=" + areaNo + ", RecruitannounceNo="
				+ RecruitannounceNo + "]";
	}
}