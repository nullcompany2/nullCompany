
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
import com.kh.nullcompany.approval.model.vo.Step;
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
		System.out.println(memNo);
		
		// 사용자가 기안자이거나 결재라인에 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);
		
		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);
		
	    System.out.println(dList);
	    
	    
	    if(!dList.isEmpty()) {
	    	for( Document d : dList) {
	    		if(memNo == d.getDrafterNo()) {
					d.setsStatus("진행");
				}
	    		else{
		    		ArrayList<Step> sList = aService.selectProgressStep(memNo,d.getDocTempNo());
		    		if(!sList.isEmpty()) {
		    			for(Step s : sList) {
		    				// 문서에 속한 결재자 수 뽑기
		    				d.setStepCount(aService.stepListCount(d.getDocTempNo()));
		    				if(d.getStepCount() != 0) {
			    				if(memNo == s.getStaffNo()) {
			    					if(s.getApprStatus().equals("Y")) {
			    						d.setsStatus("진행");
			    						break;
			    					}else {
			    						if(d.getTurnNo() == s.getStepPriority()) {	    						
				    						d.setsStatus("대기");
				    						break;
				    					}else if(s.getLineNo() == 2) {
			    							d.setsStatus("확인");
			    							break;
			    						}else if(d.getTurnNo() < s.getStepPriority()) {
			    							d.setsStatus("예정");
			    							break;
			    						}else if(d.getTurnNo() > s.getStepPriority()) {
			    							d.setsStatus("대기");
			    							break;
			    						}
			    					}
//			    					if(d.getTurnNo() == s.getStepPriority()) {	    						
//			    						d.setsStatus("대기");
//			    					}else if(s.getApprStatus().equals("Y")) {
//			    						d.setsStatus("진행");
//			    						if(d.getTurnNo() > s.getStepPriority() || s.getApprStatus().equals("N") ) {
//			    							d.setsStatus("대기");
//			    						}else if(d.getTurnNo() <= s.getStepPriority()) {
//			    							d.setsStatus("진행");
//			    						}
//			    					}else if(d.getTurnNo() < s.getStepPriority() && s.getApprStatus().equals("N")) {
//			    						d.setsStatus("예정");
//			    					}else if(s.getLineNo() == 2 && s.getApprStatus().equals("N")) {
//			    						d.setsStatus("확인");
//			    					}else if(s.getLineNo() == 2 && s.getApprStatus().equals("Y")) {
//			    						d.setsStatus("진행");
//			    					}
			    				}
		    				}	
		    			}
		    		}
	    		}
	    		System.out.println(d.getsStatus());
	    	}
	    }
	    
	    
		
		if(!dList.isEmpty()) {
			mv.addObject(dList);
			mv.setViewName("approval/approvalProgressListView");
		}else {
			mv.addObject("msg", "전자결재 리스트 에러!");
			mv.setViewName("common/errorPage");
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
