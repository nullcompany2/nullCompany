package com.kh.nullcompany.schedule.model.vo;

import java.util.ArrayList;

public class Calendar {

	private int calNo;
	private String calName;
	private String color;
	private String enrollMember;
	private String lookMember;
	private int enrollmemno;


	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int calNo, String calName, String color, String enrollMember, String lookMember, int enrollmemno) {
		super();
		this.calNo = calNo;
		this.calName = calName;
		this.color = color;
		this.enrollMember = enrollMember;
		this.lookMember = lookMember;
		this.enrollmemno = enrollmemno;
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
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

	public String getEnrollMember() {
		return enrollMember;
	}

	public void setEnrollMember(String enrollMember) {
		this.enrollMember = enrollMember;
	}

	public String getLookMember() {
		return lookMember;
	}

	public void setLookMember(String lookMember) {
		this.lookMember = lookMember;
	}

	public int getEnrollmemno() {
		return enrollmemno;
	}

	public void setEnrollmemno(int enrollmemno) {
		this.enrollmemno = enrollmemno;
	}

	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", calName=" + calName + ", color=" + color + ", enrollMember="
				+ enrollMember + ", lookMember=" + lookMember + ", enrollmemno=" + enrollmemno + "]";
	}



}