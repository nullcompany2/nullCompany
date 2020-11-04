package com.kh.nullcompany.schedule.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.service.ScheduleService;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService sService;

	// 일정 관리 메인
	@RequestMapping("Schedulermain.do")
	public ModelAndView Schedulermain(ModelAndView mv) {

		// 총 부서 리스트
		ArrayList<Department> deptList = sService.deptList();
		// 총 사원 리스트
		ArrayList<Member> memList = sService.memList();
		// 공유 캘린더 리스트
		ArrayList<Calendar> publicCalList = sService.publicCalList();
		// 내 캘린더 리스트
		ArrayList<Calendar> IndividualCalList = sService.IndividualCalList();
		// 일정 리스트
		ArrayList<Schedule> ScheduleList = sService.ScheduleList();

		mv.addObject("deptList", deptList);
		mv.addObject("memList", memList);
		mv.addObject("publicCalList", publicCalList);
		mv.addObject("IndividualCalList", IndividualCalList);
		mv.addObject("ScheduleList", ScheduleList);
		
		mv.setViewName("Scheduler/Schedulermain");
		return mv;
	}

	@RequestMapping("SchedulerResearch.do")
	public String SchedulerResearch(HttpServletResponse response) {
		return "Scheduler/SchedulerResearch";
	}

	// 공유 캘린더 인써트
	@RequestMapping("insertCommunityCal.do")

	public void insertCommunity(@Param("Calendar") Calendar Calendar ) {
		sService.insertCommunity(Calendar);

		System.out.println(Calendar.getCalNo()+"컨트롤러");
		System.out.println("공유캘린더" + Calendar);

		// 등록권한 리스트
		String[] enrollarray = Calendar.getEnrollMember().split(",");
		int [] enrollmemno = Arrays.stream(enrollarray).mapToInt(Integer::parseInt).toArray();

		sService.EnrollMember(enrollmemno, Calendar.getCalNo());
		// 조회권한 리스트
		String[] lookarray = Calendar.getLookMember().split(",");
		int [] lookmemno = Arrays.stream(lookarray).mapToInt(Integer::parseInt).toArray();

		sService.LookMember(lookmemno, Calendar.getCalNo());

	}

	// 내 캘린더 인써트
	@RequestMapping("insertIndividual.do")

	public void insertIndividual(@Param("Calendar") Calendar Calendar ) {
		int result = sService.insertIndividual(Calendar);

		System.out.println(Calendar.getCalNo()+"컨트롤러");
		System.out.println("내 캘린더" + Calendar);

		int IndEnrollMember = Integer.parseInt(Calendar.getEnrollMember());
		int IndLookMember = Integer.parseInt(Calendar.getLookMember());
		sService.IndEnrollMember(IndEnrollMember, Calendar.getCalNo());

		sService.IndLookMember(IndLookMember, Calendar.getCalNo());


	}

	@RequestMapping("insertSchedule.do")
	public void insertSchedule(@Param("Schedule") Schedule Schedule ) {
		int result = sService.insertSchedule(Schedule);

		System.out.println(Schedule.getSche_name()+"컨트롤러");
		System.out.println("내 캘린더" + Schedule);



	}
}