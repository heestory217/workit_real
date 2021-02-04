package com.it.workit.corp.model;

import java.util.List;

public class CorpAllVo{
	private CorpVO corpVo;
	private List<CorpimgVO> corpImgList;
	
	public CorpVO getCorpVo() {
		return corpVo;
	}
	public void setCorpVo(CorpVO corpVo) {
		this.corpVo = corpVo;
	}
	public List<CorpimgVO> getCorpImgList() {
		return corpImgList;
	}
	public void setCorpImgList(List<CorpimgVO> corpImgList) {
		this.corpImgList = corpImgList;
	}
	
	@Override
	public String toString() {
		return "CorpAllVo [corpVo=" + corpVo + ", corpImgList=" + corpImgList + "]";
	}
}
