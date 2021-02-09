package com.it.workit.corpsearch.model;

public class MatchSearchVO {
	private int areaNo;
	private int langNo;
	private int year;
	private int buyChk;
	
	public int getBuyChk() {
		return buyChk;
	}
	public void setBuyChk(int buyChk) {
		this.buyChk = buyChk;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public int getLangNo() {
		return langNo;
	}
	public void setLangNo(int langNo) {
		this.langNo = langNo;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	@Override
	public String toString() {
		return "MatchSearchVO [areaNo=" + areaNo + ", langNo=" + langNo + ", year=" + year + ", buyChk=" + buyChk + "]";
	}

}
