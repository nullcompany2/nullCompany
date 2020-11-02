package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.MixForLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RecodeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RewardLeave;
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
	ArrayList<RecodeLeave> applyLeave(int memNo);

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
	 * @param rNo
	 * @return
	 */
	MixForLeave detailRecodeLeave(int rNo);
	
	

}