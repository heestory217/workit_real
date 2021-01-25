package com.it.workit.commentRespond.model;

import java.sql.Timestamp;

public class CommentRespondVO {
	private int commentrespondNo;
	private String commentrespondAbout;
    private Timestamp commentrespondDate;
    private int commentrespondLikenum;
    private String commentrespondNicname;
    private int questionNo;            
    private int userNo;
    
	public int getCommentrespondNo() {
		return commentrespondNo;
	}
	public void setCommentrespondNo(int commentrespondNo) {
		this.commentrespondNo = commentrespondNo;
	}
	public String getCommentrespondAbout() {
		return commentrespondAbout;
	}
	public void setCommentrespondAbout(String commentrespondAbout) {
		this.commentrespondAbout = commentrespondAbout;
	}
	public Timestamp getCommentrespondDate() {
		return commentrespondDate;
	}
	public void setCommentrespondDate(Timestamp commentrespondDate) {
		this.commentrespondDate = commentrespondDate;
	}
	public int getCommentrespondLikenum() {
		return commentrespondLikenum;
	}
	public void setCommentrespondLikenum(int commentrespondLikenum) {
		this.commentrespondLikenum = commentrespondLikenum;
	}
	public String getCommentrespondNicname() {
		return commentrespondNicname;
	}
	public void setCommentrespondNicname(String commentrespondNicname) {
		this.commentrespondNicname = commentrespondNicname;
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
		return "CommentRespondVO [commentrespondNo=" + commentrespondNo + ", commentrespondAbout=" + commentrespondAbout
				+ ", commentrespondDate=" + commentrespondDate + ", commentrespondLikenum=" + commentrespondLikenum
				+ ", commentrespondNicname=" + commentrespondNicname + ", questionNo=" + questionNo + ", userNo="
				+ userNo + "]";
	} 
    
}
