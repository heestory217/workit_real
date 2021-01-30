package com.it.workit.users.model;

public class arealistVO {
	private int areaNo;
	private String areaadd1;
	private String areaadd2;
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getAreaadd1() {
		return areaadd1;
	}
	public void setAreaadd1(String areaadd1) {
		this.areaadd1 = areaadd1;
	}
	public String getAreaadd2() {
		return areaadd2;
	}
	public void setAreaadd2(String areaadd2) {
		this.areaadd2 = areaadd2;
	}
	@Override
	public String toString() {
		return "RcarealistVO [areaNo=" + areaNo + ", areaadd1=" + areaadd1 + ", areaadd2=" + areaadd2 + "]";
	}
}
