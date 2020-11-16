package com.kh.nullcompany.schedule.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	ArrayList<Calendar> publicCalList(int memNo);

	int insertIndividual(Calendar calendar);

	void IndEnrollMember(int indEnrollMember, int calNo);

	void IndLookMember(int indLookMember, int calNo);

	ArrayList<Calendar> IndividualCalList(int memNo);

	int insertSchedule(Schedule schedule);

	ArrayList<Schedule> ScheduleList(int memNo);

	Schedule detailSchedule(String sche_name);

	String getCalmemCount(String sche_name);

	int updateCalCountMember(Map map);

	ArrayList<Calendar> DetailCalmemberList(int calNo);

	Schedule editDetailSchedule(int sche_no);

	int updateSchedule(Schedule schedule);

	int DeleteSchedule(int sche_no);

	ArrayList<Calendar> SelectpublicCalList(int memNo);

	Calendar editDetailIndiCal(int calNo);

	int editIndiCal(Calendar calendar);

	int DeleteIndiCal(int calNo);
	
	int DeleteIndiCal_Sche(int calNo);

	int editIndiCal_Sche(int cal_no);

	ArrayList<Member> SearchMem_public(String text);

	Calendar editDetailPublicCal(int calNo);







	

}
