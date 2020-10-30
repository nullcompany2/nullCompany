package com.kh.nullcompany.approval.model.vo;

import java.sql.Date;

public class Document {
	
	private int dNo;               // 문서 번호
	private int lineNo;            // 결재선 번호
	private int formNo;            // 서식번호
	private int memNo;             // 기안자 사원번호
	private String dTitle;         // 제목
	private String dContent;       // 내용
	private String fileName;       // 첨부파일명
	private Date draftDate;        // 기안일
	private Date completeDate;     // 완료일
	private int staffNo;           // 결재할 사원번호
	private String dStatus;        // 문서 삭제여부
	
	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Document(int dNo, int lineNo, int formNo, int memNo, String dTitle, String dContent, String fileName,
			Date draftDate, Date completeDate, int staffNo, String dStatus) {
		super();
		this.dNo = dNo;
		this.lineNo = lineNo;
		this.formNo = formNo;
		this.memNo = memNo;
		this.dTitle = dTitle;
		this.dContent = dContent;
		this.fileName = fileName;
		this.draftDate = draftDate;
		this.completeDate = completeDate;
		this.staffNo = staffNo;
		this.dStatus = dStatus;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getLineNo() {
		return lineNo;
	}

	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

	public int getFormNo() {
		return formNo;
	}

	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getDraftDate() {
		return draftDate;
	}

	public void setDraftDate(Date draftDate) {
		this.draftDate = draftDate;
	}

	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}

	public int getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	@Override
	public String toString() {
		return "Document [dNo=" + dNo + ", lineNo=" + lineNo + ", formNo=" + formNo + ", memNo=" + memNo + ", dTitle="
				+ dTitle + ", dContent=" + dContent + ", fileName=" + fileName + ", draftDate=" + draftDate
				+ ", completeDate=" + completeDate + ", staffNo=" + staffNo + ", dStatus=" + dStatus + "]";
	}
	
	
	
	
}
