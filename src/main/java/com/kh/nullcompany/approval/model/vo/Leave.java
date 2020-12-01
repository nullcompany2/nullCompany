package com.kh.nullcompany.approval.model.vo;

public class Leave {
	
	private String docTempNo;        // 결재 임시문서번호 --> 임시저장된 번호가 pk이기 때문
	private String type;             // 휴가 종류
	private String reason;           // 사유
	private String startDate;        // 휴가 시작일(varchar2로 저장)
	private String endDate;          // 휴가 종료일(varchar2로 저장)
	private int totalDate;           // 휴가 일수(number로 저장)
	
	public Leave() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Leave(String docTempNo, String type, String reason, String startDate, String endDate, int totalDate) {
		super();
		this.docTempNo = docTempNo;
		this.type = type;
		this.reason = reason;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalDate = totalDate;
	}

	public String getDocTempNo() {
		return docTempNo;
	}

	public void setDocTempNo(String docTempNo) {
		this.docTempNo = docTempNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getTotalDate() {
		return totalDate;
	}

	public void setTotalDate(int totalDate) {
		this.totalDate = totalDate;
	}

	@Override
	public String toString() {
		return "Leave [docTempNo=" + docTempNo + ", type=" + type + ", reason=" + reason + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", totalDate=" + totalDate + "]";
	}
	
	
}
