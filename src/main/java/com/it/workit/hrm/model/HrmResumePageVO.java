package com.it.workit.hrm.model;

import com.it.workit.common.SearchVO;

public class HrmResumePageVO extends SearchVO{
	private int userNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "HrmResumePageVO [userNo=" + userNo + ", getUserNo()=" + getUserNo() + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
