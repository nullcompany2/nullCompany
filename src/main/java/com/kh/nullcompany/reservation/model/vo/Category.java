package com.kh.nullcompany.reservation.model.vo;

public class Category {
	private int rcNo;
	private String rcTitle;
	private String rcContent;
	private String rcStatus;
	private int rsNo;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int rcNo, String rcTitle, String rcContent, String rcStatus, int rsNo) {
		super();
		this.rcNo = rcNo;
		this.rcTitle = rcTitle;
		this.rcContent = rcContent;
		this.rcStatus = rcStatus;
		this.rsNo = rsNo;
	}

	public int getRcNo() {
		return rcNo;
	}

	public void setRcNo(int rcNo) {
		this.rcNo = rcNo;
	}

	public String getRcTitle() {
		return rcTitle;
	}

	public void setRcTitle(String rcTitle) {
		this.rcTitle = rcTitle;
	}

	public String getRcContent() {
		return rcContent;
	}

	public void setRcContent(String rcContent) {
		this.rcContent = rcContent;
	}

	public String getRcStatus() {
		return rcStatus;
	}

	public void setRcStatus(String rcStatus) {
		this.rcStatus = rcStatus;
	}

	public int getRsNo() {
		return rsNo;
	}

	public void setRsNo(int rsNo) {
		this.rsNo = rsNo;
	}

	@Override
	public String toString() {
		return "Category [rcNo=" + rcNo + ", rcTitle=" + rcTitle + ", rcContent=" + rcContent + ", rcStatus=" + rcStatus
				+ ", rsNo=" + rsNo + "]";
	}

}
