package com.it.workit.admin.website;

import java.sql.Timestamp;

public class WebsiteManageVO {
	private int websitemanageNo;	//웹사이트관리번호
	private int managerNo;	//관리자번호 FK
	private String websitemanageKind;	//페이지종류 CHECK IN ('I','T','P','V')
	private String websitemanageTitle;	//제목
	private String websitemanageAbout;	//내용
	private Timestamp websitemanageDate;	//작성일	DEFAULT=SYSDATE
	private int websitemanageVisitor;	//방문자 수 DEFAULT=0
	
	public int getWebsitemanageNo() {
		return websitemanageNo;
	}
	public void setWebsitemanageNo(int websitemanageNo) {
		this.websitemanageNo = websitemanageNo;
	}
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public String getWebsitemanageKind() {
		return websitemanageKind;
	}
	public void setWebsitemanageKind(String websitemanageKind) {
		this.websitemanageKind = websitemanageKind;
	}
	public String getWebsitemanageTitle() {
		return websitemanageTitle;
	}
	public void setWebsitemanageTitle(String websitemanageTitle) {
		this.websitemanageTitle = websitemanageTitle;
	}
	public String getWebsitemanageAbout() {
		return websitemanageAbout;
	}
	public void setWebsitemanageAbout(String websitemanageAbout) {
		this.websitemanageAbout = websitemanageAbout;
	}
	public Timestamp getWebsitemanageDate() {
		return websitemanageDate;
	}
	public void setWebsitemanageDate(Timestamp websitemanageDate) {
		this.websitemanageDate = websitemanageDate;
	}
	public int getWebsitemanageVisitor() {
		return websitemanageVisitor;
	}
	public void setWebsitemanageVisitor(int websitemanageVisitor) {
		this.websitemanageVisitor = websitemanageVisitor;
	}
	
	@Override
	public String toString() {
		return "WebsiteManageVO [websitemanageNo=" + websitemanageNo + ", managerNo=" + managerNo
				+ ", websitemanageKind=" + websitemanageKind + ", websitemanageTitle=" + websitemanageTitle
				+ ", websitemanageAbout=" + websitemanageAbout + ", websitemanageDate=" + websitemanageDate
				+ ", websitemanageVisitor=" + websitemanageVisitor + "]";
	}
	
}
