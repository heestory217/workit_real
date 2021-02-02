package com.it.workit.companyMypage.model;

import com.it.workit.common.SearchVO;

public class CompanypagingVO extends SearchVO{
	private int userNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "IndivPagingVO [userNo=" + userNo + "]";
	}
}