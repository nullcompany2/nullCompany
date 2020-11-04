package com.kh.nullcompany.approval.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Document {
	
	private String docTmptNo;         // 임시문서번호
	private String docNo;             // 결재문서번호
	private int formNo;               // 서식번호
	private String formName;          // 서식명 --> form 조인
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
	private int staffNo;              // 결재할 사원번호
	private String rStatus;           // 문서 반려여부
	private String dStatus;           // 문서 삭제여부
	
	private ArrayList<Step> stepList; // 결재할 사원 리스트
	
	private Leave leaveInfo;          // 휴가 정보(휴가 문서일 경우)
	private Absence absenceInfo;      // 휴직 정보(휴직 문서일 경우)
	private Resign resignInfo;        // 사직 정보(사직 문서일 경우)
	
	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Document(String docTmptNo, String docNo, int formNo, String formName, int drafterNo, String drafterName,
			int drafterDeptNo, String drafterDeptName, int drafterRankNo, String drafterRankName, String dTitle,
			String dContent, String fileName, Date draftDate, Date completeDate, int staffNo, String rStatus,
			String dStatus, ArrayList<Step> stepList, Leave leaveInfo, Absence absenceInfo, Resign resignInfo) {
		super();
		this.docTmptNo = docTmptNo;
		this.docNo = docNo;
		this.formNo = formNo;
		this.formName = formName;
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
		this.staffNo = staffNo;
		this.rStatus = rStatus;
		this.dStatus = dStatus;
		this.stepList = stepList;
		this.leaveInfo = leaveInfo;
		this.absenceInfo = absenceInfo;
		this.resignInfo = resignInfo;
	}

	public String getDocTmptNo() {
		return docTmptNo;
	}

	public void setDocTmptNo(String docTmptNo) {
		this.docTmptNo = docTmptNo;
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

	public int getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
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

	public ArrayList<Step> getStepList() {
		return stepList;
	}

	public void setStepList(ArrayList<Step> stepList) {
		this.stepList = stepList;
	}

	public Leave getLeaveInfo() {
		return leaveInfo;
	}

	public void setLeaveInfo(Leave leaveInfo) {
		this.leaveInfo = leaveInfo;
	}

	public Absence getAbsenceInfo() {
		return absenceInfo;
	}

	public void setAbsenceInfo(Absence absenceInfo) {
		this.absenceInfo = absenceInfo;
	}

	public Resign getResignInfo() {
		return resignInfo;
	}

	public void setResignInfo(Resign resignInfo) {
		this.resignInfo = resignInfo;
	}

	@Override
	public String toString() {
		return "Document [docTmptNo=" + docTmptNo + ", docNo=" + docNo + ", formNo=" + formNo + ", formName=" + formName
				+ ", drafterNo=" + drafterNo + ", drafterName=" + drafterName + ", drafterDeptNo=" + drafterDeptNo
				+ ", drafterDeptName=" + drafterDeptName + ", drafterRankNo=" + drafterRankNo + ", drafterRankName="
				+ drafterRankName + ", dTitle=" + dTitle + ", dContent=" + dContent + ", fileName=" + fileName
				+ ", draftDate=" + draftDate + ", completeDate=" + completeDate + ", staffNo=" + staffNo + ", rStatus="
				+ rStatus + ", dStatus=" + dStatus + ", stepList=" + stepList + ", leaveInfo=" + leaveInfo
				+ ", absenceInfo=" + absenceInfo + ", resignInfo=" + resignInfo + "]";
	}
	
	
	
	
	
	
}
