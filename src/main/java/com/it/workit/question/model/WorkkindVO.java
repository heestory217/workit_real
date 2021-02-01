package com.it.workit.question.model;

public class WorkkindVO {
	private int workkindNo;
	private String workkindName;
	
	public int getWorkkindNo() {
		return workkindNo;
	}
	public void setWorkkindNo(int workkindNo) {
		this.workkindNo = workkindNo;
	}
	public String getWorkkindName() {
		return workkindName;
	}
	public void setWorkkindName(String workkindName) {
		this.workkindName = workkindName;
	}
	
	@Override
	public String toString() {
		return "WorkkindVO [workkindNo=" + workkindNo + ", workkindName=" + workkindName + "]";
	}
	
	
}
