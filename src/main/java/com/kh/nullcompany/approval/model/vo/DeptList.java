package com.kh.nullcompany.approval.model.vo;

public class DeptList {
	private int deptNo;
	private String deptName;
	
	public DeptList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DeptList(int deptNo, String deptName) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "DeptList [deptNo=" + deptNo + ", deptName=" + deptName + "]";
	}
}
