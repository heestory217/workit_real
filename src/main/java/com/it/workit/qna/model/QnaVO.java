package com.it.workit.qna.model;

import java.sql.Timestamp;

public class QnaVO {
	private int QA_NO; // qna번호
	private int QA_WRITENO;  //작성자번호
	private int QA_WRITEKIND;//분류번호
    private String QA_TITLE;  //제목
	private String QA_ABOUT;  //내용
    private Timestamp QA_DATE;  //작성일
    private int QA_VIEW;  //조회수
    private int QA_GROUPNO; //글묶음번호
    private int QA_ORDERNO; //단계
    private int QA_SORTNO; //소트넘버
    private int QA_DELETECHECK;  //삭제여부
    
    
	public int getQA_NO() {
		return QA_NO;
	}
	public void setQA_NO(int qA_NO) {
		QA_NO = qA_NO;
	}
	public int getQA_WRITENO() {
		return QA_WRITENO;
	}
	public void setQA_WRITENO(int qA_WRITENO) {
		QA_WRITENO = qA_WRITENO;
	}
	public int getQA_WRITEKIND() {
		return QA_WRITEKIND;
	}
	public void setQA_WRITEKIND(int qA_WRITEKIND) {
		QA_WRITEKIND = qA_WRITEKIND;
	}
	public String getQA_TITLE() {
		return QA_TITLE;
	}
	public void setQA_TITLE(String qA_TITLE) {
		QA_TITLE = qA_TITLE;
	}
	public String getQA_ABOUT() {
		return QA_ABOUT;
	}
	public void setQA_ABOUT(String qA_ABOUT) {
		QA_ABOUT = qA_ABOUT;
	}
	public Timestamp getQA_DATE() {
		return QA_DATE;
	}
	public void setQA_DATE(Timestamp qA_DATE) {
		QA_DATE = qA_DATE;
	}
	public int getQA_VIEW() {
		return QA_VIEW;
	}
	public void setQA_VIEW(int qA_VIEW) {
		QA_VIEW = qA_VIEW;
	}
	public int getQA_GROUPNO() {
		return QA_GROUPNO;
	}
	public void setQA_GROUPNO(int qA_GROUPNO) {
		QA_GROUPNO = qA_GROUPNO;
	}
	public int getQA_ORDERNO() {
		return QA_ORDERNO;
	}
	public void setQA_ORDERNO(int qA_ORDERNO) {
		QA_ORDERNO = qA_ORDERNO;
	}
	public int getQA_SORTNO() {
		return QA_SORTNO;
	}
	public void setQA_SORTNO(int qA_SORTNO) {
		QA_SORTNO = qA_SORTNO;
	}
	public int getQA_DELETECHECK() {
		return QA_DELETECHECK;
	}
	public void setQA_DELETECHECK(int qA_DELETECHECK) {
		QA_DELETECHECK = qA_DELETECHECK;
	}
	
	@Override
	public String toString() {
		return "QnaVO [QA_NO=" + QA_NO + ", QA_WRITENO=" + QA_WRITENO + ", QA_WRITEKIND=" + QA_WRITEKIND + ", QA_TITLE="
				+ QA_TITLE + ", QA_ABOUT=" + QA_ABOUT + ", QA_DATE=" + QA_DATE + ", QA_VIEW=" + QA_VIEW
				+ ", QA_GROUPNO=" + QA_GROUPNO + ", QA_ORDERNO=" + QA_ORDERNO + ", QA_SORTNO=" + QA_SORTNO
				+ ", QA_DELETECHECK=" + QA_DELETECHECK + "]";
	}
    
}
