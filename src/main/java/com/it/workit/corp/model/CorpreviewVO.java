package com.it.workit.corp.model;

import java.sql.Timestamp;

public class CorpreviewVO {
	private int corpreviewNo;
	private int userNo;
	private int corpNo;
	private Timestamp corpreviewDate;
	private String corpreviewOneline;
	private String corpreviewGood;
	private String corpreviewBad;
	private String corpreviewWant;
	private int corpreviewRate;
	private int corpreviewDeletecheck;
	public int getCorpreviewNo() {
		return corpreviewNo;
	}
	public void setCorpreviewNo(int corpreviewNo) {
		this.corpreviewNo = corpreviewNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCorpNo() {
		return corpNo;
	}
	public void setCorpNo(int corpNo) {
		this.corpNo = corpNo;
	}
	public Timestamp getCorpreviewDate() {
		return corpreviewDate;
	}
	public void setCorpreviewDate(Timestamp corpreviewDate) {
		this.corpreviewDate = corpreviewDate;
	}
	public String getCorpreviewOneline() {
		return corpreviewOneline;
	}
	public void setCorpreviewOneline(String corpreviewOneline) {
		this.corpreviewOneline = corpreviewOneline;
	}
	public String getCorpreviewGood() {
		return corpreviewGood;
	}
	public void setCorpreviewGood(String corpreviewGood) {
		this.corpreviewGood = corpreviewGood;
	}
	public String getCorpreviewBad() {
		return corpreviewBad;
	}
	public void setCorpreviewBad(String corpreviewBad) {
		this.corpreviewBad = corpreviewBad;
	}
	public String getCorpreviewWant() {
		return corpreviewWant;
	}
	public void setCorpreviewWant(String corpreviewWant) {
		this.corpreviewWant = corpreviewWant;
	}
	public int getCorpreviewRate() {
		return corpreviewRate;
	}
	public void setCorpreviewRate(int corpreviewRate) {
		this.corpreviewRate = corpreviewRate;
	}
	public int getCorpreviewDeletecheck() {
		return corpreviewDeletecheck;
	}
	public void setCorpreviewDeletecheck(int corpreviewDeletecheck) {
		this.corpreviewDeletecheck = corpreviewDeletecheck;
	}
	@Override
	public String toString() {
		return "CorpreviewVO [corpreviewNo=" + corpreviewNo + ", userNo=" + userNo + ", corpNo=" + corpNo
				+ ", corpreviewDate=" + corpreviewDate + ", corpreviewOneline=" + corpreviewOneline
				+ ", corpreviewGood=" + corpreviewGood + ", corpreviewBad=" + corpreviewBad + ", corpreviewWant="
				+ corpreviewWant + ", corpreviewRate=" + corpreviewRate + ", corpreviewDeletecheck="
				+ corpreviewDeletecheck + "]";
	}
	
	
	
}
