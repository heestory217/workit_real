package com.it.workit.corp.model;

import java.util.List;

public class CorpAllVO {
	//기업 기본정보
	private CorpVO corpVo;
	
	//기업 이미지들 1:N관계 collection 엘리먼트 이용
	private List<CorpimgVO> cpImgsList;

	public CorpVO getCorpVo() {
		return corpVo;
	}

	public void setCorpVo(CorpVO corpVo) {
		this.corpVo = corpVo;
	}

	public List<CorpimgVO> getCpImgs() {
		return cpImgsList;
	}

	public void setCpImgs(List<CorpimgVO> cpImgsList) {
		this.cpImgsList = cpImgsList;
	}

	@Override
	public String toString() {
		return "CorpAllVO [corpVo=" + corpVo + ", cpImgsList=" + cpImgsList + "]";
	}
	
}
