package com.kh.nullcompany.personnelManagement.model.vo;

import java.sql.Date;

public class SelectedMemberDiligenceCount {
	private int memNo;
	private int lateCount;
	private int absenceCount;
	public SelectedMemberDiligenceCount() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SelectedMemberDiligenceCount(int memNo, int lateCount, int absenceCount) {
		super();
		this.memNo = memNo;
		this.lateCount = lateCount;
		this.absenceCount = absenceCount;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getLateCount() {
		return lateCount;
	}
	public void setLateCount(int lateCount) {
		this.lateCount = lateCount;
	}
	public int getAbsenceCount() {
		return absenceCount;
	}
	public void setAbsenceCount(int absenceCount) {
		this.absenceCount = absenceCount;
	}
	@Override
	public String toString() {
		return "SelectedMemberDiligenceCount [memNo=" + memNo + ", lateCount=" + lateCount + ", absenceCount="
				+ absenceCount + "]";
	}
	
	
	
}
