package com.kh.nullcompany.personnelManagement.model.vo;

public class DiligenceCountAllMember {
	private int lateCountY;
	private int lateMemberCountY;
	private int absenceCountY;
	private int absenceMemberCountY;
	private int modificationCountY;
	private int lateCountM;
	private int lateMemberCountM;
	private int absenceCountM;
	private int absenceMemberCountM;
	private int modificationCountM;
	public DiligenceCountAllMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiligenceCountAllMember(int lateCountY, int lateMemberCountY, int absenceCountY, int absenceMemberCountY,
			int modificationCountY, int lateCountM, int lateMemberCountM, int absenceCountM, int absenceMemberCountM,
			int modificationCountM) {
		super();
		this.lateCountY = lateCountY;
		this.lateMemberCountY = lateMemberCountY;
		this.absenceCountY = absenceCountY;
		this.absenceMemberCountY = absenceMemberCountY;
		this.modificationCountY = modificationCountY;
		this.lateCountM = lateCountM;
		this.lateMemberCountM = lateMemberCountM;
		this.absenceCountM = absenceCountM;
		this.absenceMemberCountM = absenceMemberCountM;
		this.modificationCountM = modificationCountM;
	}
	public int getLateCountY() {
		return lateCountY;
	}
	public void setLateCountY(int lateCountY) {
		this.lateCountY = lateCountY;
	}
	public int getLateMemberCountY() {
		return lateMemberCountY;
	}
	public void setLateMemberCountY(int lateMemberCountY) {
		this.lateMemberCountY = lateMemberCountY;
	}
	public int getAbsenceCountY() {
		return absenceCountY;
	}
	public void setAbsenceCountY(int absenceCountY) {
		this.absenceCountY = absenceCountY;
	}
	public int getAbsenceMemberCountY() {
		return absenceMemberCountY;
	}
	public void setAbsenceMemberCountY(int absenceMemberCountY) {
		this.absenceMemberCountY = absenceMemberCountY;
	}
	public int getModificationCountY() {
		return modificationCountY;
	}
	public void setModificationCountY(int modificationCountY) {
		this.modificationCountY = modificationCountY;
	}
	public int getLateCountM() {
		return lateCountM;
	}
	public void setLateCountM(int lateCountM) {
		this.lateCountM = lateCountM;
	}
	public int getLateMemberCountM() {
		return lateMemberCountM;
	}
	public void setLateMemberCountM(int lateMemberCountM) {
		this.lateMemberCountM = lateMemberCountM;
	}
	public int getAbsenceCountM() {
		return absenceCountM;
	}
	public void setAbsenceCountM(int absenceCountM) {
		this.absenceCountM = absenceCountM;
	}
	public int getAbsenceMemberCountM() {
		return absenceMemberCountM;
	}
	public void setAbsenceMemberCountM(int absenceMemberCountM) {
		this.absenceMemberCountM = absenceMemberCountM;
	}
	public int getModificationCountM() {
		return modificationCountM;
	}
	public void setModificationCountM(int modificationCountM) {
		this.modificationCountM = modificationCountM;
	}
	@Override
	public String toString() {
		return "DiligenceCountAllMember [lateCountY=" + lateCountY + ", lateMemberCountY=" + lateMemberCountY
				+ ", absenceCountY=" + absenceCountY + ", absenceMemberCountY=" + absenceMemberCountY
				+ ", modificationCountY=" + modificationCountY + ", lateCountM=" + lateCountM + ", lateMemberCountM="
				+ lateMemberCountM + ", absenceCountM=" + absenceCountM + ", absenceMemberCountM=" + absenceMemberCountM
				+ ", modificationCountM=" + modificationCountM + "]";
	}
	
	
}
