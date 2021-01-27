package com.it.workit.resumes.model;

import java.util.List;

import com.it.workit.corp.model.LanguageListView;

public class ResumesAllVO {
	private ResumesVO resumesVo;
	
	private List<LanguageListView> langList;

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

	@Override
	public String toString() {
		return "ResumesAllVO [resumesVo=" + resumesVo + ", langList=" + langList + "]";
	}
	
}
