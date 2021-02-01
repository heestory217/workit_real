package com.it.workit.corpsearch.model;

import com.it.workit.common.SearchVO;

public class CorpReSearchAllVO extends SearchVO {
	private String langNo;

	public String getLangNo() {
		return langNo;
	}

	public void setLangNo(String langNo) {
		this.langNo = langNo;
	}

	@Override
	public String toString() {
		return "CorpReSearchAllVO [langNo=" + langNo + ", getSearchCondition()=" + getSearchCondition()
				+ ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()=" + getSearchUseYn()
				+ ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

}
