package com.it.workit.resumes.model;

import java.util.List;

public class LicencseVO {
	private int licencseNo; 
	private int resumeNo;
	private String licencseName; //자격증
	private String licencseIssueplace; //발행처
	
	private List<LicencseVO> LicenVOList;
	
	public int getLicencseNo() {
		return licencseNo;
	}
	public void setLicencseNo(int licencseNo) {
		this.licencseNo = licencseNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getLicencseName() {
		return licencseName;
	}
	public void setLicencseName(String licencseName) {
		this.licencseName = licencseName;
	}
	public String getLicencseIssueplace() {
		return licencseIssueplace;
	}
	public void setLicencseIssueplace(String licencseIssueplace) {
		this.licencseIssueplace = licencseIssueplace;
	}
	
	public List<LicencseVO> getLicenVOList() {
		return LicenVOList;
	}
	public void setLicenVOList(List<LicencseVO> licenVOList) {
		LicenVOList = licenVOList;
	}
	
	@Override
	public String toString() {
		return "LicencseVO [licencseNo=" + licencseNo + ", resumeNo=" + resumeNo + ", licencseName=" + licencseName
				+ ", licencseIssueplace=" + licencseIssueplace + ", LicenVOList=" + LicenVOList + "]";
	}
	
}
