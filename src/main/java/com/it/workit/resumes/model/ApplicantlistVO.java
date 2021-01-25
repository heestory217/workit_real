package com.it.workit.resumes.model;

import java.sql.Timestamp;

public class ApplicantlistVO {
	private int applicantlistNo;//	지원자 번호	 NUMBER	NOT NULL			PK
	private int userNo; //회원 번호	NUMBER	NULL			FK
	private String resumeNo;//이력서 번호		VARCHAR2(200)	NULL			FK
	private int recruitannounceNo;//채용 공고번호	NUMBER	NULL			FK
	private Timestamp applicantlistDate;//지원일	DATE	NULL	DEFAULT=SYSDATE		
	private int applicantlistPapercheck;//서류 통과 여부	NUMBER	NULL	DEFAULT=3	CHECK IN(1,2,3)
	public int getApplicantlistNo() {
		return applicantlistNo;
	}
	public void setApplicantlistNo(int applicantlistNo) {
		this.applicantlistNo = applicantlistNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(String resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getRecruitannounceNo() {
		return recruitannounceNo;
	}
	public void setRecruitannounceNo(int recruitannounceNo) {
		this.recruitannounceNo = recruitannounceNo;
	}
	public Timestamp getApplicantlistDate() {
		return applicantlistDate;
	}
	public void setApplicantlistDate(Timestamp applicantlistDate) {
		this.applicantlistDate = applicantlistDate;
	}
	public int getApplicantlistPapercheck() {
		return applicantlistPapercheck;
	}
	public void setApplicantlistPapercheck(int applicantlistPapercheck) {
		this.applicantlistPapercheck = applicantlistPapercheck;
	}
	@Override
	public String toString() {
		return "ApplicantlistVO [applicantlistNo=" + applicantlistNo + ", userNo=" + userNo + ", resumeNo=" + resumeNo
				+ ", recruitannounceNo=" + recruitannounceNo + ", applicantlistDate=" + applicantlistDate
				+ ", applicantlistPapercheck=" + applicantlistPapercheck + "]";
	}
	
	
}
