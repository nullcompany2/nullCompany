package com.kh.nullcompany.schedule.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.CalendarMember;
import com.kh.nullcompany.schedule.model.vo.DetailSchedule;
import com.kh.nullcompany.schedule.model.vo.Schedule;

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

	public int LookMember(CalendarMember calendarMember) {
		return sqlSession.insert("scheduleMapper.LookMember",calendarMember);
	}

	public ArrayList<Calendar> publicCalList() {
		return (ArrayList)sqlSession.selectList("scheduleMapper.publicCalList");
	}

	public int insertIndividual(Calendar calendar) {
		return sqlSession.insert("scheduleMapper.insertIndividual",calendar);
	}

	public int IndEnrollMember(CalendarMember calendarMember) {
		return sqlSession.insert("scheduleMapper.IndEnrollMember",calendarMember);
	}

	public int IndLookMember(CalendarMember calendarMember) {
		return sqlSession.insert("scheduleMapper.IndLookMember",calendarMember);
	
	}

	public ArrayList<Calendar> IndividualCalList() {
		return (ArrayList)sqlSession.selectList("scheduleMapper.IndividualCalList");
	}

	public int insertSchedule(Schedule schedule) {
		return sqlSession.insert("scheduleMapper.insertSchedule",schedule);
	}

	public ArrayList<Schedule> ScheduleList() {
		return (ArrayList)sqlSession.selectList("scheduleMapper.ScheduleList");
	}

	public Schedule detailSchedule(String sche_name) {
		return sqlSession.selectOne("scheduleMapper.detailSchedule",sche_name);
	}

	public String getCalmemCount(String sche_name) {
		System.out.println("DAO : " + sche_name);
		return sqlSession.selectOne("scheduleMapper.getCalmemCount",sche_name);
	}

	public int updateCalCountMember(Map map) {
		System.out.println(map.toString());
		return sqlSession.update("scheduleMapper.updateCalCountMember",map);
		
		
	}

	public ArrayList<Calendar> DetailCalmemberList(String cal_name) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.DetailCalmemberList", cal_name);
	}

	public Schedule editDetailSchedule(String sche_name) {
		return sqlSession.selectOne("scheduleMapper.editDetailSchedule",sche_name);
	}



	



	
}
