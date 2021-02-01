package com.it.workit.resumes.model;

public class CarrerVO {
	private int carrerNo;
	private String carrerCorp; //회사
	private String carrerStartdate; //근무기간
	private String carrerEnddate; //근무기간
	private String carrerWork; //담당업무
	private int resumeNo;
	
	public int getCarrerNo() {
		return carrerNo;
	}
	public void setCarrerNo(int carrerNo) {
		this.carrerNo = carrerNo;
	}
	public String getCarrerCorp() {
		return carrerCorp;
	}
	public void setCarrerCorp(String carrerCorp) {
		this.carrerCorp = carrerCorp;
	}
	public String getCarrerStartdate() {
		return carrerStartdate;
	}
	public void setCarrerStartdate(String carrerStartdate) {
		this.carrerStartdate = carrerStartdate;
	}
	public String getCarrerEnddate() {
		return carrerEnddate;
	}
	public void setCarrerEnddate(String carrerEnddate) {
		this.carrerEnddate = carrerEnddate;
	}
	public String getCarrerWork() {
		return carrerWork;
	}
	public void setCarrerWork(String carrerWork) {
		this.carrerWork = carrerWork;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	
	@Override
	public String toString() {
		return "CarrerVO [carrerNo=" + carrerNo + ", carrerCorp=" + carrerCorp + ", carrerStartdate=" + carrerStartdate
				+ ", carrerEnddate=" + carrerEnddate + ", carrerWork=" + carrerWork + ", resumeNo=" + resumeNo + "]";
	}
	
	
}
