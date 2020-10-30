package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class RecodeLeave {
//	NO_RECODE_LEAVE
//	NAME_USE_LEAVE
//	ID_USE_LEAVE
//	EN_USE_LEAVE
//	TYPE_USE_LEAVE
//	APPLYDATE_USE_LEAVE
//	DAYS_USE_LEAVE
//	ATTACHMENT_USE_LEAVE
//	L_STATUS
	private int noRecode;
	private int memNo;
	private int typeLeave;
	private Date applyDate;
	private int useDays;
	private String attach;
	private String status;
	private Date requestedDate;
	private String reason;
	public RecodeLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecodeLeave(int noRecode, int memNo, int typeLeave, Date applyDate, int useDays, String attach,
			String status, Date requestedDate, String reason) {
		super();
		this.noRecode = noRecode;
		this.memNo = memNo;
		this.typeLeave = typeLeave;
		this.applyDate = applyDate;
		this.useDays = useDays;
		this.attach = attach;
		this.status = status;
		this.requestedDate = requestedDate;
		this.reason = reason;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
		return "RecodeLeave [noRecode=" + noRecode + ", memNo=" + memNo + ", typeLeave=" + typeLeave + ", applyDate="
				+ applyDate + ", useDays=" + useDays + ", attach=" + attach + ", status=" + status + ", requestedDate="
				+ requestedDate + ", reason=" + reason + "]";
	}
	
	
	
}
