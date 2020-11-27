package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;

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


}
