
package com.kh.nullcompany.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.approval.model.service.ApprovalService;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.member.model.vo.Member;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService aService;
	
	
	// 진행중인 문서 목록 불러오기
	@RequestMapping("approvalProgressListView.do")
	public ModelAndView approvalProgressListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			                                     @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		// 사용자가 기안자이거나 결재라인에 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);
		
		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);
		
		if(dList.isEmpty()) {
			
		}
		  
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("approvalCompleteDList.do")
	public String approvalCompleteDList(HttpServletResponse response) {
		return "approval/approvalCompleteDList";
	}
	
	@RequestMapping("approvalAllDList.do")
	public String approvalAllDList(HttpServletResponse response) {
		return "approval/approvalAllDList";
	}
	
	@RequestMapping("approvalDeleteDList.do")
	public String approvalDeleteDList(HttpServletResponse response) {
		return "approval/approvalDeleteDList";
	}
	
	@RequestMapping("contactDetail.do")
	public String contactDetail(HttpServletResponse response) {
		return "approval/approvalContactDetail";
	}
	
	@RequestMapping("referDetail.do")
	public String referDetail(HttpServletResponse response) {
		return "approval/approvalReferDetail";
	}
	
	@RequestMapping("leaveDetail.do")
	public String leaveDetail(HttpServletResponse response) {
		return "approval/approvalLeaveDetail";
	}
	
	@RequestMapping("absenceDetail.do")
	public String absenceDetail(HttpServletResponse response) {
		return "approval/approvalAbsenceDetail";
	}
	
	@RequestMapping("resignDetail.do")
	public String resignDetail(HttpServletResponse response) {
		return "approval/approvalResignDetail";
	}
	
	@RequestMapping("approvalInsertView.do")
	public String approvalInsertView(HttpServletResponse response) {
		return "approval/approvalInsertForm";
	}
}
