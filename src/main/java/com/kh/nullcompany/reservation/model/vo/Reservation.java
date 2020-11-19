package com.kh.nullcompany.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int rNo;
	private int rsNo;
	private int rcNo;
	private String rMember;
	private String rDate;
	private String rContent;
	private String start_time;
	private String end_time;
	private String rReturn;
	private String rMemberName;
	private String rcTitle;
	private String rsTitle;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int rNo, int rsNo, int rcNo, String rMember, String rDate, String rContent, String start_time,
			String end_time, String rReturn, String rMemberName, String rcTitle, String rsTitle) {
		super();
		this.rNo = rNo;
		this.rsNo = rsNo;
		this.rcNo = rcNo;
		this.rMember = rMember;
		this.rDate = rDate;
		this.rContent = rContent;
		this.start_time = start_time;
		this.end_time = end_time;
		this.rReturn = rReturn;
		this.rMemberName = rMemberName;
		this.rcTitle = rcTitle;
		this.rsTitle = rsTitle;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getRsNo() {
		return rsNo;
	}
	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}
	public int getRcNo() {
		return rcNo;
	}
	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}
	public String getrMember() {
		return rMember;
	}
	public void setrMember(String rMember) {
		this.rMember = rMember;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getrReturn() {
		return rReturn;
	}
	public void setrReturn(String rReturn) {
		this.rReturn = rReturn;
	}
	public String getrMemberName() {
		return rMemberName;
	}
	public void setrMemberName(String rMemberName) {
		this.rMemberName = rMemberName;
	}
	public String getRcTitle() {
		return rcTitle;
	}
	public void setRcTitle(String rcTitle) {
		this.rcTitle = rcTitle;
	}
	public String getRsTitle() {
		return rsTitle;
	}
	public void setRsTitle(String rsTitle) {
		this.rsTitle = rsTitle;
	}
	@Override
	public String toString() {
		return "Reservation [rNo=" + rNo + ", rsNo=" + rsNo + ", rcNo=" + rcNo + ", rMember=" + rMember + ", rDate="
				+ rDate + ", rContent=" + rContent + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", rReturn=" + rReturn + ", rMemberName=" + rMemberName + ", rcTitle=" + rcTitle + ", rsTitle="
				+ rsTitle + "]";
	}
}
