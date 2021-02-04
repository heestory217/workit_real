package com.it.workit.indivMypage.model;

import com.it.workit.common.SearchVO;

public class IndivpagingVO extends SearchVO{
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