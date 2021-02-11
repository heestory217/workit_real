package com.it.workit.qna.model;

public class QnaManagerVO extends QnaVO{
	private int managerNo;	//관리자번호
	private String managerName;  //관리자명
	private String managerId;    //관리자이이디
	private String managerPassword; //관리자비밀번호
	
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	@Override
	public String toString() {
		return "QnaManagerVO [managerNo=" + managerNo + ", managerName=" + managerName + ", managerId=" + managerId
				+ ", managerPassword=" + managerPassword + ", toString()=" + super.toString() + "]";
	}
	
	
}
