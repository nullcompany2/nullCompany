package com.kh.nullcompany.personnelManagement.model.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Absence;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.DiligenceCountAllMember;
import com.kh.nullcompany.personnelManagement.model.vo.ForEmLeave;
import com.kh.nullcompany.personnelManagement.model.vo.ForEmUsedLeave;
import com.kh.nullcompany.personnelManagement.model.vo.MixForLeave;
import com.kh.nullcompany.personnelManagement.model.vo.ModificationDiligence;
import com.kh.nullcompany.personnelManagement.model.vo.RecordDiligence;
import com.kh.nullcompany.personnelManagement.model.vo.RecordLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RewardLeave;
import com.kh.nullcompany.personnelManagement.model.vo.SetAttendance;
import com.kh.nullcompany.personnelManagement.model.vo.SetLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeUsedLeave;

@Repository("pDao")
public class PersonnelManagementDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public int leaveCalculate(String workyear) {
		
		return sqlSession.selectOne("personnelMapper.leaveCalculdate",workyear);
	}


	public int lateCountM(int memNo) {
		return sqlSession.selectOne("personnelMapper.lateCountM",memNo);
	}


	public int lateCountY(int memNo) {
		return sqlSession.selectOne("personnelMapper.lateCountY",memNo);
	}


	public ArrayList<Department> deptList() {
		return (ArrayList)sqlSession.selectList("personnelMapper.deptList");
	}


	public ArrayList<Member> deptAllMemberList() {
		return (ArrayList)sqlSession.selectList("personnelMapper.deptAllMemberList");
	}


	public Member detailMemberInfo(int memNo) {
		return sqlSession.selectOne("personnelMapper.detailMemberInfo",memNo);
	}


	public ArrayList searchMemberById(String searchText) {
		return (ArrayList)sqlSession.selectList("personnelMapper.searchMemberById",searchText);
	}


	public int rewardLeave(int memNo) {
		return sqlSession.selectOne("personnelMapper.rewardLeave",memNo);
	}


	public int usedRewardLeave(int memNo) {
		return sqlSession.selectOne("personnelMapper.usedRewardLeave",memNo);
	}


	public int usedAnnualLeave(int memNo) {
		return sqlSession.selectOne("personnelMapper.usedAnnualLeave",memNo);
	}


	public int updateLeave(Map updatemap) {
		return sqlSession.update("personnelMapper.updateLeave",updatemap);
	}


	public ArrayList<RewardLeave> createdReward(int memNo) {
		return ((ArrayList)sqlSession.selectList("personnelMapper.createdReward",memNo));
	}


	public ArrayList<RecordLeave> applyLeave(int memNo) {
		return ((ArrayList)sqlSession.selectList("personnelMapper.applyLeave",memNo));
	}


	public ArrayList<TypeLeave> typeLeave() {
		return ((ArrayList)sqlSession.selectList("personnelMapper.typeLeave"));
	}


	public ArrayList<MixForLeave> mixLeave(int memNo) {
		return ((ArrayList)sqlSession.selectList("personnelMapper.mixLeave",memNo));
	}


	public ArrayList<TypeUsedLeave> tul(int memNo) {
		return ((ArrayList)sqlSession.selectList("personnelMapper.tul",memNo));
	}


	public MixForLeave detailRecordLeave(int noRecord) {
		return sqlSession.selectOne("personnelMapper.detailRecordLeave",noRecord);
	}


	public SetLeave firstyearLeave() {
		return sqlSession.selectOne("personnelMapper.firstyearLeave");
	}


	public SetAttendance setAttendance() {
		return sqlSession.selectOne("personnelMapper.setAttendance");
	}


	public int RecordAB_A(int memNo) {
		return sqlSession.selectOne("personnelMapper.recordAB_A",memNo);
	}


	public int RecordRA(Map forR) {
		return sqlSession.insert("personnelMapper.recordRA",forR);
	}


	public int RecordAB_O(int memNo) {
		return sqlSession.selectOne("personnelMapper.recordAB_O",memNo);
	}


	public int RecordRO(Map forR) {
		return sqlSession.update("personnelMapper.recordRO",forR);
	}


	public RecordDiligence RecordToday(int memNo) {
		return sqlSession.selectOne("personnelMapper.recordToday",memNo);
	}


	public int noCheckOffwork(int memNo) {
		return sqlSession.selectOne("personnelMapper.noCheckOffwork",memNo);
	}


	public int noAttendanceCount(int memNo) {
		return sqlSession.selectOne("personnelMapper.noAttendanceCount",memNo);
	}


	public ArrayList<RecordDiligence> searchDiligenceYM(Map forsearchYM, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();	
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return ((ArrayList)sqlSession.selectList("personnelMapper.searchDiligenceYM",forsearchYM,rowBounds));
	}


	public int dListCount(Map forsearchYM) {
		return sqlSession.selectOne("personnelMapper.dListCount",forsearchYM);
	}


	public ArrayList<SetLeave> setLeaveStandard() {
		return (ArrayList)sqlSession.selectList("personnelMapper.setLeaveStandard");
	}


	public int fixSetLeave(ArrayList newLeaveArr, ArrayList setAnnualLeave, int firstyear) {
		int re = 0;
		
		for(int j=0; j<3; j++) {
			switch(j) {
			case 0 : for(int i =0; i<newLeaveArr.size();i++) {
						Object newLeave = newLeaveArr.indexOf(i);
						System.out.println(newLeave);
						re= sqlSession.insert("personnelMapper.newLeaveArr",newLeaveArr);
						System.out.println(re);
					}
			case 1 : re= sqlSession.update("personnelMapper.setAnnualLeave",setAnnualLeave);
			case 2 : re= sqlSession.update("personnelMapper.firstyear",firstyear);
			}			
		}
		return re;
	}


	public ArrayList<ForEmLeave> emAllMember() {
		return (ArrayList)sqlSession.selectList("personnelMapper.emAllMember");
	}


	public ArrayList<ForEmUsedLeave> usedLeave() {
		return (ArrayList)sqlSession.selectList("personnelMapper.usedLeave");
	}

	
	public int updateLeaveSetting(ArrayList<SetLeave> setLeave) {
		int result = 0;
		for(SetLeave set : setLeave) {
			result = sqlSession.update("personnelMapper.updateLeaveSetting",set);			
		}
		return result;
	}


	public int insertLeaveType(ArrayList<TypeLeave> newLeave) {
		int result = 0;
		for(TypeLeave i : newLeave) {
			result = sqlSession.insert("personnelMapper.insertLeaveType",i);
		}
		return result;
	}


	public int reduceAnnualLeave(Map changeAL) {
		return sqlSession.insert("personnelMapper.reduceAnnualLeave",changeAL);
	}


	public int reduceRewardLeave(Map changeRL) {
		return sqlSession.insert("personnelMapper.reduceRewardLeave",changeRL);
	}


	public RecordDiligence recordDiligence(int noDiligence) {
		return sqlSession.selectOne("personnelMapper.recordDiligence",noDiligence);
	}


	public int modificationDiligence(ModificationDiligence mod) {
		return sqlSession.insert("personnelMapper.modificationDiligence",mod);
	}


	public ArrayList<ModificationDiligence> selectRecordModification(int memNo) {
		return(ArrayList)sqlSession.selectList("personnelMapper.selectRecordModification",memNo);
	}


	public int cancelMod(int noMod) {
		return sqlSession.update("personnelMapper.cancelMod",noMod);
	}


	public ArrayList<RecordDiligence> recordDiligenceList(int memNo) {
		return (ArrayList)sqlSession.selectList("personnelMapper.recordDiligenceList",memNo);
	}


	public ArrayList<SetAttendance> AttendanceDays() {
		return (ArrayList)sqlSession.selectList("personnelMapper.AttendanceDays");
	}


	public ArrayList<Member> selectTargetReward(Map searchCondition) {
		if(searchCondition.get("sDate") == "") {
			String sDate = "2001-01-01";
			Date today = new Date();
			searchCondition.put("sDate",sDate);
			searchCondition.put("eDate", today);
			
			System.out.println(searchCondition.get("sDate"));
		}
		return (ArrayList)sqlSession.selectList("personnelMapper.selectTargetReward",searchCondition);
	}


	public int grantReward(Map cR) {
		return sqlSession.insert("personnelMapper.grantReward",cR);
	}


	public ArrayList<SetAttendance> setDiligenceStandard() {
		return (ArrayList)sqlSession.selectList("personnelMapper.setDiligenceStandard");
	}


	public int updateAttendance(Map setA) {
		return sqlSession.update("personnelMapper.updateAttendance",setA);
	}

	// 휴가설정  - 휴가 사용여부 및 연차차감 설정 업데이트
	public int updateLeaveType(ArrayList<TypeLeave> leaveTypeSetting) {
		int re = 0;
		for(TypeLeave i : leaveTypeSetting) {
			re = sqlSession.update("personnelMapper.updateLeaveType",i);
		}
		
		return re;
	}


	public ArrayList<Absence> absenceList() {
		return (ArrayList)sqlSession.selectList("personnelMapper.absenceList");
	}


	public int returnToWork(int memNo) {
		return sqlSession.update("personnelMapper.returnToWork",memNo);
	}


	public ArrayList<Member> selectAllMember() {
		return (ArrayList)sqlSession.selectList("personnelMapper.selectAllMember");
	}


	public DiligenceCountAllMember DiligenceCountAllMember() {
		return sqlSession.selectOne("personnelMapper.DiligenceCountAllMember");
	}


	public ArrayList<ModificationDiligence> modRequestList() {
		return (ArrayList)sqlSession.selectList("personnelMapper.modRequestList");
	}


	public int modificationAcknowledgment(int noMod) {
		int result=0;
		result = sqlSession.update("personnelMapper.modificationAcknowledgment",noMod);
		result = sqlSession.update("personnelMapper.updateRecordDiligence",noMod);
		return result;
	}


	public int modificationCancel(int noMod) {
		return sqlSession.update("personnelMapper.modificationCancel",noMod);
	}


	

	


}
