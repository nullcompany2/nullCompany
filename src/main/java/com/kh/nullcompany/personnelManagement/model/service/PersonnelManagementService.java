package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.google.gson.JsonObject;
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

public interface PersonnelManagementService {


	/**
	 * 연차 일수 조회
	 * @param workyear
	 * @return
	 */
	int leaveCalculate(String workyear);

	int lateCountM(int memNo);

	int lateCountY(int memNo);

	/**
	 * 부서 리스트 조회
	 * @return
	 */
	ArrayList<Department> deptList();

	/**
	 * 모든직원
	 * @return
	 */
	ArrayList<Member> deptAllMemberList();

	/**
	 * 해당사원 상세페이지
	 * @param memNo
	 * @return
	 */
	Member detailMemberInfo(int memNo);

	/**
	 * 회원 검색용 id/이름
	 * @param searchText
	 * @return
	 */
	ArrayList searchMemberById(String searchText);

	/**
	 * 포상휴가 생성 수내역
	 * @param memNo
	 * @return
	 */
	int rewardLeave(int memNo);

	/**
	 * 사용된 포상휴가 수
	 * @param memNo
	 * @return
	 */
	int usedRewardLeave(int memNo);

	/**
	 * 사용된 연차 수
	 * @param memNo
	 * @return
	 */
	int usedAnnualLeave(int memNo);
	
	/**
	 * 1년차 휴가설정
	 * @return
	 */
	SetLeave firstyearLeave();

	/**
	 * 사원 휴가 업데이트
	 * @param memNo
	 * @param annual
	 * @param reward
	 * @return
	 */
	int updateLeave(Map updatemap);

	/**
	 * 생성된 포상휴가 리스트
	 * @param memNo
	 * @return
	 */
	ArrayList<RewardLeave> createdReward(int memNo);

	/**
	 * 신청한 휴가 리스트
	 * @param memNo
	 * @return
	 */
	ArrayList<RecordLeave> applyLeave(int memNo);

	/**
	 * 휴가 종류 리스트
	 * @return
	 */
	ArrayList<TypeLeave> typeLeave();

	/**
	 * 휴가기록 + 휴가타입
	 * @return
	 */
	ArrayList<MixForLeave> mixLeave(int memNo);

	/**
	 * 휴가별 사용횟수
	 * @param memNo
	 * @return
	 */
	ArrayList<TypeUsedLeave> tul(int memNo);

	/**
	 * 해당 휴가 정보 가져오기(모달)
	 * @param rNo (기록번호)
	 * @return
	 */
	MixForLeave detailRecordLeave(int rNo);

	/**
	 * 출퇴근 설정
	 * @return
	 */
	SetAttendance setAttendance();
	
	// 출근기록 가능여부
	int RecordAB_A(int memNo);
	// 출근 기록 삽입
	int insertRA(Map forR);
	// 퇴근 기록 가능여부
	int RecordAB_O(int memNo);
	// 퇴근기록 삽입
	int insertRO(Map forR);

	// 당일 출근기록(헤더용
	RecordDiligence RecordToday(int memNo);
	// 퇴근체크(비정상)
	int noCheckOffwork(int memNo);
	//결근 카운트
	int noAttendanceCount(int memNo);
	// 출퇴근기록 년/월 조회
	ArrayList<RecordDiligence> searchDiligenceYM(Map forsearchYM, PageInfo pi);
	// 근태기록 년/월 조회 카운트용
	int dListCount(Map forsearchYM);
	// 휴가설정 기본
	ArrayList<SetLeave> setLeaveStandard();
	// 휴가설정 저장
	int fixSetLeave(ArrayList newLeaveArr, ArrayList setAnnualLeave, int firstyear);
	// 직원 휴가관리 전체사원
	ArrayList<ForEmLeave> emAllMemeber();
	// 사용된 휴가목록(직원 휴가관리)
	ArrayList<ForEmUsedLeave> usedLeave();
	// 휴가 기본설정 업데이트
	int updateLeaveSetting(ArrayList<SetLeave> setLeave);
	// 새로운 휴가 등록
	int insertLeaveType(ArrayList<TypeLeave> newLeave);
	// 직원 연차수정(감소)
	int reduceAnnualLeave(Map changeAL);
	// 직원 포상수정(감소)
	int reduceRewardLeave(Map changeRL);
	// 근태수정요청용 근태기록 검색(기록번호)
	RecordDiligence recordDiligence(int noDiligence);
	// 근태 수정요청
	int modificationDiligence(ModificationDiligence mod);
	// 근태 수정기록 조회
	ArrayList<ModificationDiligence> selectRecordModification(int memNo);
	// 근태 수정 취소
	int cancelMod(int noMod);
	
	ArrayList<RecordDiligence> recordDiligenceList(int memNo);
	// 출근일 확인
	ArrayList<SetAttendance> AttendanceDays();
	
	// 포상휴가 부여 검색용
	ArrayList<Member> selectTargetReward(Map searchCondition);
	// 포상휴가 부여
	int grantReward(Map cR);
	// 근태 설정값 가져오기
	ArrayList<SetAttendance> setDiligenceStandard();
	// 근태 설정 요일 및 출퇴근 시간설정
	int updateAttendance(Map setA);
	// 휴가 설정 업데이트
	int updateLeaveType(ArrayList<TypeLeave> leaveTypeSetting);
	// 휴직자 리스트
	ArrayList<Absence> absenceList();
	// 복직
	int returnToWork(int memNo);
	// 전제 사원 근태관리 -모든사원 리스트
	ArrayList<Member> selectAllMember();
	// 전체직원 근태 카운트
	DiligenceCountAllMember DiligenceCountAllMember();
	// 근태 수정요청 리스트
	ArrayList<ModificationDiligence> modRequestList();
	// 근태 수정요청 승인
	int modificationAcknowledgment(int noMod);
	// 근태 수정요청 반려
	int modificationCancel(int noMod);
	
	
	


	
	
	
	
}
