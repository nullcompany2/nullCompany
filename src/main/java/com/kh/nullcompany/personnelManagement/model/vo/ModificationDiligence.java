package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class ModificationDiligence {
//	NO_MOD_D
//	DATE_APPLY_D
//	NAME_REQUESTER_D
//	ID_REQUESTER_D
//	EN_REQUESTER_D
//	DATE_MOD_D
//	STAUTS_MOD_D
//	REASON_MOD_D
//	ATTACHMENT_MOD_D
	private int noMod;
	private Date dateApply;
	private String name;
	private String id;
	private int memNo;
	private Date dateMod;
	private String statusMod;
	private String reasonMod;
	private String originalAttachmentMod;
	private String renameAttachmentMod;
	private String timeEnter;
	private String timeExit;
	private String statusDiligence;
	public ModificationDiligence() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ModificationDiligence(int noMod, Date dateApply, String name, String id, int memNo, Date dateMod,
			String statusMod, String reasonMod, String originalAttachmentMod, String renameAttachmentMod,
			String timeEnter, String timeExit, String statusDiligence) {
		super();
		this.noMod = noMod;
		this.dateApply = dateApply;
		this.name = name;
		this.id = id;
		this.memNo = memNo;
		this.dateMod = dateMod;
		this.statusMod = statusMod;
		this.reasonMod = reasonMod;
		this.originalAttachmentMod = originalAttachmentMod;
		this.renameAttachmentMod = renameAttachmentMod;
		this.timeEnter = timeEnter;
		this.timeExit = timeExit;
		this.statusDiligence = statusDiligence;
	}
	public int getNoMod() {
		return noMod;
	}
	public void setNoMod(int noMod) {
		this.noMod = noMod;
	}
	public Date getDateApply() {
		return dateApply;
	}
	public void setDateApply(Date dateApply) {
		this.dateApply = dateApply;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public Date getDateMod() {
		return dateMod;
	}
	public void setDateMod(Date dateMod) {
		this.dateMod = dateMod;
	}
	public String getStatusMod() {
		return statusMod;
	}
	public void setStatusMod(String statusMod) {
		this.statusMod = statusMod;
	}
	public String getReasonMod() {
		return reasonMod;
	}
	public void setReasonMod(String reasonMod) {
		this.reasonMod = reasonMod;
	}
	public String getOriginalAttachmentMod() {
		return originalAttachmentMod;
	}
	public void setOriginalAttachmentMod(String originalAttachmentMod) {
		this.originalAttachmentMod = originalAttachmentMod;
	}
	public String getRenameAttachmentMod() {
		return renameAttachmentMod;
	}
	public void setRenameAttachmentMod(String renameAttachmentMod) {
		this.renameAttachmentMod = renameAttachmentMod;
	}
	public String getTimeEnter() {
		return timeEnter;
	}
	public void setTimeEnter(String timeEnter) {
		this.timeEnter = timeEnter;
	}
	public String getTimeExit() {
		return timeExit;
	}
	public void setTimeExit(String timeExit) {
		this.timeExit = timeExit;
	}
	public String getStatusDiligence() {
		return statusDiligence;
	}
	public void setStatusDiligence(String statusDiligence) {
		this.statusDiligence = statusDiligence;
	}
	@Override
	public String toString() {
		return "ModificationDiligence [noMod=" + noMod + ", dateApply=" + dateApply + ", name=" + name + ", id=" + id
				+ ", memNo=" + memNo + ", dateMod=" + dateMod + ", statusMod=" + statusMod + ", reasonMod=" + reasonMod
				+ ", originalAttachmentMod=" + originalAttachmentMod + ", renameAttachmentMod=" + renameAttachmentMod
				+ ", timeEnter=" + timeEnter + ", timeExit=" + timeExit + ", statusDiligence=" + statusDiligence + "]";
	}
	
	
	
	
}
