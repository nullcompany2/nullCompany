package com.kh.nullcompany.approval.model.vo;

public class Step {
	
    private String docTempNo;        // 결재 임시문서번호 --> 임시저장된 번호가 pk이기 때문
	private int lineNo;              // 결재선 번호
	private int staffNo;             // 결재할 사원번호
	private String staffName;        // 결재할 사원명 --> member 조인
	private int staffRankNo;         // 결재할 사원 직급번호
	private String staffRankName;    // 결재할 사원 직급명 --> rank 조인
	private int stepPriority;        // 결재우선순위
	private String apprStatus;       // 결재여부
	
	public Step() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Step(String docTempNo, int lineNo, int staffNo, String staffName, int staffRankNo, String staffRankName,
			int stepPriority, String apprStatus) {
		super();
		this.docTempNo = docTempNo;
		this.lineNo = lineNo;
		this.staffNo = staffNo;
		this.staffName = staffName;
		this.staffRankNo = staffRankNo;
		this.staffRankName = staffRankName;
		this.stepPriority = stepPriority;
		this.apprStatus = apprStatus;
	}

	public String getDocTempNo() {
		return docTempNo;
	}

	public void setDocTempNo(String docTempNo) {
		this.docTempNo = docTempNo;
	}

	public int getLineNo() {
		return lineNo;
	}

	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

	public int getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public int getStaffRankNo() {
		return staffRankNo;
	}

	public void setStaffRankNo(int staffRankNo) {
		this.staffRankNo = staffRankNo;
	}

	public String getStaffRankName() {
		return staffRankName;
	}

	public void setStaffRankName(String staffRankName) {
		this.staffRankName = staffRankName;
	}

	public int getStepPriority() {
		return stepPriority;
	}

	public void setStepPriority(int stepPriority) {
		this.stepPriority = stepPriority;
	}

	public String getApprStatus() {
		return apprStatus;
	}

	public void setApprStatus(String apprStatus) {
		this.apprStatus = apprStatus;
	}

	@Override
	public String toString() {
		return "Step [docTempNo=" + docTempNo + ", lineNo=" + lineNo + ", staffNo=" + staffNo + ", staffName="
				+ staffName + ", staffRankNo=" + staffRankNo + ", staffRankName=" + staffRankName + ", stepPriority="
				+ stepPriority + ", apprStatus=" + apprStatus + "]";
	}
    
	
	
	
	
	
}
