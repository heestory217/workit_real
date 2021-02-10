package com.it.workit.applicant.model;

import com.it.workit.common.SearchVO;

public class CorpApplicantPagingVO extends SearchVO{
	private int userNo;
	private int recruitannounceNo;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}

	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}

	@Override
	public String toString() {
		return "CorpApplicantPagingVO [userNo=" + userNo + ", recruitannounceNo=" + recruitannounceNo + ", getUserNo()="
				+ getUserNo() + ", getRecruitannounceNo()=" + getRecruitannounceNo() + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
