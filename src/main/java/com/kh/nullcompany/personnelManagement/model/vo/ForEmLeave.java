package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class ForEmLeave {
	private int memNo;
	private Date enrollDate;
	private String name;
	private int annualLeave;
	private int rewardLeave;
	private int remainAnnual;
	private int remainReward;
	private String workyear;
	public ForEmLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ForEmLeave(int memNo, Date enrollDate, String name, int annualLeave, int rewardLeave, int remainAnnual,
			int remainReward, String workyear) {
		super();
		this.memNo = memNo;
		this.enrollDate = enrollDate;
		this.name = name;
		this.annualLeave = annualLeave;
		this.rewardLeave = rewardLeave;
		this.remainAnnual = remainAnnual;
		this.remainReward = remainReward;
		this.workyear = workyear;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAnnualLeave() {
		return annualLeave;
	}
	public void setAnnualLeave(int annualLeave) {
		this.annualLeave = annualLeave;
	}
	public int getRewardLeave() {
		return rewardLeave;
	}
	public void setRewardLeave(int rewardLeave) {
		this.rewardLeave = rewardLeave;
	}
	public int getRemainAnnual() {
		return remainAnnual;
	}
	public void setRemainAnnual(int remainAnnual) {
		this.remainAnnual = remainAnnual;
	}
	public int getRemainReward() {
		return remainReward;
	}
	public void setRemainReward(int remainReward) {
		this.remainReward = remainReward;
	}
	public String getWorkyear() {
		return workyear;
	}
	public void setWorkyear(String workyear) {
		this.workyear = workyear;
	}
	@Override
	public String toString() {
		return "ForEmLeave [memNo=" + memNo + ", enrollDate=" + enrollDate + ", name=" + name + ", annualLeave="
				+ annualLeave + ", rewardLeave=" + rewardLeave + ", remainAnnual=" + remainAnnual + ", remainReward="
				+ remainReward + ", workyear=" + workyear + "]";
	}
	
			
	
}
