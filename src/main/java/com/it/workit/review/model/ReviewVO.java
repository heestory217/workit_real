package com.it.workit.review.model;

import java.sql.Timestamp;

public class ReviewVO {
	private int corpreviewNo; //리뷰 번호	CORPREVIEW_NO	NUMBER	NOT NULL	PK
	private int userNo;//회원 번호	USER_NO	NUMBER	NOT NULL			FK
	private int corpNo;//기업 정보 번호	CORP_NO	NUMBER	NOT NULL			FK
	private Timestamp corpreviewDate;//작성일	CORPREVIEW_DATE	DATE	NULL	DEFAULT=SYSDATE		
	private String corpreviewOneline;//한 줄 평가	CORPREVIEW_ONELINE	VARCHAR2(100)	NOT NULL			
	private String corpreviewGood;//장점	CORPREVIEW_GOOD	VARCHAR2(500)	NOT NULL			
	private String corpreviewBad;//단점	CORPREVIEW_BAD	VARCHAR2(500)	NOT NULL			
	private String corpreviewWant;//바라는 점	CORPREVIEW_WANT	VARCHAR2(500)	NOT NULL			
	private int corpreviewRate;//기업 점수	CORPREVIEW_RATE	NUMBER	NULL			
	private int corpreviewDeletecheck;//삭제 여부	CORPREVIEW_DELETECHECK	NUMBER	NULL
	
	public int getCorpreviewNo() {
		return corpreviewNo;
	}
	public void setCorpreviewNo(int corpreviewNo) {
		this.corpreviewNo = corpreviewNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCorpNo() {
		return corpNo;
	}
	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}
	public Timestamp getCorpreviewDate() {
		return corpreviewDate;
	}
	public void setCorpreviewDate(Timestamp corpreviewDate) {
		this.corpreviewDate = corpreviewDate;
	}
	public String getCorpreviewOneline() {
		return corpreviewOneline;
	}
	public void setCorpreviewOneline(String corpreviewOneline) {
		this.corpreviewOneline = corpreviewOneline;
	}
	public String getCorpreviewGood() {
		return corpreviewGood;
	}
	public void setCorpreviewGood(String corpreviewGood) {
		this.corpreviewGood = corpreviewGood;
	}
	public String getCorpreviewBad() {
		return corpreviewBad;
	}
	public void setCorpreviewBad(String corpreviewBad) {
		this.corpreviewBad = corpreviewBad;
	}
	public String getCorpreviewWant() {
		return corpreviewWant;
	}
	public void setCorpreviewWant(String corpreviewWant) {
		this.corpreviewWant = corpreviewWant;
	}
	public int getCorpreviewRate() {
		return corpreviewRate;
	}
	public void setCorpreviewRate(int corpreviewRate) {
		this.corpreviewRate = corpreviewRate;
	}
	public int getCorpreviewDeletecheck() {
		return corpreviewDeletecheck;
	}
	public void setCorpreviewDeletecheck(int corpreviewDeletecheck) {
		this.corpreviewDeletecheck = corpreviewDeletecheck;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [corpreviewNo=" + corpreviewNo + ", userNo=" + userNo + ", corpNo=" + corpNo
				+ ", corpreviewDate=" + corpreviewDate + ", corpreviewOneline=" + corpreviewOneline
				+ ", corpreviewGood=" + corpreviewGood + ", corpreviewBad=" + corpreviewBad + ", corpreviewWant="
				+ corpreviewWant + ", corpreviewRate=" + corpreviewRate + ", corpreviewDeletecheck="
				+ corpreviewDeletecheck + "]";
	}
	
}
