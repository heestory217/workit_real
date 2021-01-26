package com.it.workit.corp.model;

import com.it.workit.recruit.model.RecruitannounceVO;

public class CorpRecruitViewVO extends RecruitannounceVO{
	private int corpNo;
	private String corpName;
	private String corpIndustry;
	private String corpImgurl;
	public int getCorpNo() {
		return corpNo;
	}
	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getCorpIndustry() {
		return corpIndustry;
	}
	public void setCorpIndustry(String corpIndustry) {
		this.corpIndustry = corpIndustry;
	}
	public String getCorpImgurl() {
		return corpImgurl;
	}
	public void setCorpImgurl(String corpImgurl) {
		this.corpImgurl = corpImgurl;
	}
	
	@Override
	public String toString() {
		return "CorpRecruitViewVO [corpNo=" + corpNo + ", corpName=" + corpName + ", corpIndustry=" + corpIndustry
				+ ", corpImgurl=" + corpImgurl + ", getRecruitannounceNo()=" + getRecruitannounceNo() + ", getUserNo()="
				+ getUserNo() + ", getRecruitannounceTitle()=" + getRecruitannounceTitle()
				+ ", getRecruitannounceStartdate()=" + getRecruitannounceStartdate() + ", getRecruitannounceEnddate()="
				+ getRecruitannounceEnddate() + ", getRecruitannounceScarrer()=" + getRecruitannounceScarrer()
				+ ", getRecruitannounceSworkkind()=" + getRecruitannounceSworkkind() + ", getRecruitannounceSpay()="
				+ getRecruitannounceSpay() + ", getRecruitannounceSkill()=" + getRecruitannounceSkill()
				+ ", getRecruitannounceWorkkind()=" + getRecruitannounceWorkkind() + ", getRecruitannounceWork()=" + getRecruitannounceWork()
				+ ", getRecruitannounceWantedcarrer()=" + getRecruitannounceWantedcarrer()
				+ ", getRecruitannounceUpcheckcarrer()=" + getRecruitannounceUpcheckcarrer()
				+ ", getRecruitannounceHirestep()=" + getRecruitannounceHirestep() + ", getRecruitannounceElse()="
				+ getRecruitannounceElse() + ", getRecruitannounceUpcheck()=" + getRecruitannounceUpcheck()
				+ ", getRecruitannounceEndcheck()=" + getRecruitannounceEndcheck() + ", getRecruitannounceLink()="
				+ getRecruitannounceLink() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}
	
}
