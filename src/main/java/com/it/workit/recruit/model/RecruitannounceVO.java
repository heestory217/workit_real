package com.it.workit.recruit.model;

import java.util.Date;

public class RecruitannounceVO {
	private int recruitannounceNo;//RECRUITANNOUNCE_NO	NUMBER	NOT NULL
	private int userNo;//USER_NO	NUMBER	NOT NULL
	private String recruitannounceTitle;// RECRUITANNOUNCE_TITLE	VARCHAR2(100)	NULL
	private Date recruitannounceStartdate;// RECRUITANNOUNCE_STARTDATE	DATE	NULL
	private Date recruitannounceEnddate;//RECRUITANNOUNCE_ENDDATE	DATE	NOT NULL
	private String recruitannounceScarrer;//RECRUITANNOUNCE_SCARRER	VARCHAR2(100)	NULL
	private String recruitannounceSworkkind;//RECRUITANNOUNCE_SWORKKIND	VARCHAR2(100)	NOT NULL
	private String recruitannounceSpay;//RECRUITANNOUNCE_SPAY	VARCHAR2(100)	NULL
	private String recruitannounceSkill;//RECRUITANNOUNCE_SKILL	VARCHAR2(100)	NOT NULL
	private String recruitannounceWorkkind;//RECRUITANNOUNCE_WORKKIND	CLOB	NOT NULL
	private String recruitannounceCorpintro;//RECRUITANNOUNCE_CORPINTRO	CLOB	NULL
	private String recruitannounceWork;//RECRUITANNOUNCE_WORK	CLOB	NULL
	private String recruitannounceWantedcarrer;//RECRUITANNOUNCE_WANTEDCARRER	CLOB	NOT NULL
	private String recruitannounceUpcheckcarrer;//RECRUITANNOUNCE_UPCHECKCARRER	CLOB	NULL
	private String recruitannounceHirestep;//	CLOB	NULL
	private String recruitannounceElse;//RECRUITANNOUNCE_ELSE	CLOB	NULL
	private int recruitannounceUpcheck;//RECRUITANNOUNCE_UPCHECK	NUMBER	NOT NULL
	private int recruitannounceEndcheck;//RECRUITANNOUNCE_ENDCHECK	NUMBER	NOT NULL
	private String recruitannounceLink;//RECRUITANNOUNCE_LINK	VARCHAR2(200)	NULL
	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getRecruitannounceTitle() {
		return recruitannounceTitle;
	}
	public void setRecruitannounceTitle(String recruitannounceTitle) {
		this.recruitannounceTitle = recruitannounceTitle;
	}
	public Date getRecruitannounceStartdate() {
		return recruitannounceStartdate;
	}
	public void setRecruitannounceStartdate(Date recruitannounceStartdate) {
		this.recruitannounceStartdate = recruitannounceStartdate;
	}
	public Date getRecruitannounceEnddate() {
		return recruitannounceEnddate;
	}
	public void setRecruitannounceEnddate(Date recruitannounceEnddate) {
		this.recruitannounceEnddate = recruitannounceEnddate;
	}
	public String getRecruitannounceScarrer() {
		return recruitannounceScarrer;
	}
	public void setRecruitannounceScarrer(String recruitannounceScarrer) {
		this.recruitannounceScarrer = recruitannounceScarrer;
	}
	public String getRecruitannounceSworkkind() {
		return recruitannounceSworkkind;
	}
	public void setRecruitannounceSworkkind(String recruitannounceSworkkind) {
		this.recruitannounceSworkkind = recruitannounceSworkkind;
	}
	public String getRecruitannounceSpay() {
		return recruitannounceSpay;
	}
	public void setRecruitannounceSpay(String recruitannounceSpay) {
		this.recruitannounceSpay = recruitannounceSpay;
	}
	public String getRecruitannounceSkill() {
		return recruitannounceSkill;
	}
	public void setRecruitannounceSkill(String recruitannounceSkill) {
		this.recruitannounceSkill = recruitannounceSkill;
	}
	public String getRecruitannounceWorkkind() {
		return recruitannounceWorkkind;
	}
	public void setRecruitannounceWorkkind(String recruitannounceWorkkind) {
		this.recruitannounceWorkkind = recruitannounceWorkkind;
	}
	public String getRecruitannounceCorpintro() {
		return recruitannounceCorpintro;
	}
	public void setRecruitannounceCorpintro(String recruitannounceCorpintro) {
		this.recruitannounceCorpintro = recruitannounceCorpintro;
	}
	public String getRecruitannounceWork() {
		return recruitannounceWork;
	}
	public void setRecruitannounceWork(String recruitannounceWork) {
		this.recruitannounceWork = recruitannounceWork;
	}
	public String getRecruitannounceWantedcarrer() {
		return recruitannounceWantedcarrer;
	}
	public void setRecruitannounceWantedcarrer(String recruitannounceWantedcarrer) {
		this.recruitannounceWantedcarrer = recruitannounceWantedcarrer;
	}
	public String getRecruitannounceUpcheckcarrer() {
		return recruitannounceUpcheckcarrer;
	}
	public void setRecruitannounceUpcheckcarrer(String recruitannounceUpcheckcarrer) {
		this.recruitannounceUpcheckcarrer = recruitannounceUpcheckcarrer;
	}
	public String getRecruitannounceHirestep() {
		return recruitannounceHirestep;
	}
	public void setRecruitannounceHirestep(String recruitannounceHirestep) {
		this.recruitannounceHirestep = recruitannounceHirestep;
	}
	public String getRecruitannounceElse() {
		return recruitannounceElse;
	}
	public void setRecruitannounceElse(String recruitannounceElse) {
		this.recruitannounceElse = recruitannounceElse;
	}
	public int getRecruitannounceUpcheck() {
		return recruitannounceUpcheck;
	}
	public void setRecruitannounceUpcheck(int recruitannounceUpcheck) {
		this.recruitannounceUpcheck = recruitannounceUpcheck;
	}
	public int getRecruitannounceEndcheck() {
		return recruitannounceEndcheck;
	}
	public void setRecruitannounceEndcheck(int recruitannounceEndcheck) {
		this.recruitannounceEndcheck = recruitannounceEndcheck;
	}
	public String getRecruitannounceLink() {
		return recruitannounceLink;
	}
	public void setRecruitannounceLink(String recruitannounceLink) {
		this.recruitannounceLink = recruitannounceLink;
	}
	@Override
	public String toString() {
		return "RecruitannounceVO [recruitannounceNo=" + recruitannounceNo + ", userNo=" + userNo
				+ ", recruitannounceTitle=" + recruitannounceTitle + ", recruitannounceStartdate="
				+ recruitannounceStartdate + ", recruitannounceEnddate=" + recruitannounceEnddate
				+ ", recruitannounceScarrer=" + recruitannounceScarrer + ", recruitannounceSworkkind="
				+ recruitannounceSworkkind + ", recruitannounceSpay=" + recruitannounceSpay + ", recruitannounceSkill="
				+ recruitannounceSkill + ", recruitannounceWorkkind=" + recruitannounceWorkkind
				+ ", recruitannounceCorpintro=" + recruitannounceCorpintro + ", recruitannounceWork="
				+ recruitannounceWork + ", recruitannounceWantedcarrer=" + recruitannounceWantedcarrer
				+ ", recruitannounceUpcheckcarrer=" + recruitannounceUpcheckcarrer + ", recruitannounceHirestep="
				+ recruitannounceHirestep + ", recruitannounceElse=" + recruitannounceElse + ", recruitannounceUpcheck="
				+ recruitannounceUpcheck + ", recruitannounceEndcheck=" + recruitannounceEndcheck
				+ ", recruitannounceLink=" + recruitannounceLink + "]";
	}
	
}
