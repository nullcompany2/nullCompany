package com.kh.nullcompany.personnelManagement.model.vo;

public class SetAttendance {
//	DAY_WEEK
//	DAY_AVAILABLE
//	TIME_ATTENDANCE
//	TIME_OFFWORK
	private String dayWeek;
	private String dayAvailable;
	private String timeAttendance;
	private String timeOffWork;
	public SetAttendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SetAttendance(String dayWeek, String dayAvailable, String timeAttendance, String timeOffWork) {
		super();
		this.dayWeek = dayWeek;
		this.dayAvailable = dayAvailable;
		this.timeAttendance = timeAttendance;
		this.timeOffWork = timeOffWork;
	}
	public String getDayWeek() {
		return dayWeek;
	}
	public void setDayWeek(String dayWeek) {
		this.dayWeek = dayWeek;
	}
	public String getDayAvailable() {
		return dayAvailable;
	}
	public void setDayAvailable(String dayAvailable) {
		this.dayAvailable = dayAvailable;
	}
	public String getTimeAttendance() {
		return timeAttendance;
	}
	public void setTimeAttendance(String timeAttendance) {
		this.timeAttendance = timeAttendance;
	}
	public String getTimeOffWork() {
		return timeOffWork;
	}
	public void setTimeOffWork(String timeOffWork) {
		this.timeOffWork = timeOffWork;
	}
	@Override
	public String toString() {
		return "SetAttendance [dayWeek=" + dayWeek + ", dayAvailable=" + dayAvailable + ", timeAttendance="
				+ timeAttendance + ", timeOffWork=" + timeOffWork + "]";
	}
	
}
