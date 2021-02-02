package com.it.workit.resumes.model;

import java.util.List;

public class ForeignlanguageskillVO {
	private int foreignlanguageskillNo;
	private int resumeNo;
	private String foreignlanguageskillLang; //언어
	private String foreignlanguageskillExpert; //수준
	
	private List<ForeignlanguageskillVO> ForeignskillVO;
	
	public int getForeignlanguageskillNo() {
		return foreignlanguageskillNo;
	}
	public void setForeignlanguageskillNo(int foreignlanguageskillNo) {
		this.foreignlanguageskillNo = foreignlanguageskillNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getForeignlanguageskillLang() {
		return foreignlanguageskillLang;
	}
	public void setForeignlanguageskillLang(String foreignlanguageskillLang) {
		this.foreignlanguageskillLang = foreignlanguageskillLang;
	}
	public String getForeignlanguageskillExpert() {
		return foreignlanguageskillExpert;
	}
	public void setForeignlanguageskillExpert(String foreignlanguageskillExpert) {
		this.foreignlanguageskillExpert = foreignlanguageskillExpert;
	}
	
	public List<ForeignlanguageskillVO> getForeignskillVO() {
		return ForeignskillVO;
	}
	public void setForeignskillVO(List<ForeignlanguageskillVO> foreignskillVO) {
		ForeignskillVO = foreignskillVO;
	}
	
	@Override
	public String toString() {
		return "ForeignlanguageskillVO [foreignlanguageskillNo=" + foreignlanguageskillNo + ", resumeNo=" + resumeNo
				+ ", foreignlanguageskillLang=" + foreignlanguageskillLang + ", foreignlanguageskillExpert="
				+ foreignlanguageskillExpert + ", ForeignskillVO=" + ForeignskillVO + "]";
	}
	
}
