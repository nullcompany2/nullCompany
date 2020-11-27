package com.kh.nullcompany.personnelManagement.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;

@Repository("yDao")
public class Y_PersonnelManagementDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	public int updateUserApproval;

	public ArrayList<Member> selectApprovalList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.selectApprovalList",null,rowBounds);
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

	public int getMemListCount() {
		return sqlSession.selectOne("Y_personnelMapper.getMemListCount");
	}

	public ArrayList<Member> selectPageMemList(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.per_selectmemList",null,rowBounds);
	}

	public int userApprovalListCount() {
		return sqlSession.selectOne("Y_personnelMapper.userApprovalListCount");
	}








}