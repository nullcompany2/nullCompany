package com.kh.nullcompany.approval.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class approvalController {
	
	@RequestMapping("approvalProgressDList.do")
	public String approvalProgressDList(HttpServletResponse response) {
		return "approval/approvalProgressDList";
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
