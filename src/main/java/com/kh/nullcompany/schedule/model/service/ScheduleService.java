package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;

public interface ScheduleService {

	ArrayList<Department> deptList();

	ArrayList<Member> memList();


	

}
