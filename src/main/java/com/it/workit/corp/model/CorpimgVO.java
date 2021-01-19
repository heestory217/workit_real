package com.it.workit.corp.model;

import org.springframework.stereotype.Component;

@Component
public class CorpimgVO {
	private int corpimgNo; //이미지 번호	CORPIMG_NO	NUMBER	NOT NULL			PK
	private int corpNo;//기업 정보 번호	CORP_NO	NUMBER	NOT NULL			FK
	private String corpimgUrl;//이미지 URL	CORPIMG_URL	VARCHAR2(300)	NOT NULL
	
	public int getCorpimgNo() {
		return corpimgNo;
	}
	public void setCorpimgNo(int corpimgNo) {
		this.corpimgNo = corpimgNo;
	}
	public int getCorpNo() {
		return corpNo;
	}
	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}
	public String getCorpimgUrl() {
		return corpimgUrl;
	}
	public void setCorpimgUrl(String corpimgUrl) {
		this.corpimgUrl = corpimgUrl;
	}
	@Override
	public String toString() {
		return "CorpimgVO [corpimgNo=" + corpimgNo + ", corpNo=" + corpNo + ", corpimgUrl=" + corpimgUrl + "]";
	}
	
}
