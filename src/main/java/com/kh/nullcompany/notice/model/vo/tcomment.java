package com.kh.nullcompany.notice.model.vo;

import java.sql.Date;

public class tcomment {


	private int tncNo;
	private String tncContent;
	private int tncefTno;
	private String tncWriter;
	private Date tncCreateDate;
	private Date tncModifyDate;
	private String tncStatus;

	public tcomment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public tcomment(int tncNo, String tncContent, int tncefTno, String tncWriter, Date tncCreateDate, Date tncModifyDate,
			String tncStatus) {
		super();
		this.tncNo = tncNo;
		this.tncContent = tncContent;
		this.tncefTno = tncefTno;
		this.tncWriter = tncWriter;
		this.tncCreateDate = tncCreateDate;
		this.tncModifyDate = tncModifyDate;
		this.tncStatus = tncStatus;
	}

	public int getTncNo() {
		return tncNo;
	}

	public void setTncNo(int tncNo) {
		this.tncNo = tncNo;
	}

	public String getTncContent() {
		return tncContent;
	}

	public void setTncContent(String tncContent) {
		this.tncContent = tncContent;
	}

	public int getTncefTno() {
		return tncefTno;
	}

	public void setTncefTno(int tncefTno) {
		this.tncefTno = tncefTno;
	}

	public String getTncWriter() {
		return tncWriter;
	}

	public void setTncWriter(String tncWriter) {
		this.tncWriter = tncWriter;
	}

	public Date getTncCreateDate() {
		return tncCreateDate;
	}

	public void setTncCreateDate(Date tncCreateDate) {
		this.tncCreateDate = tncCreateDate;
	}

	public Date getTncModifyDate() {
		return tncModifyDate;
	}

	public void setTncModifyDate(Date tncModifyDate) {
		this.tncModifyDate = tncModifyDate;
	}

	public String getTncStatus() {
		return tncStatus;
	}

	public void setTncStatus(String tncStatus) {
		this.tncStatus = tncStatus;
	}

	@Override
	public String toString() {
		return "tncomment [tncNo=" + tncNo + ", tncContent=" + tncContent + ", tncefTno=" + tncefTno + ", tncWriter="
				+ tncWriter + ", tncCreateDate=" + tncCreateDate + ", tncModifyDate=" + tncModifyDate + ", tncStatus="
				+ tncStatus + "]";
	}





}