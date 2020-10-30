package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.dao.ScheduleDao;

@Service("sService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao sDao;

	@Override
	public ArrayList<Department> deptList() {
		return sDao.selectdeptList();
	}

	@Override
	public ArrayList<Member> memList() {
		return sDao.selectmemList();
	
	}



}
