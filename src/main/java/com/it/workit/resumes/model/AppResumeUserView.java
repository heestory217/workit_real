package com.it.workit.resumes.model;

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
		return "AppResumeUserView [resumeTitle=" + resumeTitle + ", userExperience=" + userExperience + "]";
	}
	
	
	
}
