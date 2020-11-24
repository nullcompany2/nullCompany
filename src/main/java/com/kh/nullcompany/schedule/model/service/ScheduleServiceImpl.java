package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.dao.ScheduleDao;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.CalendarMember;
import com.kh.nullcompany.schedule.model.vo.DetailSchedule;
import com.kh.nullcompany.schedule.model.vo.Schedule;

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

	@Override
	public int insertCommunity(Calendar calendar) {
		return sDao.insertCommunity(calendar);
	}

	@Override
	public void EnrollMember(int[] enrollmemno, int result) {
		for (int i = 0; i < enrollmemno.length; i++) {

			CalendarMember calendarMember = new CalendarMember();
			calendarMember.setCalNo(result);
			calendarMember.setCalMem(enrollmemno[i]);

			System.out.println(calendarMember+" : 등록권한");
			sDao.EnrollMember(calendarMember);

		}
	}

	@Override
	public void LookMember(int[] lookmemno, int result) {
		for (int i = 0; i < lookmemno.length; i++) {

			CalendarMember calendarMember = new CalendarMember();
			calendarMember.setCalNo(result);
			calendarMember.setCalMem(lookmemno[i]);

			System.out.println(calendarMember+" : 조회권한");
			sDao.LookMember(calendarMember);

		}
		
	}

	@Override
	public ArrayList<Calendar> publicCalList(int memNo) {
		return sDao.publicCalList(memNo);
	}

	@Override
	public int insertIndividual(Calendar calendar) {
		return sDao.insertIndividual(calendar);
	}

	@Override
	public void IndEnrollMember(int indEnrollMember, int calNo) {
		CalendarMember calendarMember = new CalendarMember();
		calendarMember.setCalNo(calNo);

		calendarMember.setCalMem(indEnrollMember);

		System.out.println(calendarMember+" : 개인 등록권한");
		sDao.IndEnrollMember(calendarMember);
		
	}

	@Override
	public void IndLookMember(int indLookMember, int calNo) {
		CalendarMember calendarMember = new CalendarMember();
		calendarMember.setCalNo(calNo);

		calendarMember.setCalMem(indLookMember);

		System.out.println(calendarMember+" : 개인 조회 권한");
		sDao.IndLookMember(calendarMember);
		
	}

	@Override
	public ArrayList<Calendar> IndividualCalList(int memNo) {
		return sDao.IndividualCalList(memNo);
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return sDao.insertSchedule(schedule);
	}

	@Override
	public ArrayList<Schedule> ScheduleList(int memNo) {
		return sDao.ScheduleList(memNo);
	}

	@Override
	public Schedule detailSchedule(String sche_name) {
		return sDao.detailSchedule(sche_name);
	}

	@Override
	public String getCalmemCount(String sche_name) {
		return sDao.getCalmemCount(sche_name);
		
	}

	@Override
	public int updateCalCountMember(Map map) {
		return sDao.updateCalCountMember(map);
		
	}

	@Override
	public ArrayList<Calendar> DetailCalmemberList(int calNo) {
		return sDao.DetailCalmemberList(calNo);
	}

	@Override
	public Schedule editDetailSchedule(int Sche_no) {
		return sDao.editDetailSchedule(Sche_no);
	}

	@Override
	public int updateSchedule(Schedule schedule) {
		return sDao.updateSchedule(schedule);
	}

	@Override
	public int DeleteSchedule(int sche_no) {
		return sDao.DeleteSchedule(sche_no);
	}

	@Override
	public ArrayList<Calendar> SelectpublicCalList(int memNo) {
		return sDao.SelectpublicCalList(memNo);
	}

	@Override
	public Calendar editDetailIndiCal(int calNo) {
		return sDao.editDetailIndiCal(calNo);
	}

	@Override
	public int editIndiCal(Calendar calendar) {
		return sDao.editIndiCal(calendar);
	}

	@Override
	public int DeleteIndiCal(int calNo) {
		return sDao.DeleteIndiCal(calNo);
	}
	
	@Override
	public int DeleteIndiCal_Sche(int calNo) {
		return sDao.DeleteIndiCal_Sche(calNo);
	}

	@Override
	public int editIndiCal_Sche(int cal_no) {
		return sDao.editIndiCal_Sche(cal_no);
		
	}

	@Override
	public ArrayList<Member> SearchMem_public(String text) {
		return sDao.SearchMem_public(text);
	}

	@Override
	public ArrayList<Calendar> editDetailPublicCal(int calNo) {
		return sDao.editDetailPublicCal(calNo);
	}

	@Override
	public ArrayList<Schedule> Sche_name_Search(String text) {
		return sDao.Sche_name_Search(text);
	}
	
	@Override
	public ArrayList<Schedule> Cal_name_Search(String text) {
		return sDao.Cal_name_Search(text);
	}

	@Override
	public int DeleteEditCommunityCalMember(int calNo) {
		return sDao.DeleteEditCommunityCalMember(calNo);
	}

	@Override
	public int updateCommunity(Calendar calendar) {
		return sDao.updateCommunity(calendar);
		
	}



}
