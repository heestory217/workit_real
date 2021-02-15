package com.it.workit.faq.model;

import java.util.List;

public class FaqListVo {
	private List<FaqVO> flist;

	public List<FaqVO> getFlist() {
		return flist;
	}

	public void setFlist(List<FaqVO> flist) {
		this.flist = flist;
	}

	@Override
	public String toString() {
		return "FaqListVo [flist=" + flist + "]";
	}
	
}
