package com.kh.nullcompany.personnelManagement.model.vo;

public class Rank {
	private int rankNo;
	private String rankName;
	private int orderByRank;
	
	public int getOrderByRank() {
		return orderByRank;
	}
	public void setOrderByRank(int orderByRank) {
		this.orderByRank = orderByRank;
	}
	public Rank() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rank(int rankNo, String rankName) {
		super();
		this.rankNo = rankNo;
		this.rankName = rankName;
	}
	public int getRankNo() {
		return rankNo;
	}
	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	@Override
	public String toString() {
		return "Rank [rankNo=" + rankNo + ", rankName=" + rankName + "]";
	}

	
}
