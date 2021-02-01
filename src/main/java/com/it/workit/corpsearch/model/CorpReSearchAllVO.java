package com.it.workit.corpsearch.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public class CorpReSearchAllVO extends SearchVO {
	private List<Integer> langNo;
	private int lang;

	public int getLang() {
		return lang;
	}

	public void setLang(int lang) {
		this.lang = lang;
	}

	public List<Integer> getLangNo() {
		return langNo;
	}

	public void setLangNo(List<Integer> langNo) {
		this.langNo = langNo;
	}

	@Override
	public String toString() {
		return "CorpReSearchAllVO [langNo=" + langNo + ", lang=" + lang + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	

}
