package com.kh.nullcompany.approval.model.vo;

public class DocumentListCount {

	private int standByDocCount;
	private int checkDocCount;
	private int progressDocCount;
	
	public DocumentListCount() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DocumentListCount(int standByDocCount, int checkDocCount, int progressDocCount) {
		super();
		this.standByDocCount = standByDocCount;
		this.checkDocCount = checkDocCount;
		this.progressDocCount = progressDocCount;
	}

	public int getStandByDocCount() {
		return standByDocCount;
	}

	public void setStandByDocCount(int standByDocCount) {
		this.standByDocCount = standByDocCount;
	}

	public int getCheckDocCount() {
		return checkDocCount;
	}

	public void setCheckDocCount(int checkDocCount) {
		this.checkDocCount = checkDocCount;
	}

	public int getProgressDocCount() {
		return progressDocCount;
	}

	public void setProgressDocCount(int progressDocCount) {
		this.progressDocCount = progressDocCount;
	}

	@Override
	public String toString() {
		return "DocumentListCount [standByDocCount=" + standByDocCount + ", checkDocCount=" + checkDocCount
				+ ", progressDocCount=" + progressDocCount + "]";
	}

}
