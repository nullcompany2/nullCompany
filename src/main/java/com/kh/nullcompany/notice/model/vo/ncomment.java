package com.kh.nullcompany.notice.model.vo;

import java.sql.Date;

public class ncomment {

	private int ncNo;
	private String ncContent;
	private int ncefNno;
	private String ncWriter;
	private Date ncCreateDate;
	private Date ncModifyDate;
	private String ncStatus;

	public ncomment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ncomment(int ncNo, String ncContent, int ncefNno, String ncWriter, Date ncCreateDate, Date ncModifyDate,
			String ncStatus) {
		super();
		this.ncNo = ncNo;
		this.ncContent = ncContent;
		this.ncefNno = ncefNno;
		this.ncWriter = ncWriter;
		this.ncCreateDate = ncCreateDate;
		this.ncModifyDate = ncModifyDate;
		this.ncStatus = ncStatus;
	}

	public int getNcNo() {
		return ncNo;
	}

	public void setNcNo(int ncNo) {
		this.ncNo = ncNo;
	}

	public String getNcContent() {
		return ncContent;
	}

	public void setNcContent(String ncContent) {
		this.ncContent = ncContent;
	}

	public int getNcefNno() {
		return ncefNno;
	}

	public void setNcefNno(int ncefNno) {
		this.ncefNno = ncefNno;
	}

	public String getNcWriter() {
		return ncWriter;
	}

	public void setNcWriter(String ncWriter) {
		this.ncWriter = ncWriter;
	}

	public Date getNcCreateDate() {
		return ncCreateDate;
	}

	public void setNcCreateDate(Date ncCreateDate) {
		this.ncCreateDate = ncCreateDate;
	}

	public Date getNcModifyDate() {
		return ncModifyDate;
	}

	public void setNcModifyDate(Date ncModifyDate) {
		this.ncModifyDate = ncModifyDate;
	}

	public String getNcStatus() {
		return ncStatus;
	}

	public void setNcStatus(String ncStatus) {
		this.ncStatus = ncStatus;
	}

	@Override
	public String toString() {
		return "ncomment [ncNo=" + ncNo + ", ncContent=" + ncContent + ", ncefNno=" + ncefNno + ", ncWriter=" + ncWriter
				+ ", ncCreateDate=" + ncCreateDate + ", ncModifyDate=" + ncModifyDate + ", ncStatus=" + ncStatus + "]";
	}






}