package com.kh.nullcompany.member.model.vo;

import java.sql.Date;

public class Member {

		private int memNo;
		private String name;
		private String id;
		private String pwd;
		private String gender;
		private int birth;
		private String phone;
		private String email;
		private String address;
		private String photo;
		private Date enrollDate;
		private Date updateDate;
		private String mStatus;
		private int annualLeave;
		private int rewardLeave;
		private String joinStatus;
		private String myInfo;
		private int deptNo;
		private int lankNo;
		private String deptName;
		private String rankName;
		private int sAccess;
		
		@Override
		public String toString() {
			return "Member [memNo=" + memNo + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", gender=" + gender
					+ ", birth=" + birth + ", phone=" + phone + ", email=" + email + ", address=" + address + ", photo="
					+ photo + ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + ", mStatus=" + mStatus
					+ ", annualLeave=" + annualLeave + ", rewardLeave=" + rewardLeave + ", joinStatus=" + joinStatus
					+ ", myInfo=" + myInfo + ", deptNo=" + deptNo + ", lankNo=" + lankNo + ", deptName=" + deptName
					+ ", rankName=" + rankName + ", sAccess=" + sAccess + "]";
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

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getPwd() {
			return pwd;
		}

		public void setPwd(String pwd) {
			this.pwd = pwd;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public int getBirth() {
			return birth;
		}

		public void setBirth(int birth) {
			this.birth = birth;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getPhoto() {
			return photo;
		}

		public void setPhoto(String photo) {
			this.photo = photo;
		}

		public Date getEnrollDate() {
			return enrollDate;
		}

		public void setEnrollDate(Date enrollDate) {
			this.enrollDate = enrollDate;
		}

		public Date getUpdateDate() {
			return updateDate;
		}

		public void setUpdateDate(Date updateDate) {
			this.updateDate = updateDate;
		}

		public String getmStatus() {
			return mStatus;
		}

		public void setmStatus(String mStatus) {
			this.mStatus = mStatus;
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

		public String getJoinStatus() {
			return joinStatus;
		}

		public void setJoinStatus(String joinStatus) {
			this.joinStatus = joinStatus;
		}

		public String getMyInfo() {
			return myInfo;
		}

		public void setMyInfo(String myInfo) {
			this.myInfo = myInfo;
		}

		public int getDeptNo() {
			return deptNo;
		}

		public void setDeptNo(int deptNo) {
			this.deptNo = deptNo;
		}

		public int getLankNo() {
			return lankNo;
		}

		public void setLankNo(int lankNo) {
			this.lankNo = lankNo;
		}

		public String getDeptName() {
			return deptName;
		}

		public void setDeptName(String deptName) {
			this.deptName = deptName;
		}

		public String getRankName() {
			return rankName;
		}

		public void setRankName(String rankName) {
			this.rankName = rankName;
		}

		public int getsAccess() {
			return sAccess;
		}

		public void setsAccess(int sAccess) {
			this.sAccess = sAccess;
		}

		public Member() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Member(int memNo, String name, String id, String pwd, String gender, int birth, String phone,
				String email, String address, String photo, Date enrollDate, Date updateDate, String mStatus,
				int annualLeave, int rewardLeave, String joinStatus, String myInfo, int deptNo, int lankNo,
				String deptName, String rankName, int sAccess) {
			super();
			this.memNo = memNo;
			this.name = name;
			this.id = id;
			this.pwd = pwd;
			this.gender = gender;
			this.birth = birth;
			this.phone = phone;
			this.email = email;
			this.address = address;
			this.photo = photo;
			this.enrollDate = enrollDate;
			this.updateDate = updateDate;
			this.mStatus = mStatus;
			this.annualLeave = annualLeave;
			this.rewardLeave = rewardLeave;
			this.joinStatus = joinStatus;
			this.myInfo = myInfo;
			this.deptNo = deptNo;
			this.lankNo = lankNo;
			this.deptName = deptName;
			this.rankName = rankName;
			this.sAccess = sAccess;
		}
		
	
		
		
}
