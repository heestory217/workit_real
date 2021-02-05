package com.it.workit.question.model;

import java.sql.Timestamp;

public class QuestionVO {
	private int questionNo;
    private int userNo;           
    private int workkindNo;       
    private String questionTitle;
    private String questionAbout;    
    private int questionView;     
    private Timestamp questionDate;  
    private int questionImmsave;
    private int questionBookmark; 
    private String questionNicname;
    private int commentCount;
    
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getWorkkindNo() {
		return workkindNo;
	}
	public void setWorkkindNo(int workkindNo) {
		this.workkindNo = workkindNo;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionAbout() {
		return questionAbout;
	}
	public void setQuestionAbout(String questionAbout) {
		this.questionAbout = questionAbout;
	}
	public int getQuestionView() {
		return questionView;
	}
	public void setQuestionView(int questionView) {
		this.questionView = questionView;
	}
	public Timestamp getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Timestamp questionDate) {
		this.questionDate = questionDate;
	}
	public int getQuestionImmsave() {
		return questionImmsave;
	}
	public void setQuestionImmsave(int questionImmsave) {
		this.questionImmsave = questionImmsave;
	}
	public int getQuestionBookmark() {
		return questionBookmark;
	}
	public void setQuestionBookmark(int questionBookmark) {
		this.questionBookmark = questionBookmark;
	}
	public String getQuestionNicname() {
		return questionNicname;
	}
	public void setQuestionNicname(String questionNicname) {
		this.questionNicname = questionNicname;
	}
	
	@Override
	public String toString() {
		return "QuestionVO [questionNo=" + questionNo + ", userNo=" + userNo + ", workkindNo=" + workkindNo
				+ ", questionTitle=" + questionTitle + ", questionAbout=" + questionAbout + ", questionView="
				+ questionView + ", questionDate=" + questionDate + ", questionImmsave=" + questionImmsave
				+ ", questionBookmark=" + questionBookmark + ", questionNicname=" + questionNicname + ", commentCount="
				+ commentCount + "]";
	}
    
    
}
