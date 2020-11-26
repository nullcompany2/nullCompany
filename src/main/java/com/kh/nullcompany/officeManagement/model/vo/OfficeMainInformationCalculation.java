package com.kh.nullcompany.officeManagement.model.vo;

import java.util.Date;

public class OfficeMainInformationCalculation {
	private int boardCount;
	private Date latestNoticeDate;
	private int memberCount;
	private int deptCount;
	private int deptPersonnel;
	private int rankCount;
	private int existDocumentCount;
	private int deleteDocumentCount;
	public OfficeMainInformationCalculation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OfficeMainInformationCalculation(int boardCount, Date latestNoticeDate, int memberCount, int deptCount,
			int deptPersonnel, int rankCount, int existDocumentCount, int deleteDocumentCount) {
		super();
		this.boardCount = boardCount;
		this.latestNoticeDate = latestNoticeDate;
		this.memberCount = memberCount;
		this.deptCount = deptCount;
		this.deptPersonnel = deptPersonnel;
		this.rankCount = rankCount;
		this.existDocumentCount = existDocumentCount;
		this.deleteDocumentCount = deleteDocumentCount;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public Date getLatestNoticeDate() {
		return latestNoticeDate;
	}
	public void setLatestNoticeDate(Date latestNoticeDate) {
		this.latestNoticeDate = latestNoticeDate;
	}
	public int getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
	public int getDeptCount() {
		return deptCount;
	}
	public void setDeptCount(int deptCount) {
		this.deptCount = deptCount;
	}
	public int getDeptPersonnel() {
		return deptPersonnel;
	}
	public void setDeptPersonnel(int deptPersonnel) {
		this.deptPersonnel = deptPersonnel;
	}
	public int getRankCount() {
		return rankCount;
	}
	public void setRankCount(int rankCount) {
		this.rankCount = rankCount;
	}
	public int getExistDocumentCount() {
		return existDocumentCount;
	}
	public void setExistDocumentCount(int existDocumentCount) {
		this.existDocumentCount = existDocumentCount;
	}
	public int getDeleteDocumentCount() {
		return deleteDocumentCount;
	}
	public void setDeleteDocumentCount(int deleteDocumentCount) {
		this.deleteDocumentCount = deleteDocumentCount;
	}
	@Override
	public String toString() {
		return "OfficeMainInformationCalculation [boardCount=" + boardCount + ", latestNoticeDate=" + latestNoticeDate
				+ ", memberCount=" + memberCount + ", deptCount=" + deptCount + ", deptPersonnel=" + deptPersonnel
				+ ", rankCount=" + rankCount + ", existDocumentCount=" + existDocumentCount + ", deleteDocumentCount="
				+ deleteDocumentCount + "]";
	}
	
}
