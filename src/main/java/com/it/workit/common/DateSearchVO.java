package com.it.workit.common;

public class DateSearchVO extends SearchVO{
	private String startDay;  //시작일
	private String endDay; //종료일
	
	private String year;
	private String month;
	
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "DateSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", year=" + year + ", month=" + month
				+ "]";
	}
	
	
}
