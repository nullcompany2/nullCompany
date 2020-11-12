package com.kh.nullcompany.notice.model.vo;

import java.sql.Date;

public class tnotice {

	private int tNo;
	private String tTitle;
	private String tContent;
	private String tWriter;
	private String originalFileName;
	private String renameFileName;
	private int tCount;
	private Date tCreateDate;
	private Date tModifyDate;
	private String tStatus;
	private String tImport;
	private String tSave;
	private int deptNo;
	
	public tnotice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public tnotice(int tNo, String tTitle, String tContent, String tWriter, String originalFileName,
			String renameFileName, int tCount, Date tCreateDate, Date tModifyDate, String tStatus, String tImport,
			String tSave, int deptNo) {
		super();
		this.tNo = tNo;
		this.tTitle = tTitle;
		this.tContent = tContent;
		this.tWriter = tWriter;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.tCount = tCount;
		this.tCreateDate = tCreateDate;
		this.tModifyDate = tModifyDate;
		this.tStatus = tStatus;
		this.tImport = tImport;
		this.tSave = tSave;
		this.deptNo = deptNo;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}

	public String gettWriter() {
		return tWriter;
	}

	public void settWriter(String tWriter) {
		this.tWriter = tWriter;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public int gettCount() {
		return tCount;
	}

	public void settCount(int tCount) {
		this.tCount = tCount;
	}

	public Date gettCreateDate() {
		return tCreateDate;
	}

	public void settCreateDate(Date tCreateDate) {
		this.tCreateDate = tCreateDate;
	}

	public Date gettModifyDate() {
		return tModifyDate;
	}

	public void settModifyDate(Date tModifyDate) {
		this.tModifyDate = tModifyDate;
	}

	public String gettStatus() {
		return tStatus;
	}

	public void settStatus(String tStatus) {
		this.tStatus = tStatus;
	}

	public String gettImport() {
		return tImport;
	}

	public void settImport(String tImport) {
		this.tImport = tImport;
	}

	public String gettSave() {
		return tSave;
	}

	public void settSave(String tSave) {
		this.tSave = tSave;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	@Override
	public String toString() {
		return "tnotice [tNo=" + tNo + ", tTitle=" + tTitle + ", tContent=" + tContent + ", tWriter=" + tWriter
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", tCount=" + tCount
				+ ", tCreateDate=" + tCreateDate + ", tModifyDate=" + tModifyDate + ", tStatus=" + tStatus
				+ ", tImport=" + tImport + ", tSave=" + tSave + ", deptNo=" + deptNo + "]";
	}
	
	
	
}
