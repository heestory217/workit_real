package com.it.workit.corp.model;

import java.util.List;

public class CorpAllVO {
	//기업 기본정보
	private CorpVO corpVo;
	
	//기업 이미지들 
	private List<CorpimgVO> cpImgs;

	public CorpVO getCorpVo() {
		return corpVo;
	}

	public void setCorpVo(CorpVO corpVo) {
		this.corpVo = corpVo;
	}

	public List<CorpimgVO> getCpImgs() {
		return cpImgs;
	}

	public void setCpImgs(List<CorpimgVO> cpImgs) {
		this.cpImgs = cpImgs;
	}

	@Override
	public String toString() {
		return "CorpAllVO [corpVo=" + corpVo + ", cpImgs=" + cpImgs + "]";
	}
	
}
