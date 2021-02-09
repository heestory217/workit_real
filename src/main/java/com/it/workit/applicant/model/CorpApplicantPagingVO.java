package com.it.workit.applicant.model;

import com.it.workit.common.SearchVO;

public class CorpApplicantPagingVO extends SearchVO{
	private int userNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "CorpApplicantPagingVO [userNo=" + userNo + ", getUserNo()=" + getUserNo() + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
