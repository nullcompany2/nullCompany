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

			System.out.println(calendarMember+"rrdsfsdgr");
			sDao.EnrollMember(calendarMember);

		}
	}

//	@Override
//	public ArrayList<Integer> EnrollMember(String enrollMember) {
//		return sDao.EnrollMember(enrollMember);
//	}

//	@Override
//	public ArrayList<Integer> EnrollMember(int[] enrollmemno) {
//		return sDao.EnrollMember(enrollmemno);
//	}

}
