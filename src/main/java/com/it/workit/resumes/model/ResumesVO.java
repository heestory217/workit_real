package com.it.workit.resumes.model;

import java.sql.Timestamp;

public class ResumesVO {
	private int resumeNo;
	private int userNo;
	private String resumeTitle;
	private String resumeSelfintro;
	private Timestamp resumeDate;
	private String resumeFilename;
	private long resumeFilesize;
	private String resumeFileoriginalname;
	private int resumeResumeopencheck;
	
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
				+ ", resumeSelfintro=" + resumeSelfintro + ", resumeDate=" + resumeDate + ", resumeFilename="
				+ resumeFilename + ", resumeFilesize=" + resumeFilesize + ", resumeFileoriginalname="
				+ resumeFileoriginalname + ", resumeResumeopencheck=" + resumeResumeopencheck + "]";
	}
	
	
}
