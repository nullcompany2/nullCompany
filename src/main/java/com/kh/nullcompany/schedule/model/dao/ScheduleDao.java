package com.kh.nullcompany.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.CalendarMember;

@Repository("sDao")
public class ScheduleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Department> selectdeptList() {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectdeptList");
	}

	public ArrayList<Member> selectmemList() {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectmemList");
	}

	public int insertCommunity(Calendar calendar) {
		return sqlSession.insert("scheduleMapper.insertCommunity",calendar);
	}

	public int EnrollMember(CalendarMember calendarMember) {
		return sqlSession.insert("scheduleMapper.EnrollMember",calendarMember);
	}
	



	
}
