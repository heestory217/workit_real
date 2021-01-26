package com.it.workit.qna.model;

import java.sql.Timestamp;

public class QnaVO {
	private int qaNo; // qna번호
	private int qaWriteno;  //작성자번호
	private String qaWriter; //작성자
    private String qaTitle;  //제목
	private String qaAbout;  //내용
	private String qaSecret; //비밀글 설정
	private int qaPassword; //비밀번호
    private Timestamp qaDate;  //작성일
    private int qaView;  //조회수
    private int qaGroupno; //글묶음번호
    private int qaOrderno; //단계
    private int qaSortno; //소트넘버
    private String qaDeletecheck;  //삭제여부
    private int ManagerNo;  //관리자번호
    private int userNo;	//회원번호
    
	public int getQaNo() {
		return qaNo;
	}
	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public int getQaWriteno() {
		return qaWriteno;
	}
	public void setQaWriteno(int qaWriteno) {
		this.qaWriteno = qaWriteno;
	}
	public String getQaWriter() {
		return qaWriter;
	}
	public void setQaWriter(String qaWriter) {
		this.qaWriter = qaWriter;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaAbout() {
		return qaAbout;
	}
	public void setQaAbout(String qaAbout) {
		this.qaAbout = qaAbout;
	}
	public String getQaSecret() {
		return qaSecret;
	}
	public void setQaSecret(String qaSecret) {
		this.qaSecret = qaSecret;
	}
	public int getQaPassword() {
		return qaPassword;
	}
	public void setQaPassword(int qaPassword) {
		this.qaPassword = qaPassword;
	}
	public Timestamp getQaDate() {
		return qaDate;
	}
	public void setQaDate(Timestamp qaDate) {
		this.qaDate = qaDate;
	}
	public int getQaView() {
		return qaView;
	}
	public void setQaView(int qaView) {
		this.qaView = qaView;
	}
	public int getQaGroupno() {
		return qaGroupno;
	}
	public void setQaGroupno(int qaGroupno) {
		this.qaGroupno = qaGroupno;
	}
	public int getQaOrderno() {
		return qaOrderno;
	}
	public void setQaOrderno(int qaOrderno) {
		this.qaOrderno = qaOrderno;
	}
	public int getQaSortno() {
		return qaSortno;
	}
	public void setQaSortno(int qaSortno) {
		this.qaSortno = qaSortno;
	}
	public String getQaDeletecheck() {
		return qaDeletecheck;
	}
	public void setQaDeletecheck(String qaDeletecheck) {
		this.qaDeletecheck = qaDeletecheck;
	}
	public int getManagerNo() {
		return ManagerNo;
	}
	public void setManagerNo(int managerNo) {
		ManagerNo = managerNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qaNo=" + qaNo + ", qaWriteno=" + qaWriteno + ", qaWriter=" + qaWriter + ", qaTitle=" + qaTitle
				+ ", qaAbout=" + qaAbout + ", qaSecret=" + qaSecret + ", qaPassword=" + qaPassword + ", qaDate="
				+ qaDate + ", qaView=" + qaView + ", qaGroupno=" + qaGroupno + ", qaOrderno=" + qaOrderno
				+ ", qaSortno=" + qaSortno + ", qaDeletecheck=" + qaDeletecheck + ", ManagerNo=" + ManagerNo
				+ ", userNo=" + userNo + "]";
	}
    
}
