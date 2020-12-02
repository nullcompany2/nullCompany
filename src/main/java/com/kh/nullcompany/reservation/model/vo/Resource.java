package com.kh.nullcompany.reservation.model.vo;

public class Resource {
	private int rsNo;
	private int rcNo;
	private String rsTitle;
	private String rsContent;
	private String rsReturn;
	private String originalFileName;
	private String renameFileName;
	private String rsStatus;
	public Resource() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Resource(int rsNo, int rcNo, String rsTitle, String rsContent, String rsReturn, String originalFileName,
			String renameFileName, String rsStatus) {
		super();
		this.rsNo = rsNo;
		this.rcNo = rcNo;
		this.rsTitle = rsTitle;
		this.rsContent = rsContent;
		this.rsReturn = rsReturn;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.rsStatus = rsStatus;
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
	public String getRsTitle() {
		return rsTitle;
	}
	public void setRsTitle(String rsTitle) {
		this.rsTitle = rsTitle;
	}
	public String getRsContent() {
		return rsContent;
	}
	public void setRsContent(String rsContent) {
		this.rsContent = rsContent;
	}
	public String getRsReturn() {
		return rsReturn;
	}
	public void setRsReturn(String rsReturn) {
		this.rsReturn = rsReturn;
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
	public String getRsStatus() {
		return rsStatus;
	}
	public void setRsStatus(String rsStatus) {
		this.rsStatus = rsStatus;
	}
	@Override
	public String toString() {
		return "Resource [rsNo=" + rsNo + ", rcNo=" + rcNo + ", rsTitle=" + rsTitle + ", rsContent=" + rsContent
				+ ", rsReturn=" + rsReturn + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", rsStatus=" + rsStatus + "]";
	}
	
}