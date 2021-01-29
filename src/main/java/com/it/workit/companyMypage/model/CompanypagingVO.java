package com.it.workit.companyMypage.model;

import com.it.workit.common.SearchVO;

// 은별님 내용 복붙 => 필요 시 수정해서 쓰세요
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

