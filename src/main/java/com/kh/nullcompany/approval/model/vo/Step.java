package com.kh.nullcompany.approval.model.vo;

public class Step {
	
	private int stepNo;        // 결재스텝번호
	private int lineNo;        // 결재선 번호
	private int memNo;         // 사원번호
	private int stepPriority;  // 결재우선순위
	
	public Step() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Step(int stepNo, int lineNo, int memNo, int stepPriority) {
		super();
		this.stepNo = stepNo;
		this.lineNo = lineNo;
		this.memNo = memNo;
		this.stepPriority = stepPriority;
	}

	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public int getLineNo() {
		return lineNo;
	}

	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getStepPriority() {
		return stepPriority;
	}

	public void setStepPriority(int stepPriority) {
		this.stepPriority = stepPriority;
	}

	@Override
	public String toString() {
		return "Step [stepNo=" + stepNo + ", lineNo=" + lineNo + ", memNo=" + memNo + ", stepPriority=" + stepPriority
				+ "]";
	}
	
	
	
}
