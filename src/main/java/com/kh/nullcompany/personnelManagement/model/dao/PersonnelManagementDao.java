package com.kh.nullcompany.personnelManagement.model.dao;


import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.MixForLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RecodeLeave;
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


	public ArrayList<RecodeLeave> applyLeave(int memNo) {
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


	public MixForLeave detailRecodeLeave(int noRecode) {
		return sqlSession.selectOne("personnelMapper.detailRecodeLeave",noRecode);
	}


	public SetLeave firstyearLeave() {
		return sqlSession.selectOne("personnelMapper.firstyearLeave");
	}


	public ArrayList<SetAttendance> setAttendance() {
		return ((ArrayList)sqlSession.selectList("personnelMapper.setAttendance"));
	}

}
