package com.it.workit.question.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public class QstnPagingVO extends SearchVO{
	private int userNo;
	private int questionNo;
	private int questionImmsave;
	private int commentCnt;


	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public int getQuestionImmsave() {
		return questionImmsave;
	}

	public void setQuestionImmsave(int questionImmsave) {
		this.questionImmsave = questionImmsave;
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
		return "QstnPagingVO [userNo=" + userNo + ", questionNo=" + questionNo + ", questionImmsave=" + questionImmsave
				+ "]";
	}
	
	
}
