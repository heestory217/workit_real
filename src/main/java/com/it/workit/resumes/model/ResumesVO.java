package com.it.workit.resumes.model;

import java.sql.Timestamp;

public class ResumesVO {
	private int resumeNo; //이력서 번호
	private int userNo; //회원 번호
	private String resumeTitle; //제목
	private String resumeFinaleducation; //최종학력
	private String resumeSelfintro;	//자기소개
	private Timestamp resumeDate; //등록일자
	private String resumeFilename; //파일이름
	private long resumeFilesize; //파일사이즈
	private String resumeFileoriginalname; //파일 오리지날 이름
	private int resumeResumeopencheck; //이력서 승인 여부
	
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getResumeFinaleducation() {
		return resumeFinaleducation;
	}
	public void setResumeFinaleducation(String resumeFinaleducation) {
		this.resumeFinaleducation = resumeFinaleducation;
	}
	public String getResumeSelfintro() {
		return resumeSelfintro;
	}
	public void setResumeSelfintro(String resumeSelfintro) {
		this.resumeSelfintro = resumeSelfintro;
	}
	public Timestamp getResumeDate() {
		return resumeDate;
	}
	public void setResumeDate(Timestamp resumeDate) {
		this.resumeDate = resumeDate;
	}
	public String getResumeFilename() {
		return resumeFilename;
	}
	public void setResumeFilename(String resumeFilename) {
		this.resumeFilename = resumeFilename;
	}
	public long getResumeFilesize() {
		return resumeFilesize;
	}
	public void setResumeFilesize(long resumeFilesize) {
		this.resumeFilesize = resumeFilesize;
	}
	public String getResumeFileoriginalname() {
		return resumeFileoriginalname;
	}
	public void setResumeFileoriginalname(String resumeFileoriginalname) {
		this.resumeFileoriginalname = resumeFileoriginalname;
	}
	public int getResumeResumeopencheck() {
		return resumeResumeopencheck;
	}
	public void setResumeResumeopencheck(int resumeResumeopencheck) {
		this.resumeResumeopencheck = resumeResumeopencheck;
	}
	@Override
	public String toString() {
		return "ResumesVO [resumeNo=" + resumeNo + ", userNo=" + userNo + ", resumeTitle=" + resumeTitle
				+ ", resumeFinaleducation=" + resumeFinaleducation + ", resumeSelfintro=" + resumeSelfintro
				+ ", resumeDate=" + resumeDate + ", resumeFilename=" + resumeFilename + ", resumeFilesize="
				+ resumeFilesize + ", resumeFileoriginalname=" + resumeFileoriginalname + ", resumeResumeopencheck="
				+ resumeResumeopencheck + "]";
	}
	
	
}
