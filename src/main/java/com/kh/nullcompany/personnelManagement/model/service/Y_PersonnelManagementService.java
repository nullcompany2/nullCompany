package com.kh.nullcompany.personnelManagement.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;

public interface Y_PersonnelManagementService {

	ArrayList<Member> selectApprovalList();

	ArrayList<Department> selectDeptList();

	ArrayList<Rank> selectRankList();

	int updateMember(Member m);

	int aprrovalEmail(Email e);



}