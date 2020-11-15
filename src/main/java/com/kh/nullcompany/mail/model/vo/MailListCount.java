package com.kh.nullcompany.mail.model.vo;

public class MailListCount {
	
	private int reCount;
	private int unreadCount;
	private int saveCount;
	
	public MailListCount() {}

	public MailListCount(int reCount, int unreadCount, int saveCount) {
		super();
		this.reCount = reCount;
		this.unreadCount = unreadCount;
		this.saveCount = saveCount;
	}

	public int getReCount() {
		return reCount;
	}

	public void setReCount(int reCount) {
		this.reCount = reCount;
	}

	public int getUnreadCount() {
		return unreadCount;
	}

	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}

	public int getSaveCount() {
		return saveCount;
	}

	public void setSaveCount(int saveCount) {
		this.saveCount = saveCount;
	}

	@Override
	public String toString() {
		return "MailListCount [reCount=" + reCount + ", unreadCount=" + unreadCount + ", saveCount=" + saveCount + "]";
	}
	
	

}
