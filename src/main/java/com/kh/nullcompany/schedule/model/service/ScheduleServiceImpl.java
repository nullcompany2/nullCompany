package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.dao.ScheduleDao;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.CalendarMember;
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
	public ArrayList<Calendar> publicCalList() {
		return sDao.publicCalList();
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
	public ArrayList<Calendar> IndividualCalList() {
		return sDao.IndividualCalList();
	}

	@Override
	public int insertSchedule(Schedule schedule) {
		return sDao.insertSchedule(schedule);
	}

	@Override
	public ArrayList<Schedule> ScheduleList() {
		return sDao.ScheduleList();
	}



}
