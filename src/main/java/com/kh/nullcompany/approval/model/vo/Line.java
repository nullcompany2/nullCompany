package com.kh.nullcompany.approval.model.vo;

import java.sql.Date;

public class Line {
	
	private int lineNo;         // 결재선 번호
	private int memNo;          // 기안자 사원번호
	private String lineName;    // 결재선 명(결재/확인/수신)
	private Date enrollDate;  // 작성일
	
	public Line() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Line(int lineNo, int memNo, String lineName, Date enrollDate) {
		super();
		this.lineNo = lineNo;
		this.memNo = memNo;
		this.lineName = lineName;
		this.enrollDate = enrollDate;
	}

	public int getLineNo() {
		return lineNo;
	}

	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getLineName() {
		return lineName;
	}

	public void setLineName(String lineName) {
		this.lineName = lineName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Line [lineNo=" + lineNo + ", memNo=" + memNo + ", lineName=" + lineName + ", enrollDate=" + enrollDate
				+ "]";
	}
	
	
}
