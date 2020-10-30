package com.kh.nullcompany.mail.model.vo;

public class Email {
	private int memNo;
	private String email_address;
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Email(int memNo, String email_address) {
		super();
		this.memNo = memNo;
		this.email_address = email_address;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	@Override
	public String toString() {
		return "Email [memNo=" + memNo + ", email_address=" + email_address + "]";
	}
	
	

}
