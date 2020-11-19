package com.kh.nullcompany.approval.model.vo;

public class Resign {
	private String docTempNo;        // 결재 임시문서번호 --> 임시저장된 번호가 pk이기 때문
	private String enrollDate;       // 사직일(varchar2로 저장)
	
	public Resign() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Resign(String docTempNo, String enrollDate) {
		super();
		this.docTempNo = docTempNo;
		this.enrollDate = enrollDate;
	}

	public String getDocTempNo() {
		return docTempNo;
	}

	public void setDocTempNo(String docTempNo) {
		this.docTempNo = docTempNo;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Resign [docTempNo=" + docTempNo + ", enrollDate=" + enrollDate + "]";
	}

	
	
	
}
