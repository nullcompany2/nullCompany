package com.kh.nullcompany.schedule.model.vo;

import java.util.ArrayList;

public class Calendar {

	private int calNo;
	private String calName;
	private String color;
	private String enrollMember;
	private String lookMember;
	private int cal_type;
	private String mem_name;
	private int mem_no;
	private int cal_type_no;
	private int memNo;
	
	
	


	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int calNo, String calName, String color, String enrollMember, String lookMember) {
		super();
		this.calNo = calNo;
		this.calName = calName;
		this.color = color;
		this.enrollMember = enrollMember;
		this.lookMember = lookMember;
		
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



	@Override
	public String toString() {
		return "Calendar [사번" + memNo + ":" + cal_type_no + mem_name + calNo + ", calName=" + calName + ", color=" + color + ", enrollMember="
				+ enrollMember + ", lookMember=" + lookMember + "]";
	}

	public int getCal_type() {
		return cal_type;
	}

	public void setCal_type(int cal_type) {
		this.cal_type = cal_type;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	/**
	 * @return the cal_type_no
	 */
	public int getCal_type_no() {
		return cal_type_no;
	}

	/**
	 * @param cal_type_no the cal_type_no to set
	 */
	public void setCal_type_no(int cal_type_no) {
		this.cal_type_no = cal_type_no;
	}

	/**
	 * @return the memNo
	 */
	public int getMemNo() {
		return memNo;
	}

	/**
	 * @param memNo the memNo to set
	 */
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}



}