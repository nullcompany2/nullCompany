
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
		System.out.println("사용자 사번 : " + memNo);
		
		// 사용자가 기안자이거나 결재라인에 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);
		
		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);
		
	    
	    // 문서 리스트 상태값(sStatus) 뽑기
	    // 진행중인 문서(completeDate == null)
	    if(!dList.isEmpty()) {
	    	for( Document d : dList) {
	    		ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
	    		// 로그인 사용자가 기안자일 경우
	    		if(memNo == d.getDrafterNo()) {
	    			d.setsStatus("진행");
					// 로그인 사용자가 결재스텝일 경우 
				}else{
    			    for(Step s : sList) {
    			    	if(memNo == s.getStaffNo()) {
	    					// 사용자가 결재를 했거나, 수신자일 때
	    					if(s.getApprStatus().equals("Y") || s.getLineNo() == 3) {
	    						d.setsStatus("진행");
	    					}else {
	    						// 현재 문서 결재순번과 결재사원의 순서가 같을때(지금 결재순번이 사용자 차례일 때)
	    						if(d.getTurnNo() == s.getStepPriority()) {	    						
		    						d.setsStatus("대기");
		    					// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
		    					}else if(s.getLineNo() == 2 || d.getFormNo() == 2) {
	    							d.setsStatus("확인");
	    							// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
	    						}else if(d.getTurnNo() < s.getStepPriority()) {
	    							d.setsStatus("예정");
	    							// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
	    						}else if(d.getTurnNo() > s.getStepPriority()) {
	    							d.setsStatus("대기");
	    						}
	    					}
    			    	}
    				}
				}
	    	}
	    	System.out.println(dList);
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
