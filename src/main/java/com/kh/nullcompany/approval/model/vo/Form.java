package com.kh.nullcompany.approval.model.vo;

public class Form {
	
	private int formNo;          // 서식번호
	private String formName;     // 서식명
	
	public Form() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Form(int formNo, String formName) {
		super();
		this.formNo = formNo;
		this.formName = formName;
	}

	public int getFormNo() {
		return formNo;
	}

	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	@Override
	public String toString() {
		return "Form [formNo=" + formNo + ", formName=" + formName + "]";
	}
	
	
}
