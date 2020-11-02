package com.kh.nullcompany.personnelManagement.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.controller.MemberController;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.service.Y_PersonnelManagementService;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;
import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;

@Controller
public class Y_PersonnelManagementController {

	@Autowired
	private Y_PersonnelManagementService yService;


	// 조직관리
	@RequestMapping("OrganizationManagement.do")
	public String OrganizationManage(HttpServletResponse response) {
		return "personnel_management/OrganizationManagement";
	}

	// 사용자 관리
	@RequestMapping("userManagement.do")
	public String userManagement(HttpServletResponse response) {
		return "personnel_management/userManagement";
	}

	// 직위 관리
	@RequestMapping("rankManagement.do")
	public String rankManagement(HttpServletResponse response) {
		return "personnel_management/rankManagement";
	}

	// 사용자 승인 관리
	//	@RequestMapping("userApprovalManagement.do")
	//	public String userApprovalManagement(HttpServletResponse response) {
	//		return "personnel_management/userApprovalManagement";
	//	}

	// 사용자 승인 관리 리스트

	@RequestMapping("userApprovalManagement.do")
	public ModelAndView ApprovalList(ModelAndView mv, 
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {

		System.out.println("페이지" + currentPage);

		// 승인대기 리스트
		ArrayList<Member> ApprovalList = yService.selectApprovalList();
		// 부서 리스트 
		ArrayList<Department> DeptList = yService.selectDeptList();		
		// 직위 리스트
		ArrayList<Rank> RankList = yService.selectRankList();

		mv.setViewName("personnel_management/userApprovalManagement");
		mv.addObject("ApprovalList",ApprovalList);
		mv.addObject("DeptList",DeptList);
		mv.addObject("RankList",RankList);


		return mv;

	}

	// 부서 리스트 
	//	@RequestMapping("deptListSelect.do")
	//	public ModelAndView deptListSelect(ModelAndView mv) {
	//		ArrayList<Department> DeptList = yService.selectDeptList();
	//		
	//		
	//		mv.addObject("DeptList",DeptList);
	//		mv.setViewName("personnel_management/userApprovalManagement");
	//
	//		
	//		
	//		return mv;
	//	}



	// 사용자 승인 업데이트
	@RequestMapping("updateacceptMember.do")
	public ModelAndView updateacceptMember(ModelAndView mv, Member m,
			HttpServletRequest request){


		int result = yService.updateMember(m);

		System.out.println("업데이트용" + m);

		if(result>0) {
			mv.addObject("memNo",m.getMemNo()).setViewName("redirect:userApprovalManagement.do");
		}else {
			mv.addObject("msg","수정실패").setViewName("common/errorPage");
		}
		return mv;

	}


	@RequestMapping("aprrovalEmail.do")
	public String aprrovalEmail(ModelAndView mv, Email e, HttpServletRequest request) {
		System.out.println(e);

		int result = yService.aprrovalEmail(e);
		System.out.println("이메일" + e);

		if(result > 0) {
			return "redirect:userApprovalManagement.do";
		}else {
			mv.addObject("msg", "이메일 넣기 실패임");
			return "common/errorPage";
		}

	}



	// 관리자 추가
	@RequestMapping("assignManager.do")
	public String assignManager(HttpServletResponse response) {
		return "personnel_management/assignManager";
	}

//	// 일정관리
//	@RequestMapping("Schedulermain.do")
//	public String Schedulermain(HttpServletResponse response) {
//		return "personnel_Scheduler/Schedulermain";
//	}

}