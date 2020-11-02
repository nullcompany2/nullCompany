package com.kh.nullcompany.mail.model.vo;

public class SaveMail {

	private int memNo; 
	private String name;
	private String sender;
	private String recipient;
	private String sTitle;
	private String sContent;
	private String sFileName;
	private String saveDate;
	private String sDeleteStatus;
	private int mailNo;
	private int senderNo;
	
	public SaveMail() {}

	public SaveMail(int memNo, String name, String sender, String recipient, String sTitle, String sContent,
			String sFileName, String saveDate, String sDeleteStatus, int mailNo, int senderNo) {
		super();
		this.memNo = memNo;
		this.name = name;
		this.sender = sender;
		this.recipient = recipient;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sFileName = sFileName;
		this.saveDate = saveDate;
		this.sDeleteStatus = sDeleteStatus;
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

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public String getsFileName() {
		return sFileName;
	}

	public void setsFileName(String sFileName) {
		this.sFileName = sFileName;
	}

	public String getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}

	public String getsDeleteStatus() {
		return sDeleteStatus;
	}

	public void setsDeleteStatus(String sDeleteStatus) {
		this.sDeleteStatus = sDeleteStatus;
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
		return "SaveMail [memNo=" + memNo + ", name=" + name + ", sender=" + sender + ", recipient=" + recipient
				+ ", sTitle=" + sTitle + ", sContent=" + sContent + ", sFileName=" + sFileName + ", saveDate="
				+ saveDate + ", sDeleteStatus=" + sDeleteStatus + ", mailNo=" + mailNo + ", senderNo=" + senderNo + "]";
	}
	
	
}
