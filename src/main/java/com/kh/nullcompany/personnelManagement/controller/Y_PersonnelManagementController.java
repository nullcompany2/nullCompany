package com.kh.nullcompany.personnelManagement.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.member.controller.MemberController;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.service.Y_PersonnelManagementService;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.Rank;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.Schedule;

@Controller
public class Y_PersonnelManagementController {

	@Autowired
	private Y_PersonnelManagementService yService;


	// 조직관리
	@RequestMapping("OrganizationManagement.do")
	public ModelAndView OrganizationManagement(ModelAndView mv,  HttpServletResponse response, HttpSession session) {
		
		// 총 부서 리스트
		ArrayList<Department> deptList = yService.deptList();
		// 총 사원 리스트
		ArrayList<Member> mList = yService.memList();


		mv.addObject("deptList", deptList);
		mv.addObject("mList", mList);

		mv.setViewName("personnel_management/OrganizationManagement");

		return mv;
	
	}
	
	// 부서 추가
	@RequestMapping("deptAdd.do")
	public String deptAdd(Model model, String deptName) {
		
		int result = yService.deptAdd(deptName);

		if(result > 0) {
			return "redirect:OrganizationManagement.do";
		}
		return deptName;
	}
	
	// 부서 수정
		@RequestMapping("deptEdit.do")
		public String deptEdit(Model model, String deptName, String text) {
			
		
			Map map = new HashMap();
			map.put("text", text);
			map.put("deptName", deptName);

			int result = yService.deptEdit(map);
			

			if(result > 0) {
				return "redirect:OrganizationManagement.do";
			}
			return deptName;
		}
		
		
		// 부서 삭제 전 부서별 리스트 뽑기
		@RequestMapping("deptTypeMemlist.do")
		public void deptTypeMemlist(ModelAndView mv, String deptName,HttpServletResponse response, HttpSession session, 
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) throws JsonIOException, IOException{
			response.setContentType("application/json; charset=utf-8");
			// 총 사원 리스트

			int listCount = yService.deptTypeMemlistCount(deptName);
			
			PageInfo pi = Pagination.getPageInfoForModal(currentPage,listCount);
			
			ArrayList<Member> mlist = yService.deptTypeMemlist(pi, deptName);
			
			ArrayList<Department> deptListmodal = yService.deptList();
			
			Map list = new HashMap();
			list.put("mlist",mlist);
			list.put("pi",pi);
			list.put("listCount",listCount);
			list.put("deptListmodal",deptListmodal);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list,response.getWriter());
			

		
		}
		
		
		// 사용자 승인 업데이트
		@RequestMapping("updateMemDept.do")
		public ModelAndView updateMemDept(ModelAndView mv, Member m,
				HttpServletRequest request){

			int result = yService.updateMemDept(m);

			System.out.println("업데이트용" + m);

			if(result>0) {
				mv.setViewName("personnel_management/OrganizationManagement");
			}else {
				mv.addObject("msg","수정실패").setViewName("common/errorPage");
			}
			return mv;

		}
	
	// 인사관리 사번으로 회원조회(모달) (Gson)
	@RequestMapping("detailMemberInfo_y.do")
	public void detailMemberInfo_y (int memNo, HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println(memNo);
		response.setContentType("application/json; charset=utf-8");
		Member m = yService.detailMemberInfo(memNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
		
		
		
	}
	
	

	// 사용자 관리
	@RequestMapping("userManagement.do")
	
	public ModelAndView userManagement(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		// 총 사원 리스트

		int listCount = yService.getMemListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		ArrayList<Member> list = yService.selectPageMemList(pi);
		
		mv.addObject("list",list);
		mv.addObject("listCount",listCount);
		mv.addObject("pi",pi);
		mv.setViewName("personnel_management/userManagement");

		return mv;

	}
	
	// 사용자 관리 검색
		@RequestMapping("userManagermentSearch.do")
		public ModelAndView SchedulerSearch(ModelAndView mv, String text, String select_option, HttpServletResponse response, HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage){
		
			if(select_option.equals("이름")) {
				int listCount = yService.Name_SearchCount(text);
				PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
				
				ArrayList<Member> list = yService.Name_Search(pi,text);
				System.out.println("검색" + list);
				
				mv.addObject("list", list);
				mv.addObject("listCount",listCount);
				mv.addObject("pi",pi);
				
				mv.setViewName("personnel_management/userManagermentSearch");
				
				return mv;
			}else {
				int listCount = yService.ID_SearchCount(text);
				PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
				
				ArrayList<Member> list = yService.ID_Search(pi,text);
				System.out.println("검색" + list);
				mv.addObject("list", list);
				
				mv.setViewName("personnel_management/userManagermentSearch");
				
				return mv;
				
			}

			
		}

	// 직위 관리
	@RequestMapping("rankManagement.do")
	public String rankManagement(HttpServletResponse response) {
		return "personnel_management/rankManagement";
		
		
	}



	// 사용자 승인 관리 리스트

	@RequestMapping("userApprovalManagement.do")
	public ModelAndView ApprovalList(ModelAndView mv, 
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {

		int userApprovalListCount = yService.userApprovalListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage,userApprovalListCount);
		
		// 승인대기 리스트
		ArrayList<Member> ApprovalList = yService.selectApprovalList(pi);
		
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


}