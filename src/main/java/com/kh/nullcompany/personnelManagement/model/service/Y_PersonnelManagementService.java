package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;

public interface Y_PersonnelManagementService {

	ArrayList<Member> selectApprovalList(PageInfo pi);

	ArrayList<Department> selectDeptList();

	ArrayList<Rank> selectRankList();

	int updateMember(Member m);

	int aprrovalEmail(Email e);

	ArrayList<Department> deptList();

	ArrayList<Member> memList();

	int getMemListCount();

	ArrayList<Member> selectPageMemList(PageInfo pi);

	int userApprovalListCount();

	ArrayList<Member> Name_Search(PageInfo pi, String text);

	int Name_SearchCount(String text);

	int ID_SearchCount(String text);

	ArrayList<Member> ID_Search(PageInfo pi, String text);



}
