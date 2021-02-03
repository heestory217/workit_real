package com.it.workit.question.model;

public class BookmarkVO {
	private int bookmarkNo;
	private int userNo;     
	private int questionNo;
	
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	
	@Override
	public String toString() {
		return "BookmarkVO [bookmarkNo=" + bookmarkNo + ", userNo=" + userNo + ", questionNo=" + questionNo + "]";
	}

	
}
