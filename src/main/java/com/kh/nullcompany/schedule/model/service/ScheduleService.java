package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.DetailSchedule;
import com.kh.nullcompany.schedule.model.vo.Schedule;

public interface ScheduleService {

	ArrayList<Department> deptList();

	ArrayList<Member> memList();

	int insertCommunity(Calendar calendar);

	void EnrollMember(int[] enrollmemno, int result);

	void LookMember(int[] lookmemno, int calNo);

	ArrayList<Calendar> publicCalList();

	int insertIndividual(Calendar calendar);

	void IndEnrollMember(int indEnrollMember, int calNo);

	void IndLookMember(int indLookMember, int calNo);

	ArrayList<Calendar> IndividualCalList();

	int insertSchedule(Schedule schedule);

	ArrayList<Schedule> ScheduleList();

	Schedule detailSchedule(String sche_name);


	

}
