package com.it.workit.corpsearch.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public class CorpReSearchAllVO extends SearchVO {
	private List<Integer> langNo;
	private int lang;
	private String career;
	private String area;


	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

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
		return "CorpReSearchAllVO [langNo=" + langNo + ", lang=" + lang + ", career=" + career + ", area=" + area
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getSearchUseYn()=" + getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage()
				+ ", getBlockSize()=" + getBlockSize() + ", getFirstRecordIndex()=" + getFirstRecordIndex()
				+ ", getLastRecordIndex()=" + getLastRecordIndex() + ", getRecordCountPerPage()="
				+ getRecordCountPerPage() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}

}
