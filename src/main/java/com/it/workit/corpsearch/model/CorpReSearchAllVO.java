package com.it.workit.corpsearch.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public class CorpReSearchAllVO extends SearchVO {
	private List<Integer> langNo;
	private int lang;
	private String career;
	private String area1;
	private String area2;


	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}


	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getArea2() {
		return area2;
	}

	public void setArea2(String area2) {
		this.area2 = area2;
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
		return "CorpReSearchAllVO [langNo=" + langNo + ", lang=" + lang + ", career=" + career + ", area1=" + area1
				+ ", area2=" + area2 + ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()="
				+ getSearchKeyword() + ", getSearchUseYn()=" + getSearchUseYn() + ", getCurrentPage()="
				+ getCurrentPage() + ", getBlockSize()=" + getBlockSize() + ", getFirstRecordIndex()="
				+ getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	
}
