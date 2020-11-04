package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class RecordDiligence {
//	NO_DILIGENCE
//	TYPE_DILIGENCE
//	DATE_DILIGENCE
//	TIME_ENTER
//	MEM_NO
//	STATUS_DILIGENCE
//	TIME_EXIT
	private int noDiligence;
	private String typeDiligence;
	private Date dateDiligence;
	private String timeEnter;
	private int memNo;
	private String statusDiligence;
	private String timeExit;
	public RecordDiligence() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecordDiligence(int noDiligence, String typeDiligence, Date dateDiligence, String timeEnter, int memNo,
			String statusDiligence, String timeExit) {
		super();
		this.noDiligence = noDiligence;
		this.typeDiligence = typeDiligence;
		this.dateDiligence = dateDiligence;
		this.timeEnter = timeEnter;
		this.memNo = memNo;
		this.statusDiligence = statusDiligence;
		this.timeExit = timeExit;
	}
	public int getNoDiligence() {
		return noDiligence;
	}
	public void setNoDiligence(int noDiligence) {
		this.noDiligence = noDiligence;
	}
	public String getTypeDiligence() {
		return typeDiligence;
	}
	public void setTypeDiligence(String typeDiligence) {
		this.typeDiligence = typeDiligence;
	}
	public Date getDateDiligence() {
		return dateDiligence;
	}
	public void setDateDiligence(Date dateDiligence) {
		this.dateDiligence = dateDiligence;
	}
	public String getTimeEnter() {
		return timeEnter;
	}
	public void setTimeEnter(String timeEnter) {
		this.timeEnter = timeEnter;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getStatusDiligence() {
		return statusDiligence;
	}
	public void setStatusDiligence(String statusDiligence) {
		this.statusDiligence = statusDiligence;
	}
	public String getTimeExit() {
		return timeExit;
	}
	public void setTimeExit(String timeExit) {
		this.timeExit = timeExit;
	}
	@Override
	public String toString() {
		return "RecordDiligence [noDiligence=" + noDiligence + ", typeDiligence=" + typeDiligence + ", dateDiligence="
				+ dateDiligence + ", timeEnter=" + timeEnter + ", memNo=" + memNo + ", statusDiligence="
				+ statusDiligence + ", timeExit=" + timeExit + "]";
	}
	
}
