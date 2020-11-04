package com.kh.nullcompany.schedule.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.service.ScheduleService;
import com.kh.nullcompany.schedule.model.vo.Calendar;

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

		mv.addObject("deptList", deptList);
		mv.addObject("memList", memList);
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
		
		System.out.println(Calendar.getCalNo()+"dddddddddselectket");
		System.out.println("공유캘린더" + Calendar);
		System.out.println("컨트롤러" + Calendar.getEnrollMember());
		// 등록조회 리스트
		
		String[] enrollarray = Calendar.getEnrollMember().split(",");
		int [] enrollmemno = Arrays.stream(enrollarray).mapToInt(Integer::parseInt).toArray();
		
		sService.EnrollMember(enrollmemno, Calendar.getCalNo());
	
//		sService.insertEnrollMember();
//		sService.insertgetLookMember(Calendar.getLookMember())	
		
		

	}

}