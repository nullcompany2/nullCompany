package com.kh.nullcompany.schedule.model.vo;

import java.util.Date;

public class Schedule {
	private int Sche_no;
	private String Cal_name;
	private String Sche_name;
	private String startdate;
	private String starttime;
	private String enddate;
	private String endtime;
	private String Sche_content;
	private String color;

	private Calendar calendar;
	
	
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Schedule(int sche_no, String cal_name, String sche_name, String startdate, String starttime, String enddate,
			String endtime, String sche_content) {
		super();
		Sche_no = sche_no;
		Cal_name = cal_name;
		Sche_name = sche_name;
		this.startdate = startdate;
		this.starttime = starttime;
		this.enddate = enddate;
		this.endtime = endtime;
		Sche_content = sche_content;
	}

	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public int getSche_no() {
		return Sche_no;
	}


	public void setSche_no(int sche_no) {
		Sche_no = sche_no;
	}


	public String getCal_name() {
		return Cal_name;
	}


	public void setCal_name(String cal_name) {
		Cal_name = cal_name;
	}


	public String getSche_name() {
		return Sche_name;
	}


	public void setSche_name(String sche_name) {
		Sche_name = sche_name;
	}


	public String getStartdate() {
		return startdate;
	}


	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}


	public String getStarttime() {
		return starttime;
	}


	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}


	public String getEnddate() {
		return enddate;
	}


	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}


	public String getEndtime() {
		return endtime;
	}


	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}


	public String getSche_content() {
		return Sche_content;
	}


	public void setSche_content(String sche_content) {
		Sche_content = sche_content;
	}


	@Override
	public String toString() {
		return "Schedule [Sche_no=" + Sche_no + ", Cal_name=" + Cal_name + ", Sche_name=" + Sche_name + ", startdate="
				+ startdate + ", starttime=" + starttime + ", enddate=" + enddate + ", endtime=" + endtime
				+ ", Sche_content=" + Sche_content + "]";
	}


	public Calendar getCalendar() {
		return calendar;
	}


	public void setCalendar(Calendar calendar) {
		this.calendar = calendar;
	}
	
	

}