package com.kh.nullcompany.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int rNo;
	private String rUser;
	private Date rDate;
	private String rContent;
	private int rsNo;
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reservation(int rNo, String rUser, Date rDate, String rContent, int rsNo) {
		super();
		this.rNo = rNo;
		this.rUser = rUser;
		this.rDate = rDate;
		this.rContent = rContent;
		this.rsNo = rsNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getrUser() {
		return rUser;
	}
	public void setrUser(String rUser) {
		this.rUser = rUser;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getRsNo() {
		return rsNo;
	}
	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}
	@Override
	public String toString() {
		return "Reservation [rNo=" + rNo + ", rUser=" + rUser + ", rDate=" + rDate + ", rContent=" + rContent
				+ ", rsNo=" + rsNo + "]";
	}
}
