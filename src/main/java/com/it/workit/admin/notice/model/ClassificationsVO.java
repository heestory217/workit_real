package com.it.workit.admin.notice.model;

public class ClassificationsVO {
	private int classificationNo; 
    private String classificationName;
    
	public int getClassificationNo() {
		return classificationNo;
	}
	public void setClassificationNo(int classificationNo) {
		this.classificationNo = classificationNo;
	}
	public String getClassificationName() {
		return classificationName;
	}
	public void setClassificationName(String classificationName) {
		this.classificationName = classificationName;
	}
	
	@Override
	public String toString() {
		return "ClassificationsVO [classificationNo=" + classificationNo + ", classificationName=" + classificationName
				+ "]";
	}
    
    
}
