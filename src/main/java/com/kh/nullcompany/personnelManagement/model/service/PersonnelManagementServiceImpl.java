package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.dao.PersonnelManagementDao;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.MixForLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RecodeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RewardLeave;
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
	public ArrayList<RecodeLeave> applyLeave(int memNo) {
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
	public MixForLeave detailRecodeLeave(int rNo) {
		return pDao.detailRecodeLeave(rNo);
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
	public ArrayList<SetAttendance>  setAttendance() {
		return pDao.setAttendance();
	}
	
	

}
