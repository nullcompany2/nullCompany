package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.dao.PersonnelManagementDao;
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
import com.kh.nullcompany.personnelManagement.model.vo.SelectedMemberDiligenceCount;
import com.kh.nullcompany.personnelManagement.model.vo.SetAttendance;
import com.kh.nullcompany.personnelManagement.model.vo.SetLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeUsedLeave;

@Service("pService")
public class PersonnelManagementServiceImpl implements PersonnelManagementService{

	@Autowired
	private PersonnelManagementDao pDao;

	/**
	 * 연차 생성 계산
	 */
	@Override
	public int leaveCalculate(String workyear) {
		return pDao.leaveCalculate(workyear);
	}

	/**
	 * 지각 월
	 */
	@Override
	public int lateCountM(int memNo) {
		return pDao.lateCountM(memNo);
	}

	/**
	 * 지각 년
	 */
	@Override
	public int lateCountY(int memNo) {
		return pDao.lateCountY(memNo);
	}

	/**
	 * 부서리스트
	 */
	@Override
	public ArrayList<Department> deptList() {
		return pDao.deptList();
	}

	/**
	 * 조직도 모든직원
	 */
	@Override
	public ArrayList<Member> deptAllMemberList() {
		return pDao.deptAllMemberList();
	}

	/**
	 * 직원 상세
	 */
	@Override
	public Member detailMemberInfo(int memNo) {
		return pDao.detailMemberInfo(memNo);
	}

	/**
	 * 사번/이름으로 검색
	 */
	@Override
	public ArrayList searchMemberById(String searchText) {
		return pDao.searchMemberById(searchText);
	}

	/**
	 * 포상휴가 생성 수
	 */
	@Override
	public int rewardLeave(int memNo) {
		return pDao.rewardLeave(memNo);
	}

	

	/**
	 * 사용된 포상 수
	 */
	@Override
	public int usedRewardLeave(int memNo) {
		return pDao.usedRewardLeave(memNo);
	}

	/**
	 * 사용된 연차 수
	 */
	@Override
	public int usedAnnualLeave(int memNo) {
		return pDao.usedAnnualLeave(memNo);
	}

	/**
	 * 사원 휴가 업데이트
	 */
	@Override
	public int updateLeave(Map updatemap) {
		return pDao.updateLeave(updatemap);
	}

	/**
	 * 생성된 포상휴가 리스트
	 */
	@Override
	public ArrayList<RewardLeave> createdReward(int memNo) {
		return pDao.createdReward(memNo);
	}

	/**
	 * 신청한 휴가 리스트
	 */
	@Override
	public ArrayList<RecordLeave> applyLeave(int memNo) {
		return pDao.applyLeave(memNo);
	}

	/**
	 * 휴가종류
	 */
	@Override
	public ArrayList<TypeLeave> typeLeave() {
		return pDao.typeLeave();
	}

	/**
	 *	휴가기록  + 휴가 타입
	 */
	@Override
	public ArrayList<MixForLeave> mixLeave(int memNo) {
		return pDao.mixLeave(memNo);
	}

	/**
	 * 휴가별 사용횟수
	 */
	@Override
	public ArrayList<TypeUsedLeave> tul(int memNo) {
		return pDao.tul(memNo);
	}

	/**
	 * 휴가현황을위한 vo
	 */
	@Override
	public MixForLeave detailRecordLeave(int rNo) {
		return pDao.detailRecordLeave(rNo);
	}

	/**
	 * 1년차 미만 설정
	 */
	@Override
	public SetLeave firstyearLeave() {
		return pDao.firstyearLeave();
	}

	/**
	 * 출퇴근 설정
	 */
	@Override
	public SetAttendance  setAttendance() {
		return pDao.setAttendance();
	}
	// 출근기록가능여부
	@Override
	public int RecordAB_A(int memNo) {
		return pDao.RecordAB_A(memNo);
	}
	// 출근기록 삽입
	@Override
	public int insertRA(Map forR) {
		return pDao.RecordRA(forR);
	}
	// 퇴근기록가능여부
	@Override
	public int RecordAB_O(int memNo) {
		return pDao.RecordAB_O(memNo);
	}
	// 퇴근기록 삽입
	@Override
	public int insertRO(Map forR) {
		return pDao.RecordRO(forR);
	}
	// 당일 출퇴근기록(헤더용)
	@Override
	public RecordDiligence RecordToday(int memNo) {
		return pDao.RecordToday(memNo);
	}
	// 퇴근체크 비정상
	@Override
	public int noCheckOffwork(int memNo) {
		return pDao.noCheckOffwork(memNo);
	}
	// 결근 수 확인용
	@Override
	public int noAttendanceCount(int memNo) {
		return pDao.noAttendanceCount(memNo);
	}
	// 근태 년/월 사번으로 조회
	@Override
	public ArrayList<RecordDiligence> searchDiligenceYM(Map forsearchYM, PageInfo pi) {
		return pDao.searchDiligenceYM(forsearchYM,pi);
	}
	// 근태 년/월 사번으로 조회 카운트
	@Override
	public int dListCount(Map forsearchYM) {
		return pDao.dListCount(forsearchYM);
	}

	@Override
	public ArrayList<SetLeave> setLeaveStandard() {
		return pDao.setLeaveStandard();
	}

	@Override
	public int fixSetLeave(ArrayList newLeaveArr, ArrayList setAnnualLeave, int firstyear) {
		return pDao.fixSetLeave(newLeaveArr,setAnnualLeave,firstyear);
	}

	@Override
	public ArrayList<ForEmLeave> emAllMemeber() {
		return pDao.emAllMember();
	}

	@Override
	public ArrayList<ForEmUsedLeave> usedLeave() {
		return pDao.usedLeave();
	}

	@Override
	public int updateLeaveSetting(ArrayList<SetLeave> setLeave) {
		return pDao.updateLeaveSetting(setLeave);
	}

	@Override
	public int insertLeaveType(ArrayList<TypeLeave> newLeave) {
		return pDao.insertLeaveType(newLeave);
	}

	@Override
	public int reduceAnnualLeave(Map changeAL) {
		return pDao.reduceAnnualLeave(changeAL);
	}

	@Override
	public int reduceRewardLeave(Map changeRL) {
		return pDao.reduceRewardLeave(changeRL);
	}

	@Override
	public RecordDiligence recordDiligence(int noDiligence) {
		return pDao.recordDiligence(noDiligence);
	}

	@Override
	public int modificationDiligence(ModificationDiligence mod) {
		return pDao.modificationDiligence(mod);
	}

	@Override
	public ArrayList<ModificationDiligence> selectRecordModification(int memNo) {
		return pDao.selectRecordModification(memNo);
	}

	@Override
	public int cancelMod(int noMod) {
		return pDao.cancelMod(noMod);
	}

	@Override
	public ArrayList<RecordDiligence> recordDiligenceList(int memNo) {
		return pDao.recordDiligenceList(memNo);
	}

	@Override
	public ArrayList<SetAttendance> AttendanceDays() {
		return pDao.AttendanceDays();
	}

	@Override
	public ArrayList<Member> selectTargetReward(Map searchCondition) {
		return pDao.selectTargetReward(searchCondition);
	}

	@Override
	public int grantReward(Map cR) {
		return pDao.grantReward(cR);
	}

	@Override
	public ArrayList<SetAttendance> setDiligenceStandard() {
		return pDao.setDiligenceStandard();
	}

	@Override
	public int updateAttendance(Map setA) {
		return pDao.updateAttendance(setA);
	}

	@Override
	public int updateLeaveType(ArrayList<TypeLeave> leaveTypeSetting) {
		return pDao.updateLeaveType(leaveTypeSetting);
	}

	@Override
	public ArrayList<Absence> absenceList() {
		return pDao.absenceList();
	}

	@Override
	public int returnToWork(int memNo) {
		return pDao.returnToWork(memNo);
	}

	@Override
	public ArrayList<Member> selectAllMember() {
		return pDao.selectAllMember();
	}

	@Override
	public DiligenceCountAllMember DiligenceCountAllMember() {
		return pDao.DiligenceCountAllMember();
	}
	//근태수정요청 관리
	@Override
	public ArrayList<ModificationDiligence> modRequestList() {
		return pDao.modRequestList();
	}

	@Override
	public int modificationAcknowledgment(int noMod) {
		return pDao.modificationAcknowledgment(noMod);
	}

	@Override
	public int modificationCancel(int noMod) {
		return pDao.modificationCancel(noMod);
	}

	// 캘린더 휴가 리스트
	@Override
	public ArrayList<RecordLeave> RecordLeaveList() {
		return pDao.RecordLeaveList();
	}

	@Override
	public ArrayList<Member> searchMemberND(String searchKey) {
		return pDao.searchMemberND(searchKey);
	}

	@Override
	public ArrayList<ForEmLeave> searchMemberForEmLeaveND(String searchKey) {
		return pDao.searchMemberForEmLeaveND(searchKey);
	}

	@Override
	public SelectedMemberDiligenceCount SelectedMemberDiligenceCount(int memNo) {
		return pDao.SelectedMemberDiligenceCount(memNo);
	}

	
	

	

	
	
	

}
