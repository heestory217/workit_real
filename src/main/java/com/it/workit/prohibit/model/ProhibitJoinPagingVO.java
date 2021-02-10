package com.it.workit.prohibit.model;

import com.it.workit.common.SearchVO;

public class ProhibitJoinPagingVO extends SearchVO{
	private int userCorpNo;

	public int getUserCorpNo() {
		return userCorpNo;
	}

	public void setUserCorpNo(int userCorpNo) {
		this.userCorpNo = userCorpNo;
	}

	@Override
	public String toString() {
		return "ProhibitJoinPagingVO [userCorpNo=" + userCorpNo + ", getUserCorpNo()=" + getUserCorpNo()
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getSearchUseYn()=" + getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage()
				+ ", getBlockSize()=" + getBlockSize() + ", getFirstRecordIndex()=" + getFirstRecordIndex()
				+ ", getLastRecordIndex()=" + getLastRecordIndex() + ", getRecordCountPerPage()="
				+ getRecordCountPerPage() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}
	
}
