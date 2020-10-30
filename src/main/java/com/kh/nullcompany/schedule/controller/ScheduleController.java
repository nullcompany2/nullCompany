package com.kh.nullcompany.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;

	// 일정 관리 메인
	@RequestMapping("Schedulermain.do")
public ModelAndView  Schedulermain(ModelAndView mv) {
		
		// 총 부서 리스트
		ArrayList<Department> deptList =  sService.deptList();
		// 총 사원 리스트
		ArrayList<Member> memList = sService.memList();
		
		mv.addObject("deptList",deptList);
		mv.addObject("memList",memList);
		mv.setViewName("Scheduler/Schedulermain");
		return mv;
	}

	// 검색결과

	@RequestMapping("SchedulerResearch.do")
	public String SchedulerResearch(HttpServletResponse response) {
		return "Scheduler/SchedulerResearch";
	}
	
	
	
}