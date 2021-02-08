package com.it.workit.applicant.model;

import java.sql.Timestamp;

public class ApplicantlistVO {
	private int applicantlistNo;	//지원자번호
	private int userNo;		//회원번호
	private int resumeNo;	//이력서번호
	private int recruitannounceNo;	//전체공고번호
	private Timestamp applicantlistDate;	//지원날짜
	private int applicantlistPapercheck;	//서류통과여부 (1통과 2탈락 3대기)
	
	// 기업 지원자 목록 처리
	private int applyFlag;	//지원여부 (1지원 2지원취소)
	private int resumeReadflag;	//기업이 지원이력서 읽음 여부 (1열람 2미열람)
	
	//개인 마이페이지 - join 한 결과를 위한 변수 생성
	private String recruitannounceTitle;
	private String recruitannounceSworkkind;
	private String recruitannounceSpay;
	
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
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
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
	
	public String getRecruitannounceTitle() {
		return recruitannounceTitle;
	}
	public void setRecruitannounceTitle(String recruitannounceTitle) {
		this.recruitannounceTitle = recruitannounceTitle;
	}
	public String getRecruitannounceSworkkind() {
		return recruitannounceSworkkind;
	}
	public void setRecruitannounceSworkkind(String recruitannounceSworkkind) {
		this.recruitannounceSworkkind = recruitannounceSworkkind;
	}
	public String getRecruitannounceSpay() {
		return recruitannounceSpay;
	}
	public void setRecruitannounceSpay(String recruitannounceSpay) {
		this.recruitannounceSpay = recruitannounceSpay;
	}
	@Override
	public String toString() {
		return "ApplicantlistVO [applicantlistNo=" + applicantlistNo + ", userNo=" + userNo + ", resumeNo=" + resumeNo
				+ ", recruitannounceNo=" + recruitannounceNo + ", applicantlistDate=" + applicantlistDate
				+ ", applicantlistPapercheck=" + applicantlistPapercheck + ", recruitannounceTitle="
				+ recruitannounceTitle + ", recruitannounceSworkkind=" + recruitannounceSworkkind
				+ ", recruitannounceSpay=" + recruitannounceSpay + "]";
	}
	
	
}
