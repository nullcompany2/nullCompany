package com.kh.nullcompany.personnelManagement.model.vo;

public class TypeLeave {

	private int noType;
	private String nameType;
	private String annualUse;
	private String status;
	public TypeLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TypeLeave(int noType, String nameType, String annualUse, String status) {
		super();
		this.noType = noType;
		this.nameType = nameType;
		this.annualUse = annualUse;
		this.status = status;
	}
	public int getNoType() {
		return noType;
	}
	public void setNoType(int noType) {
		this.noType = noType;
	}
	public String getNameType() {
		return nameType;
	}
	public void setNameType(String nameType) {
		this.nameType = nameType;
	}
	public String getAnnualUse() {
		return annualUse;
	}
	public void setAnnualUse(String annualUse) {
		this.annualUse = annualUse;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "TypeLeave [noType=" + noType + ", nameType=" + nameType + ", annualUse=" + annualUse + ", status="
				+ status + "]";
	}
	
	
}
