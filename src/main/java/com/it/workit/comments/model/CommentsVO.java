package com.it.workit.comments.model;

import java.sql.Timestamp;

public class CommentsVO {
	private int commentNo;
    private String commentAbout;
    private Timestamp commentDate;
    private int commentGroupno;
    private int commentSortno;
    private int commentStepno;
    private int commentDeletecheck;
    private String commentNicname;
    private int commentrespondNo;
    private int questionNo;
    private int userNo;
    
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentAbout() {
		return commentAbout;
	}
	public void setCommentAbout(String commentAbout) {
		this.commentAbout = commentAbout;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public int getCommentGroupno() {
		return commentGroupno;
	}
	public void setCommentGroupno(int commentGroupno) {
		this.commentGroupno = commentGroupno;
	}
	public int getCommentSortno() {
		return commentSortno;
	}
	public void setCommentSortno(int commentSortno) {
		this.commentSortno = commentSortno;
	}
	public int getCommentStepno() {
		return commentStepno;
	}
	public void setCommentStepno(int commentStepno) {
		this.commentStepno = commentStepno;
	}
	public int getCommentDeletecheck() {
		return commentDeletecheck;
	}
	public void setCommentDeletecheck(int commentDeletecheck) {
		this.commentDeletecheck = commentDeletecheck;
	}
	public String getCommentNicname() {
		return commentNicname;
	}
	public void setCommentNicname(String commentNicname) {
		this.commentNicname = commentNicname;
	}
	public int getCommentrespondNo() {
		return commentrespondNo;
	}
	public void setCommentrespondNo(int commentrespondNo) {
		this.commentrespondNo = commentrespondNo;
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
	
	@Override
	public String toString() {
		return "CommentsVO [commentNo=" + commentNo + ", commentAbout=" + commentAbout + ", commentDate=" + commentDate
				+ ", commentGroupno=" + commentGroupno + ", commentSortno=" + commentSortno + ", commentStepno="
				+ commentStepno + ", commentDeletecheck=" + commentDeletecheck + ", commentNicname=" + commentNicname
				+ ", commentrespondNo=" + commentrespondNo + ", questionNo=" + questionNo + ", userNo=" + userNo + "]";
	}
    
    
}
