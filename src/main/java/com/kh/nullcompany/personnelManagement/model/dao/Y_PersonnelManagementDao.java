package com.kh.nullcompany.personnelManagement.model.dao;

import java.util.ArrayList;
import java.util.Map;

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


	public int Name_SearchCount(String text) {
		return sqlSession.selectOne("Y_personnelMapper.Name_SearchCount",text);
	}

	public ArrayList<Member> Name_Search(PageInfo pi, String text) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.Name_Search",text,rowBounds);
	}

	public int ID_SearchCount(String text) {
		return sqlSession.selectOne("Y_personnelMapper.ID_SearchCount",text);
	}

	public ArrayList<Member> ID_Search(PageInfo pi, String text) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.ID_Search",text,rowBounds);
	}

	public int deptAdd(String deptName) {
		return sqlSession.insert("Y_personnelMapper.deptAdd",deptName);
	}

	public Member detailMemberInfo(int memNo) {
		return sqlSession.selectOne("Y_personnelMapper.detailMemberInfo_y",memNo);
	}

	public int deptEdit(Map map) {
		System.out.println(map.toString());
		return sqlSession.update("Y_personnelMapper.deptEdit",map);

	}

	public int deptTypeMemlistCount(String deptName) {
		return sqlSession.selectOne("Y_personnelMapper.deptTypeMemlistCount",deptName);
	}

	public ArrayList<Member> deptTypeMemlist(PageInfo pi, String deptName) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.deptTypeMemlist",deptName,rowBounds);
	}

	public int updateMemDept(Member m) {
		return sqlSession.update("Y_personnelMapper.updateMemDept",m);
	}

	public int deptDelete(String deptName) {
		return sqlSession.delete("Y_personnelMapper.deptDelete",deptName);
	}

	public ArrayList<Rank> selectOrderByRankList() {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.selectOrderByRankList");
	}

	public int rankEdit(Map map) {
		return sqlSession.update("Y_personnelMapper.rankEdit",map);
	}

	public int rankAdd(String rankName) {
		return sqlSession.insert("Y_personnelMapper.rankAdd",rankName);
	}

	public int rankTypeMemlistCount(String rankName) {
		return sqlSession.selectOne("Y_personnelMapper.rankTypeMemlistCount",rankName);
	}

	public ArrayList<Member> rankTypeMemlist(PageInfo pi, String rankName) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.rankTypeMemlist",rankName,rowBounds);
	}

	public int updateMemRank(Member m) {
		return sqlSession.update("Y_personnelMapper.updateMemRank",m);
	}

	public int rankDelete(String rankName) {
		return sqlSession.delete("Y_personnelMapper.rankDelete",rankName);
	}

	public ArrayList<Member> searchMemById(String searchText) {
		return (ArrayList)sqlSession.selectList("Y_personnelMapper.searchMemById", searchText);
	}









}