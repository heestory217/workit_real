package com.it.workit.question.model;

import com.it.workit.common.SearchVO;

public class QstnPagingVO extends SearchVO{
	private int userNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "QstnPagingVO [userNo=" + userNo + "]";
	}
	
	
}
