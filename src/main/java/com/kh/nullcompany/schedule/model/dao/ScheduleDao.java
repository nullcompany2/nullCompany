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

	public ArrayList<Calendar> publicCalList(int memNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.publicCalList", memNo);
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

	public ArrayList<Calendar> IndividualCalList(int memNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.IndividualCalList", memNo);
	}

	public int insertSchedule(Schedule schedule) {
		return sqlSession.insert("scheduleMapper.insertSchedule",schedule);
	}

	public ArrayList<Schedule> ScheduleList(int memNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.ScheduleList", memNo);
	}

	public Schedule detailSchedule(String sche_name) {
		return sqlSession.selectOne("scheduleMapper.detailSchedule",sche_name);
	}

	public String getCalmemCount(String sche_name) {
		return sqlSession.selectOne("scheduleMapper.getCalmemCount",sche_name);
	}

	public int updateCalCountMember(Map map) {
		System.out.println(map.toString());
		return sqlSession.update("scheduleMapper.updateCalCountMember",map);
		
		
	}

	public ArrayList<Calendar> DetailCalmemberList(int calNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.DetailCalmemberList", calNo);
	}

	public Schedule editDetailSchedule(int sche_no) {
		return sqlSession.selectOne("scheduleMapper.editDetailSchedule",sche_no);
	}

	public int updateSchedule(Schedule schedule) {
		return sqlSession.update("scheduleMapper.updateSchedule",schedule);
	}

	public int DeleteSchedule(int sche_no) {
		return sqlSession.delete("scheduleMapper.DeleteSchedule",sche_no);
	}

	public ArrayList<Calendar> SelectpublicCalList(int memNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.SelectpublicCalList", memNo);
	}

	public Calendar editDetailIndiCal(int calNo) {
		return sqlSession.selectOne("scheduleMapper.editDetailIndiCal",calNo);
	}

	public int editIndiCal(Calendar calendar) {
		return sqlSession.update("scheduleMapper.editIndiCal",calendar);
	}

	public int DeleteIndiCal(int calNo) {
		return sqlSession.delete("scheduleMapper.DeleteIndiCal",calNo);
	}

	public int DeleteIndiCal_Sche(int calNo) {
		return sqlSession.delete("scheduleMapper.DeleteIndiCal_Sche",calNo);
	}
	
	public int editIndiCal_Sche(int cal_no) {
		return sqlSession.update("scheduleMapper.editIndiCal_Sche",cal_no);
	}

	public ArrayList<Member> SearchMem_public(String text) {
		return(ArrayList) sqlSession.selectList("scheduleMapper.SearchMem_public",text);
	}

	public Calendar editDetailPublicCal(int calNo) {
		return sqlSession.selectOne("scheduleMapper.editDetailPublicCal",calNo);
	}





	



	
}
