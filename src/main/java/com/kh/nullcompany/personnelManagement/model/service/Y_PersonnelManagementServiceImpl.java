package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.dao.Y_PersonnelManagementDao;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;

@Service("yService")
public class Y_PersonnelManagementServiceImpl implements Y_PersonnelManagementService{

	@Autowired
	private Y_PersonnelManagementDao yDao;
	
	@Override
	public ArrayList<Department> selectDeptList() {
		return yDao.selectDeptList();
	}

	@Override
	public ArrayList<Rank> selectRankList() {
		return yDao.selectRankList();
	}

	@Override
	public int updateMember(Member m) {
		return yDao.updateApprovalUser(m);
	}

	@Override
	public int aprrovalEmail(Email e) {
		return yDao.aprrovalEmail(e);
	}

	@Override
	public ArrayList<Department> deptList() {
		return yDao.selectdeptList();
	}

	@Override
	public ArrayList<Member> memList() {
		return yDao.selectmemList();

	}

	@Override
	public int getMemListCount() {
		return yDao.getMemListCount();
	}

	@Override
	public ArrayList<Member> selectPageMemList(PageInfo pi) {
		return yDao.selectPageMemList(pi);
	}

	@Override
	public int userApprovalListCount() {
		return yDao.userApprovalListCount();
	}

	@Override
	public ArrayList<Member> selectApprovalList(PageInfo pi) {
		return yDao.selectApprovalList(pi);
	}

	@Override
	public int Name_SearchCount(String text) {
		return yDao.Name_SearchCount(text);
	}

	@Override
	public ArrayList<Member> Name_Search(PageInfo pi, String text) {
		return yDao.Name_Search(pi,text);
	}

	@Override
	public int ID_SearchCount(String text) {
		return yDao.ID_SearchCount(text);
	}

	@Override
	public ArrayList<Member> ID_Search(PageInfo pi, String text) {
		return yDao.ID_Search(pi,text);
	}

	@Override
	public int deptAdd(String deptName) {
		return yDao.deptAdd(deptName);
	}

	@Override
	public Member detailMemberInfo(int memNo) {
		return yDao.detailMemberInfo(memNo);
	}

	@Override
	public int deptEdit(Map map) {
		return yDao.deptEdit(map);
	}

	@Override
	public int deptTypeMemlistCount(String deptName) {
		return yDao.deptTypeMemlistCount(deptName);
	}

	@Override
	public ArrayList<Member> deptTypeMemlist(PageInfo pi, String deptName) {
		return yDao.deptTypeMemlist(pi,deptName);
	}

	@Override
	public int updateMemDept(Member m) {
		return yDao.updateMemDept(m);
	}

	@Override
	public int deptDelete(String deptName) {
		return yDao.deptDelete(deptName);
	}

	@Override
	public ArrayList<Rank> selectOrderByRankList() {
		return yDao.selectOrderByRankList();
	}

	@Override
	public int rankEdit(Map map) {
		return yDao.rankEdit(map);
	}

	@Override
	public int rankAdd(String rankName) {
		return yDao.rankAdd(rankName);
	}

	@Override
	public int rankTypeMemlistCount(String rankName) {
		return yDao.rankTypeMemlistCount(rankName);
	}

	@Override
	public ArrayList<Member> rankTypeMemlist(PageInfo pi, String rankName) {
		return yDao.rankTypeMemlist(pi,rankName);
	}

	@Override
	public int updateMemRank(Member m) {
		return yDao.updateMemRank(m);
	}

	@Override
	public int rankDelete(String rankName) {
		return yDao.rankDelete(rankName);
	}

	@Override
	public ArrayList<Member> searchMemberById(String searchText) {
		return yDao.searchMemById(searchText);
	}


}
