package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.vo.Calendar;

public interface ScheduleService {

	ArrayList<Department> deptList();

	ArrayList<Member> memList();

	int insertCommunity(Calendar calendar);

	void EnrollMember(int[] enrollmemno, int result);

//	ArrayList<Integer> EnrollMember(int[] enrollmemno, result);

//	ArrayList<Integer> EnrollMember(String enrollMember);



	

}
