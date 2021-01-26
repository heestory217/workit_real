package com.it.workit.corp.model;

import java.util.List;

public class AppResumeUserAllVO {
	private AppResumeUserView appReUsView;
	private List<AreaListView> areaList;
	private List<LanguageListView> languageList;
	
	public AppResumeUserView getAppReUsView() {
		return appReUsView;
	}
	public void setAppReUsView(AppResumeUserView appReUsView) {
		this.appReUsView = appReUsView;
	}
	public List<AreaListView> getAreaList() {
		return areaList;
	}
	public void setAreaList(List<AreaListView> areaList) {
		this.areaList = areaList;
	}
	public List<LanguageListView> getLanguageList() {
		return languageList;
	}
	public void setLanguageList(List<LanguageListView> languageList) {
		this.languageList = languageList;
	}
	
}
