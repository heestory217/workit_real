package com.it.workit.question.model;

import com.it.workit.common.SearchVO;

public class QstnPagingVO extends SearchVO{
	private int userNo;
	private int questionNo;

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
		return "QstnPagingVO [userNo=" + userNo + ", questionNo=" + questionNo + "]";
	}
	
	
}
