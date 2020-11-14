package com.kh.nullcompany.mail.model.vo;

public class Mail {
	
	private int mailNo;
	private int memNo;
	private String sender;
	private String recipient;
	private String mTitle;
	private String mFileName;
	private String mContent;
	private String sendDate;
	private String mDeleteStatus;
	private String mRealDelStatus;
	private String mSaveStatus;
	private int readCount;
	
	private String name;
	private String email;
	private String rName;
	private int count;
	
	public Mail() {}

	public Mail(int mailNo, int memNo, String sender, String recipient, String mTitle, String mFileName,
			String mContent, String sendDate, String mDeleteStatus, String mRealDelStatus, String mSaveStatus,
			int readCount, String name, String email, String rName) {
		super();
		this.mailNo = mailNo;
		this.memNo = memNo;
		this.sender = sender;
		this.recipient = recipient;
		this.mTitle = mTitle;
		this.mFileName = mFileName;
		this.mContent = mContent;
		this.sendDate = sendDate;
		this.mDeleteStatus = mDeleteStatus;
		this.mRealDelStatus = mRealDelStatus;
		this.mSaveStatus = mSaveStatus;
		this.readCount = readCount;
		this.name = name;
		this.email = email;
		this.rName = rName;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
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

	public String getmDeleteStatus() {
		return mDeleteStatus;
	}

	public void setmDeleteStatus(String mDeleteStatus) {
		this.mDeleteStatus = mDeleteStatus;
	}

	public String getmRealDelStatus() {
		return mRealDelStatus;
	}

	public void setmRealDelStatus(String mRealDelStatus) {
		this.mRealDelStatus = mRealDelStatus;
	}

	public String getmSaveStatus() {
		return mSaveStatus;
	}

	public void setmSaveStatus(String mSaveStatus) {
		this.mSaveStatus = mSaveStatus;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	@Override
	public String toString() {
		return "Mail [mailNo=" + mailNo + ", memNo=" + memNo + ", sender=" + sender + ", recipient=" + recipient
				+ ", mTitle=" + mTitle + ", mFileName=" + mFileName + ", mContent=" + mContent + ", sendDate="
				+ sendDate + ", mDeleteStatus=" + mDeleteStatus + ", mRealDelStatus=" + mRealDelStatus
				+ ", mSaveStatus=" + mSaveStatus + ", readCount=" + readCount + ", name=" + name + ", email=" + email
				+ ", rName=" + rName + "]";
	}
	
}
