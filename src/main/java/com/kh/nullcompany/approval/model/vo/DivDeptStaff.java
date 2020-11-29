package com.kh.nullcompany.approval.model.vo;

public class DivDeptStaff {
	
	private int memNo;
	private String name;
	private int rankNo;
	private String rankName;
	
	public DivDeptStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DivDeptStaff(int memNo, String name, int rankNo, String rankName) {
		super();
		this.memNo = memNo;
		this.name = name;
		this.rankNo = rankNo;
		this.rankName = rankName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "DivDeptStaff [memNo=" + memNo + ", name=" + name + ", rankNo=" + rankNo + ", rankName=" + rankName
				+ "]";
	}
	
	
	
}
