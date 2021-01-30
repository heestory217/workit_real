package com.it.workit.indivsearch.model;
import com.it.workit.recruit.model.RecruitannounceVO;

public class IndivKeywordSearchVO extends RecruitannounceVO{
	private String corpName;	//회사명
	private String corpImgurl;	//회사이미지url
	private String languageName;	//언어이름
	private String workkindName;	//직무이름
	private String areaAdd1;	//ex 서울
	private String areaAdd2;	//ex 중랑구
	
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getCorpImgurl() {
		return corpImgurl;
	}
	public void setCorpImgurl(String corpImgurl) {
		this.corpImgurl = corpImgurl;
	}
	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
	public String getWorkkindName() {
		return workkindName;
	}
	public void setWorkkindName(String workkindName) {
		this.workkindName = workkindName;
	}
	
	public String getAreaAdd1() {
		return areaAdd1;
	}
	public void setAreaAdd1(String areaAdd1) {
		this.areaAdd1 = areaAdd1;
	}
	public String getAreaAdd2() {
		return areaAdd2;
	}
	public void setAreaAdd2(String areaAdd2) {
		this.areaAdd2 = areaAdd2;
	}
	@Override
	public String toString() {
		return "IndivKeywordSearchVO [corpName=" + corpName + ", corpImgurl=" + corpImgurl + ", languageName="
				+ languageName + ", workkindName=" + workkindName + ", areaAdd1=" + areaAdd1 + ", areaAdd2=" + areaAdd2
				+ "]";
	}
	
}
