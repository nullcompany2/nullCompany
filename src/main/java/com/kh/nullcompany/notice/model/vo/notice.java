package com.kh.nullcompany.notice.model.vo;

import java.sql.Date;

public class notice {

	private int nNo;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private String originalFileName;
	private String renameFileName;
	private int nCount;
	private Date nCreateDate;
	private Date nModifyDate;
	private String nStatus;
	private String nImport;
	private String nSave;
	private int deptNo;
	private String category;
	
	public notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public notice(int nNo, String nTitle, String nContent, String nWriter, String originalFileName,
			String renameFileName, int nCount, Date nCreateDate, Date nModifyDate, String nStatus, String nImport,
			String nSave, int deptNo, String category) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.nCount = nCount;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nStatus = nStatus;
		this.nImport = nImport;
		this.nSave = nSave;
		this.deptNo = deptNo;
		this.category = category;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
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

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public String getnImport() {
		return nImport;
	}

	public void setnImport(String nImport) {
		this.nImport = nImport;
	}

	public String getnSave() {
		return nSave;
	}

	public void setnSave(String nSave) {
		this.nSave = nSave;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "notice [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + ", nCount=" + nCount
				+ ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nStatus=" + nStatus
				+ ", nImport=" + nImport + ", nSave=" + nSave + ", deptNo=" + deptNo + ", category=" + category + "]";
	}

	
	
	
}
