package com.kh.nullcompany.board.model.vo;

import java.sql.Date;

public class board {

	private int bNo;
	private String bTitle;
	private String bWriter;
	private String bContent;
	private int bCount;
	private String originalFileName;
	private String renameFileName;
	private Date bCreateDate;
	private Date bModifyDate;
	private String bStatus;
	private String bImportant;
	private String bSave;
	private String bType;
	
	public board() {
		super();
	}

	public board(int bNo, String bTitle, String bWriter, String bContent, int bCount, String originalFileName,
			String renameFileName, Date bCreateDate, Date bModifyDate, String bStatus, String bImportant, String bSave,
			String bType) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bContent = bContent;
		this.bCount = bCount;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.bCreateDate = bCreateDate;
		this.bModifyDate = bModifyDate;
		this.bStatus = bStatus;
		this.bImportant = bImportant;
		this.bSave = bSave;
		this.bType = bType;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
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

	public Date getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public Date getbModifyDate() {
		return bModifyDate;
	}

	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbImportant() {
		return bImportant;
	}

	public void setbImportant(String bImportant) {
		this.bImportant = bImportant;
	}

	public String getbSave() {
		return bSave;
	}

	public void setbSave(String bSave) {
		this.bSave = bSave;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	@Override
	public String toString() {
		return "board [bNo=" + bNo + ", bTitle=" + bTitle + ", bWriter=" + bWriter + ", bContent=" + bContent
				+ ", bCount=" + bCount + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName
				+ ", bCreateDate=" + bCreateDate + ", bModifyDate=" + bModifyDate + ", bStatus=" + bStatus
				+ ", bImportant=" + bImportant + ", bSave=" + bSave + ", bType=" + bType + "]";
	}
	
	
	
}
