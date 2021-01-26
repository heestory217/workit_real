package com.it.workit.corp.model;

import com.it.workit.applicant.model.ApplicantlistVO;

public class AppResumeUserView extends ApplicantlistVO {
	private String resumeTitle;//RESUME_TITLE : 이력서 제목
	private String userExperience;//USER_EXPERIENCE 경력
	
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getUserExperience() {
		return userExperience;
	}
	public void setUserExperience(String userExperience) {
		this.userExperience = userExperience;
	}
	
	@Override
	public String toString() {
		return "AppResumeUserView [resumeTitle=" + resumeTitle + ", userExperience=" + userExperience
				+ ", getApplicantlistNo()=" + getApplicantlistNo() + ", getUserNo()=" + getUserNo() + ", getResumeNo()="
				+ getResumeNo() + ", getRecruitannounceNo()=" + getRecruitannounceNo() + ", getApplicantlistDate()="
				+ getApplicantlistDate() + ", getApplicantlistPapercheck()=" + getApplicantlistPapercheck()
				+ ", getRecruitannounceTitle()=" + getRecruitannounceTitle() + ", getRecruitannounceSworkkind()="
				+ getRecruitannounceSworkkind() + ", getRecruitannounceSpay()=" + getRecruitannounceSpay()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
	
}
