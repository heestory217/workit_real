package com.it.workit.admin.notice.model;

import com.it.workit.common.SearchVO;

public class NoticeSearchVO extends SearchVO{
	private int classificationNo;
	
	public int getClassificationNo() {
		return classificationNo;
	}

	public void setClassificationNo(int classificationNo) {
		this.classificationNo = classificationNo;
	}

	@Override
	public String toString() {
		return "NoticeSearchVO [classificationNo=" + classificationNo + "]";
	}

	
	
}
