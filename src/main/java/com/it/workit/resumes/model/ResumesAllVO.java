package com.it.workit.resumes.model;

import java.util.List;

import com.it.workit.corp.model.AreaListView;
import com.it.workit.corp.model.LanguageListView;

public class ResumesAllVO {
	private ResumesVO resumesVo;
	private String userExperience;
	private List<LanguageListView> langList;
	private List<AreaListView> areaList;
	
	public List<AreaListView> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<AreaListView> areaList) {
		this.areaList = areaList;
	}

	public ResumesVO getResumesVo() {
		return resumesVo;
	}

	public void setResumesVo(ResumesVO resumesVo) {
		this.resumesVo = resumesVo;
	}

	public List<LanguageListView> getLangList() {
		return langList;
	}

	public void setLangList(List<LanguageListView> langList) {
		this.langList = langList;
	}
	
	public String getUserExperience() {
		return userExperience;
	}

	public void setUserExperience(String userExperience) {
		this.userExperience = userExperience;
	}

	@Override
	public String toString() {
		return "ResumesAllVO [resumesVo=" + resumesVo + ", userExperience=" + userExperience + ", langList=" + langList
				+ ", areaList=" + areaList + "]";
	}
	
}
