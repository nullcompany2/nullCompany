package com.kh.nullcompany.mail.model.vo;

public class Mail {
	
	private int memNo; 
	private String name;
	private String sender;
	private String recipient;
	private String mTitle;
	private String mFileName;
	private String mContent;
	private String sendDate;
	private String saveStatus;
	private String mDeleteStatus;
	private int mailNo;
	private int senderNo;
	
	public Mail() {}

	public Mail(int memNo, String name, String sender, String recipient, String mTitle, String mFileName,
			String mContent, String sendDate, String saveStatus, String mDeleteStatus, int mailNo, int senderNo) {
		super();
		this.memNo = memNo;
		this.name = name;
		this.sender = sender;
		this.recipient = recipient;
		this.mTitle = mTitle;
		this.mFileName = mFileName;
		this.mContent = mContent;
		this.sendDate = sendDate;
		this.saveStatus = saveStatus;
		this.mDeleteStatus = mDeleteStatus;
		this.mailNo = mailNo;
		this.senderNo = senderNo;
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

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmFileName() {
		return mFileName;
	}

	public void setmFileName(String mFileName) {
		this.mFileName = mFileName;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getSaveStatus() {
		return saveStatus;
	}

	public void setSaveStatus(String saveStatus) {
		this.saveStatus = saveStatus;
	}

	public String getmDeleteStatus() {
		return mDeleteStatus;
	}

	public void setmDeleteStatus(String mDeleteStatus) {
		this.mDeleteStatus = mDeleteStatus;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	@Override
	public String toString() {
		return "Mail [memNo=" + memNo + ", name=" + name + ", sender=" + sender + ", recipient=" + recipient
				+ ", mTitle=" + mTitle + ", mFileName=" + mFileName + ", mContent=" + mContent + ", sendDate="
				+ sendDate + ", saveStatus=" + saveStatus + ", mDeleteStatus=" + mDeleteStatus + ", mailNo=" + mailNo
				+ ", senderNo=" + senderNo + "]";
	}

	
}
