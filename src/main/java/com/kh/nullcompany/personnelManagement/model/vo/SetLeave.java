package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class SetLeave {
	
	private String workyear;
	private int annualLeave;
	private int carryover;
	private int firstyear;
	private Date setting;
	public SetLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SetLeave(String workyear, int annualLeave) {
		super();
		this.workyear = workyear;
		this.annualLeave = annualLeave;
	}
	public SetLeave(String workyear, int annualLeave, int carryover, int firstyear, Date setting) {
		super();
		this.workyear = workyear;
		this.annualLeave = annualLeave;
		this.carryover = carryover;
		this.firstyear = firstyear;
		this.setting = setting;
	}
	public String getWorkyear() {
		return workyear;
	}
	public void setWorkyear(String workyear) {
		this.workyear = workyear;
	}
	public int getAnnualLeave() {
		return annualLeave;
	}
	public void setAnnualLeave(int annualLeave) {
		this.annualLeave = annualLeave;
	}
	public int getCarryover() {
		return carryover;
	}
	public void setCarryover(int carryover) {
		this.carryover = carryover;
	}
	public int getFirstyear() {
		return firstyear;
	}
	public void setFirstyear(int firstyear) {
		this.firstyear = firstyear;
	}
	public Date getSetting() {
		return setting;
	}
	public void setSetting(Date setting) {
		this.setting = setting;
	}
	@Override
	public String toString() {
		return "PersonnelManagement [workyear=" + workyear + ", annualLeave=" + annualLeave + ", carryover=" + carryover
				+ ", firstyear=" + firstyear + ", setting=" + setting + "]";
	}

	
}
