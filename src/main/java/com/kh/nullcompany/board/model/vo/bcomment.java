package com.kh.nullcompany.board.model.vo;

import java.sql.Date;

public class bcomment {


	private int bcNo;
	private String bcContent;
	private int bcefBno;
	private String bcWriter;
	private Date bcCreateDate;
	private Date bcModifyDate;
	private String bcStatus;

	public bcomment() {
		super();
	}

	public int getBcNo() {
		return bcNo;
	}

	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}

	public String getBcContent() {
		return bcContent;
	}

	public void setBcContent(String bcContent) {
		this.bcContent = bcContent;
	}

	public int getBcefBno() {
		return bcefBno;
	}

	public void setBcefBno(int bcefBno) {
		this.bcefBno = bcefBno;
	}

	public String getBcWriter() {
		return bcWriter;
	}

	public void setBcWriter(String bcWriter) {
		this.bcWriter = bcWriter;
	}

	public Date getBcCreateDate() {
		return bcCreateDate;
	}

	public void setBcCreateDate(Date bcCreateDate) {
		this.bcCreateDate = bcCreateDate;
	}

	public Date getBcModifyDate() {
		return bcModifyDate;
	}

	public void setBcModifyDate(Date bcModifyDate) {
		this.bcModifyDate = bcModifyDate;
	}

	public String getBcStatus() {
		return bcStatus;
	}

	public void setBcStatus(String bcStatus) {
		this.bcStatus = bcStatus;
	}

	@Override
	public String toString() {
		return "bcomment [bcNo=" + bcNo + ", bcContent=" + bcContent + ", bcefBno=" + bcefBno + ", bcWriter=" + bcWriter
				+ ", bcCreateDate=" + bcCreateDate + ", bcModifyDate=" + bcModifyDate + ", bcStatus=" + bcStatus + "]";
	}





}