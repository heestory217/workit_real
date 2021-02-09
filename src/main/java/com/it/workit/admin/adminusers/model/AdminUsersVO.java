package com.it.workit.admin.adminusers.model;

public class AdminUsersVO {
	private int managerNo;
	private String managerName;
	private String managerId;
	private String managerPassword;
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
		return "AdminUsersVO [managerNo=" + managerNo + ", managerName=" + managerName + ", managerId=" + managerId
				+ ", managerPassword=" + managerPassword + "]";
	}
	
}
