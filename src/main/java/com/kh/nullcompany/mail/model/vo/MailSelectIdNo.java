package com.kh.nullcompany.mail.model.vo;

public class MailSelectIdNo {

	private String memId;
	private int mailNo;
	
	public MailSelectIdNo() {}

	public MailSelectIdNo(String memId, int mailNo) {
		super();
		this.memId = memId;
		this.mailNo = mailNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	@Override
	public String toString() {
		return "MailSelectIdNo [memId=" + memId + ", mailNo=" + mailNo + "]";
	}
	
	
}
