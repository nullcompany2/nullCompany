package com.kh.nullcompany.personnelManagement.model.vo;

public class ForEmUsedLeave {
	private int memNo;
	private String num;
	private int useCount;
	public ForEmUsedLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForEmUsedLeave(int memNo, String num, int useCount) {
		super();
		this.memNo = memNo;
		this.num = num;
		this.useCount = useCount;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getUseCount() {
		return useCount;
	}
	public void setUseCount(int useCount) {
		this.useCount = useCount;
	}
	@Override
	public String toString() {
		return "ForEmUsedLeave [memNo=" + memNo + ", num=" + num + ", useCount=" + useCount + "]";
	}
	
	
	
}
