package com.kh.nullcompany.personnelManagement.model.vo;

import java.util.Date;

public class RewardLeave {
//	NO_R_LEAVE
//	NAME_R_LEAVE
//	ID_R_LEAVE
//	EN_R_LEAVE
//	DAYS_R_LEAVE
//	CREATEDATE_R_LEAVE
	private int noReward;
	private int memNo;
	private int rewardDays;
	private Date createDate;
	public RewardLeave() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RewardLeave(int noReward, int memNo, int rewardDays, Date createDate) {
		super();
		this.noReward = noReward;
		this.memNo = memNo;
		this.rewardDays = rewardDays;
		this.createDate = createDate;
	}
	public int getNoReward() {
		return noReward;
	}
	public void setNoReward(int noReward) {
		this.noReward = noReward;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getRewardDays() {
		return rewardDays;
	}
	public void setRewardDays(int rewardDays) {
		this.rewardDays = rewardDays;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "RewardLeave [noReward=" + noReward + ", memNo=" + memNo + ", rewardDays=" + rewardDays + ", createDate="
				+ createDate + "]";
	}
	
	
	

}
