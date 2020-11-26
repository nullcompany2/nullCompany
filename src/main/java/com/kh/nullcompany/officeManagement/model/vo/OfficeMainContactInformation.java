package com.kh.nullcompany.officeManagement.model.vo;

import java.sql.Date;

public class OfficeMainContactInformation {
	private int memNo;
	private String name;
	private String id;
	private String phone;
	private String email;
	private String deptName;
	private String rankName;
	private int sAccess;
	private String emailAddress;
	public OfficeMainContactInformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OfficeMainContactInformation(int memNo, String name, String id, String phone, String email, String deptName,
			String rankName, int sAccess, String emailAddress) {
		super();
		this.memNo = memNo;
		this.name = name;
		this.id = id;
		this.phone = phone;
		this.email = email;
		this.deptName = deptName;
		this.rankName = rankName;
		this.sAccess = sAccess;
		this.emailAddress = emailAddress;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public int getsAccess() {
		return sAccess;
	}
	public void setsAccess(int sAccess) {
		this.sAccess = sAccess;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	@Override
	public String toString() {
		return "OfficeMainContactInformation [memNo=" + memNo + ", name=" + name + ", id=" + id + ", phone=" + phone
				+ ", email=" + email + ", deptName=" + deptName + ", rankName=" + rankName + ", sAccess=" + sAccess
				+ ", emailAddress=" + emailAddress + "]";
	}
	
	
}
