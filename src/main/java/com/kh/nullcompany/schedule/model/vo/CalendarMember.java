package com.kh.nullcompany.schedule.model.vo;

public class CalendarMember {
	private int calNo;
	private int calMem;
	private int calMemType;
	private String calName;
	private String color;
	
	public CalendarMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalendarMember(int calNo, int calMem, int calMemType, String calName, String color) {
		super();
		this.calNo = calNo;
		this.calMem = calMem;
		this.calMemType = calMemType;
		this.calName = calName;
		this.color = color;
	}
	public int getCalNo() {
		return calNo;
	}
	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}
	public int getCalMem() {
		return calMem;
	}
	public void setCalMem(int calMem) {
		this.calMem = calMem;
	}
	public int getCalMemType() {
		return calMemType;
	}
	public void setCalMemType(int calMemType) {
		this.calMemType = calMemType;
	}
	public String getCalName() {
		return calName;
	}
	public void setCalName(String calName) {
		this.calName = calName;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "CalendarMember [calNo=" + calNo + ", calMem=" + calMem + ", calMemType=" + calMemType + ", calName="
				+ calName + ", color=" + color + "]";
	}
	


	
}
