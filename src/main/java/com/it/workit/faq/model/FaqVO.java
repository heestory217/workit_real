package com.it.workit.faq.model;

import java.sql.Timestamp;

public class FaqVO {
	private int faqNo;  // faq번호,
	private int managerNo; // 관리자번호
	private String faqTitle; // 제목
	private String faqAbout; // 내용
	private int faqView;  // 조회수
	private Timestamp faqDate; //작성일
	
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqAbout() {
		return faqAbout;
	}
	public void setFaqAbout(String faqAbout) {
		this.faqAbout = faqAbout;
	}
	public int getFaqView() {
		return faqView;
	}
	public void setFaqView(int faqView) {
		this.faqView = faqView;
	}
	public Timestamp getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Timestamp faqDate) {
		this.faqDate = faqDate;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", managerNo=" + managerNo + ", faqTitle=" + faqTitle + ", faqAbout="
				+ faqAbout + ", faqView=" + faqView + ", faqDate=" + faqDate + "]";
	}
	
}
