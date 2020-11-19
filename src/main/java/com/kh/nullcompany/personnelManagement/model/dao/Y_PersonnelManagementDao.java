package com.kh.nullcompany.personnelManagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;

@Repository("yDao")
public class Y_PersonnelManagementDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	public int updateUserApproval;

	public ArrayList<Member> selectApprovalList() {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.selectApprovalList");
	}

	public ArrayList<Department> selectDeptList() {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.selectDeptList");
	}

	public ArrayList<Rank> selectRankList() {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.selectRankList");
	}

	public int updateApprovalUser(Member m) {
		return sqlSession.update("Y_personnelMapper.updateApprovalUser",m);
	}

	public int aprrovalEmail(Email e) {
		return sqlSession.insert("Y_personnelMapper.aprrovalEmail",e);
	}

	public ArrayList<Department> selectdeptList() {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.per_selectdeptList");
	}

	public ArrayList<Member> selectmemList() {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.per_selectmemList");
	}






}