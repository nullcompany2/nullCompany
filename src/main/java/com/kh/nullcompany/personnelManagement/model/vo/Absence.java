package com.kh.nullcompany.personnelManagement.model.vo;

import java.sql.Date;

public class Absence {
	private int memNo;
	private String name;
	private int deptNo;
	private int lankNo;
	private String deptName;
	private String rankName;
	private int noAbsence;
	private String absenceDate;
	private String reasonAbsence;
	private String status;
	private String returnDate;
	public Absence() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Absence(int memNo, String name, int deptNo, int lankNo, String deptName, String rankName, int noAbsence,
			String absenceDate, String reasonAbsence, String status, String returnDate) {
		super();
		this.memNo = memNo;
		this.name = name;
		this.deptNo = deptNo;
		this.lankNo = lankNo;
		this.deptName = deptName;
		this.rankName = rankName;
		this.noAbsence = noAbsence;
		this.absenceDate = absenceDate;
		this.reasonAbsence = reasonAbsence;
		this.status = status;
		this.returnDate = returnDate;
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
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getLankNo() {
		return lankNo;
	}
	public void setLankNo(int lankNo) {
		this.lankNo = lankNo;
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
	public int getNoAbsence() {
		return noAbsence;
	}
	public void setNoAbsence(int noAbsence) {
		this.noAbsence = noAbsence;
	}
	public String getAbsenceDate() {
		return absenceDate;
	}
	public void setAbsenceDate(String absenceDate) {
		this.absenceDate = absenceDate;
	}
	public String getReasonAbsence() {
		return reasonAbsence;
	}
	public void setReasonAbsence(String reasonAbsence) {
		this.reasonAbsence = reasonAbsence;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	@Override
	public String toString() {
		return "Absence [memNo=" + memNo + ", name=" + name + ", deptNo=" + deptNo + ", lankNo=" + lankNo
				+ ", deptName=" + deptName + ", rankName=" + rankName + ", noAbsence=" + noAbsence + ", absenceDate="
				+ absenceDate + ", reasonAbsence=" + reasonAbsence + ", status=" + status + ", returnDate=" + returnDate
				+ "]";
	}
	
	
}
