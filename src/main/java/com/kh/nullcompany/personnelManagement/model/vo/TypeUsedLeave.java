package com.kh.nullcompany.personnelManagement.model.vo;

public class TypeUsedLeave {
	private String tName;
	private int num;
	public TypeUsedLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TypeUsedLeave(String tName, int num) {
		super();
		this.tName = tName;
		this.num = num;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "TypeUsedLeave [tName=" + tName + ", num=" + num + "]";
	}
	
}
