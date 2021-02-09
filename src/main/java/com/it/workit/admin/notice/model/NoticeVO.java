package com.it.workit.admin.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int noticeNo;           
    private String noticeTitle;        
    private String noticeAbout;        
    private Timestamp noticeDate;         
    private int noticeView;
    private String noticeFilename;
    private String noticeFilesize;
    private String noticeOriginalname;
    private int classificationNo;
    private int managerNo;
    
    
    
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeAbout() {
		return noticeAbout;
	}
	public void setNoticeAbout(String noticeAbout) {
		this.noticeAbout = noticeAbout;
	}
	public Timestamp getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeView() {
		return noticeView;
	}
	public void setNoticeView(int noticeView) {
		this.noticeView = noticeView;
	}
	public String getNoticeFilename() {
		return noticeFilename;
	}
	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}
	public String getNoticeFilesize() {
		return noticeFilesize;
	}
	public void setNoticeFilesize(String noticeFilesize) {
		this.noticeFilesize = noticeFilesize;
	}
	public String getNoticeOriginalname() {
		return noticeOriginalname;
	}
	public void setNoticeOriginalname(String noticeOriginalname) {
		this.noticeOriginalname = noticeOriginalname;
	}
	public int getClassificationNo() {
		return classificationNo;
	}
	public void setClassificationNo(int classificationNo) {
		this.classificationNo = classificationNo;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeAbout=" + noticeAbout
				+ ", noticeDate=" + noticeDate + ", noticeView=" + noticeView + ", noticeFilename=" + noticeFilename
				+ ", noticeFilesize=" + noticeFilesize + ", noticeOriginalname=" + noticeOriginalname
				+ ", classificationNo=" + classificationNo + ", managerNo=" + managerNo + "]";
	}
}
