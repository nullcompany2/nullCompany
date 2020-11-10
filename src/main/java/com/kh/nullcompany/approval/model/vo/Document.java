package com.kh.nullcompany.approval.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Document {
	
	private String docTempNo;         // 임시문서번호
	private String docNo;             // 결재문서번호
	private int formNo;               // 서식번호
	private String formName;          // 서식명 --> form 조인
	private String formCode;          // 서식코드 --> form 조인 (결재문서번호와 합치기)
	private int drafterNo;            // 기안자 사원번호
	private String drafterName;       // 기안자 사원명--> member 조인
	private int drafterDeptNo;        // 기안자 부서번호
	private String drafterDeptName;   // 기안자 부서명--> department 조인
	private int drafterRankNo;        // 기안자 직급번호
	private String drafterRankName;   // 기안자 직급명--> rank 조인
	private String dTitle;            // 제목
	private String dContent;          // 내용
	private String fileName;          // 첨부파일명
	private Date draftDate;           // 기안일
	private Date completeDate;        // 완료일
	private int turnNo;               // 결재순서
	private String rStatus;           // 문서 반려여부
	private String dStatus;           // 문서 삭제여부
	private String sStatus;           // 사용자가 보는 상태값
	private int stepCount;            // 문서 결재자 수
	
	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Document(String docTempNo, String docNo, int formNo, String formName, String formCode, int drafterNo,
			String drafterName, int drafterDeptNo, String drafterDeptName, int drafterRankNo, String drafterRankName,
			String dTitle, String dContent, String fileName, Date draftDate, Date completeDate, int turnNo,
			String rStatus, String dStatus, String sStatus, int stepCount) {
		super();
		this.docTempNo = docTempNo;
		this.docNo = docNo;
		this.formNo = formNo;
		this.formName = formName;
		this.formCode = formCode;
		this.drafterNo = drafterNo;
		this.drafterName = drafterName;
		this.drafterDeptNo = drafterDeptNo;
		this.drafterDeptName = drafterDeptName;
		this.drafterRankNo = drafterRankNo;
		this.drafterRankName = drafterRankName;
		this.dTitle = dTitle;
		this.dContent = dContent;
		this.fileName = fileName;
		this.draftDate = draftDate;
		this.completeDate = completeDate;
		this.turnNo = turnNo;
		this.rStatus = rStatus;
		this.dStatus = dStatus;
		this.sStatus = sStatus;
		this.stepCount = stepCount;
	}

	public String getDocTempNo() {
		return docTempNo;
	}

	public void setDocTempNo(String docTempNo) {
		this.docTempNo = docTempNo;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public int getFormNo() {
		return formNo;
	}

	public void setFormNo(int formNo) {
		this.formNo = formNo;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getFormCode() {
		return formCode;
	}

	public void setFormCode(String formCode) {
		this.formCode = formCode;
	}

	public int getDrafterNo() {
		return drafterNo;
	}

	public void setDrafterNo(int drafterNo) {
		this.drafterNo = drafterNo;
	}

	public String getDrafterName() {
		return drafterName;
	}

	public void setDrafterName(String drafterName) {
		this.drafterName = drafterName;
	}

	public int getDrafterDeptNo() {
		return drafterDeptNo;
	}

	public void setDrafterDeptNo(int drafterDeptNo) {
		this.drafterDeptNo = drafterDeptNo;
	}

	public String getDrafterDeptName() {
		return drafterDeptName;
	}

	public void setDrafterDeptName(String drafterDeptName) {
		this.drafterDeptName = drafterDeptName;
	}

	public int getDrafterRankNo() {
		return drafterRankNo;
	}

	public void setDrafterRankNo(int drafterRankNo) {
		this.drafterRankNo = drafterRankNo;
	}

	public String getDrafterRankName() {
		return drafterRankName;
	}

	public void setDrafterRankName(String drafterRankName) {
		this.drafterRankName = drafterRankName;
	}

	public String getdTitle() {
		return dTitle;
	}

	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getDraftDate() {
		return draftDate;
	}

	public void setDraftDate(Date draftDate) {
		this.draftDate = draftDate;
	}

	public Date getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(Date completeDate) {
		this.completeDate = completeDate;
	}

	public int getTurnNo() {
		return turnNo;
	}

	public void setTurnNo(int turnNo) {
		this.turnNo = turnNo;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public int getStepCount() {
		return stepCount;
	}

	public void setStepCount(int stepCount) {
		this.stepCount = stepCount;
	}

	@Override
	public String toString() {
		return "Document [docTempNo=" + docTempNo + ", docNo=" + docNo + ", formNo=" + formNo + ", formName=" + formName
				+ ", formCode=" + formCode + ", drafterNo=" + drafterNo + ", drafterName=" + drafterName
				+ ", drafterDeptNo=" + drafterDeptNo + ", drafterDeptName=" + drafterDeptName + ", drafterRankNo="
				+ drafterRankNo + ", drafterRankName=" + drafterRankName + ", dTitle=" + dTitle + ", dContent="
				+ dContent + ", fileName=" + fileName + ", draftDate=" + draftDate + ", completeDate=" + completeDate
				+ ", turnNo=" + turnNo + ", rStatus=" + rStatus + ", dStatus=" + dStatus + ", sStatus=" + sStatus
				+ ", stepCount=" + stepCount + "]";
	}

	
}
