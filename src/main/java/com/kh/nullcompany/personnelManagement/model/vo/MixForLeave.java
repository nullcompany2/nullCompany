package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class MixForLeave {
	
	private int noType;
	private String nameType;
	private String annualUse;
	private String status;
	private int noRecode;
	private int memNo;
	private int typeLeave;
	private Date applyDate;
	private int useDays;
	private String attach;
	private Date requestedDate;
	private String reason;
	public MixForLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MixForLeave(int noType, String nameType, String annualUse, String status, int noRecode, int memNo,
			int typeLeave, Date applyDate, int useDays, String attach, Date requestedDate, String reason) {
		super();
		this.noType = noType;
		this.nameType = nameType;
		this.annualUse = annualUse;
		this.status = status;
		this.noRecode = noRecode;
		this.memNo = memNo;
		this.typeLeave = typeLeave;
		this.applyDate = applyDate;
		this.useDays = useDays;
		this.attach = attach;
		this.requestedDate = requestedDate;
		this.reason = reason;
	}
	public int getNoType() {
		return noType;
	}
	public void setNoType(int noType) {
		this.noType = noType;
	}
	public String getNameType() {
		return nameType;
	}
	public void setNameType(String nameType) {
		this.nameType = nameType;
	}
	public String getAnnualUse() {
		return annualUse;
	}
	public void setAnnualUse(String annualUse) {
		this.annualUse = annualUse;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNoRecode() {
		return noRecode;
	}
	public void setNoRecode(int noRecode) {
		this.noRecode = noRecode;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getTypeLeave() {
		return typeLeave;
	}
	public void setTypeLeave(int typeLeave) {
		this.typeLeave = typeLeave;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public int getUseDays() {
		return useDays;
	}
	public void setUseDays(int useDays) {
		this.useDays = useDays;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public Date getRequestedDate() {
		return requestedDate;
	}
	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "MixForLeave [noType=" + noType + ", nameType=" + nameType + ", annualUse=" + annualUse + ", status="
				+ status + ", noRecode=" + noRecode + ", memNo=" + memNo + ", typeLeave=" + typeLeave + ", applyDate="
				+ applyDate + ", useDays=" + useDays + ", attach=" + attach + ", requestedDate=" + requestedDate
				+ ", reason=" + reason + "]";
	}
	
	
	

}
