
package com.kh.nullcompany.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.approval.model.service.ApprovalService;
import com.kh.nullcompany.approval.model.vo.Absence;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.Leave;
import com.kh.nullcompany.approval.model.vo.Resign;
import com.kh.nullcompany.approval.model.vo.Step;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.member.model.vo.Member;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService aService;

	// 진행중인 문서 목록(전체) 불러오기
	@RequestMapping("approvalProgressAllListView.do")
	public ModelAndView approvalProgressAllListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		System.out.println("사용자 사번 : " + memNo);

		// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);

		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);

		// 사용자가 바라보는 문서 리스트 상태값(sStatus) 뽑기
		// 진행중인 문서(completeDate == null)
		for (Document d : dList) {
			ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
			// 로그인 사용자가 기안자일 경우
			if (memNo == d.getDrafterNo()) {
				d.setsStatus("진행");
				// 로그인 사용자가 결재스텝일 경우
			} else {
				for (Step s : sList) {
					if (memNo == s.getStaffNo()) {
						// 사용자가 결재를 했거나, 수신자일 때
						if (s.getApprStatus().equals("Y") || s.getLineNo() == 3) {
							d.setsStatus("진행");
						} else {
							// 현재 문서 결재순번과 결재사원의 순서가 같을때(지금 결재순번이 사용자 차례일 때)
							if (d.getTurnNo() == s.getStepPriority()) {
								d.setsStatus("대기");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("확인");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예정");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					}
				
				}
			}
		}
			
		String catagory = "전체";
		
		mv.addObject("dList", dList);
		mv.addObject("pi", pi);
		mv.addObject("catagory", catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}

	// 진행중인 문서 목록(대기) 불러오기
	@RequestMapping("standByDocListView.do")
	public ModelAndView standByDocListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		System.out.println("사용자 사번 : " + memNo);

		// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);

		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);

		ArrayList<Document> dList2 = new ArrayList<Document>();
		
		for (Document d : dList) {
			ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
			// 로그인 사용자가 기안자일 경우
			if (memNo == d.getDrafterNo()) {
				d.setsStatus("진행");
				// 로그인 사용자가 결재스텝일 경우 
			} else {
				for (Step s : sList) {
					if (memNo == s.getStaffNo()) {
						// 사용자가 결재를 했거나, 수신자일 때
						if (s.getApprStatus().equals("Y") || s.getLineNo() == 3) {
							d.setsStatus("진행");
						} else {
							// 현재 문서 결재순번과 결재사원의 순서가 같을때(지금 결재순번이 사용자 차례일 때)
							if (d.getTurnNo() == s.getStepPriority()) {
								
								d.setsStatus("대기");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("확인");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예정");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					} 
				}
			}
			if(d.getsStatus().equals("대기") || d.getsStatus().equals("후결 대기")) {
				 dList2.add(d);
			}
		}
		
		String catagory = "대기";
		mv.addObject("dList", dList2);
		mv.addObject("pi", pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}
	
	// 진행중인 문서 목록(확인) 불러오기
	@RequestMapping("checkDocListView.do")
	public ModelAndView chechDocListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		System.out.println("사용자 사번 : " + memNo);

		// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);

		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);

		ArrayList<Document> dList2 = new ArrayList<Document>();
		
		for (Document d : dList) {
			ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
			// 로그인 사용자가 기안자일 경우
			if (memNo == d.getDrafterNo()) {
				d.setsStatus("진행");
				// 로그인 사용자가 결재스텝일 경우 
			} else {
				for (Step s : sList) {
					if (memNo == s.getStaffNo()) {
						// 사용자가 결재를 했거나, 수신자일 때
						if (s.getApprStatus().equals("Y") || s.getLineNo() == 3) {
							d.setsStatus("진행");
						} else {
							// 현재 문서 결재순번과 결재사원의 순서가 같을때(지금 결재순번이 사용자 차례일 때)
							if (d.getTurnNo() == s.getStepPriority()) {
								d.setsStatus("대기");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("확인");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예정");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					}
				}
			}
			if(d.getsStatus().equals("확인")) {
				 dList2.add(d);
			}
		}
			
		String catagory = "확인";
		mv.addObject("dList", dList2);
		mv.addObject("pi", pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}
	
	// 진행중인 문서 목록(예정) 불러오기
	@RequestMapping("scheduledDocListView.do")
	public ModelAndView scheduledDocListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		System.out.println("사용자 사번 : " + memNo);

		// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);

		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);

		ArrayList<Document> dList2 = new ArrayList<Document>();
		
		for (Document d : dList) {
			ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
			// 로그인 사용자가 기안자일 경우
			if (memNo == d.getDrafterNo()) {
				d.setsStatus("진행");
				// 로그인 사용자가 결재스텝일 경우 
			} else {
				for (Step s : sList) {
					if (memNo == s.getStaffNo()) {
						// 사용자가 결재를 했거나, 수신자일 때
						if (s.getApprStatus().equals("Y") || s.getLineNo() == 3) {
							d.setsStatus("진행");
						} else {
							// 현재 문서 결재순번과 결재사원의 순서가 같을때(지금 결재순번이 사용자 차례일 때)
							if (d.getTurnNo() == s.getStepPriority()) {
								d.setsStatus("대기");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("확인");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예정");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					}
				}
			}
			if(d.getsStatus().equals("예정")) {
				 dList2.add(d);
			}
		}
			
		String catagory = "예정";
		mv.addObject("dList", dList2);
		mv.addObject("pi", pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}
	
	// 진행중인 문서 목록(진행) 불러오기
	@RequestMapping("progressListView.do")
	public ModelAndView progressListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		System.out.println("사용자 사번 : " + memNo);

		// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
		int listCount = aService.getProgressAllListCount(memNo);

		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo, pi);

		ArrayList<Document> dList2 = new ArrayList<Document>();
		
		for (Document d : dList) {
			ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
			// 로그인 사용자가 기안자일 경우
			if (memNo == d.getDrafterNo()) {
				d.setsStatus("진행");
				// 로그인 사용자가 결재스텝일 경우 
			} else {
				for (Step s : sList) {
					if (memNo == s.getStaffNo()) {
						// 사용자가 결재를 했거나, 수신자일 때
						if (s.getApprStatus().equals("Y") || s.getLineNo() == 3) {
							d.setsStatus("진행");
						} else {
							// 현재 문서 결재순번과 결재사원의 순서가 같을때(지금 결재순번이 사용자 차례일 때)
							if (d.getTurnNo() == s.getStepPriority()) {
								d.setsStatus("대기");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("확인");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예정");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					}
				}
			}
			if(d.getsStatus().equals("진행")) {
				 dList2.add(d);
			}
		}
			
		String catagory = "진행";
		mv.addObject("dList", dList2);
		mv.addObject("pi", pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}
	
	// 문서함 목록(전체) 불러오기
	@RequestMapping("approvalCompleteAllListView.do")
	public ModelAndView approvalCompleteListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
			
			// 로그인 세션 사용자 사번 가져오기
			int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
			System.out.println("사용자 사번 : " + memNo);

			// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
			int listCount = aService.getCompleteAllListCount(memNo);

			// 페이징
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo, pi);
		
			for(Document d : dList) {
				ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
				// 로그인 사용자가 기안자이거나 문서가 반려되지 않았을 때
				if(memNo == d.getDrafterNo() && d.getrStatus().equals("N")) {
					d.setsStatus("기안");
				// 문서가 반려되었을 때
				}else if(d.getrStatus().equals("Y")) {
					d.setsStatus("반려");
				}else {
					for(Step s : sList) {
						if(memNo == s.getStaffNo()) {
							if(s.getLineNo() == 1) {
								d.setsStatus("결재");
							}else if(s.getLineNo() == 2) {
								d.setsStatus("회람");
							}else if(s.getLineNo() == 3) {
								d.setsStatus("수신");
							}
						}
					}
				}
			}
		String catagory="전체";
		mv.addObject("dList",dList);
		mv.addObject("pi",pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalCompleteListView");
		return mv;
	}
	
	// 문서함 목록(기안) 불러오기
	@RequestMapping("draftListView.do")
	public ModelAndView draftListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
			
			// 로그인 세션 사용자 사번 가져오기
			int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
			System.out.println("사용자 사번 : " + memNo);

			// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
			int listCount = aService.getCompleteAllListCount(memNo);

			// 페이징
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo, pi);
			
			ArrayList<Document> dList2 = new ArrayList<Document>();
		
			for(Document d : dList) {
				ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
				// 로그인 사용자가 기안자이거나 문서가 반려되지 않았을 때
				if(memNo == d.getDrafterNo() && d.getrStatus().equals("N")) {
					d.setsStatus("기안");
				// 문서가 반려되었을 때
				}else if(d.getrStatus().equals("Y")) {
					d.setsStatus("반려");
				}else {
					for(Step s : sList) {
						if(memNo == s.getStaffNo()) {
							if(s.getLineNo() == 1) {
								d.setsStatus("결재");
							}else if(s.getLineNo() == 2) {
								d.setsStatus("회람");
							}else if(s.getLineNo() == 3) {
								d.setsStatus("수신");
							}
						}
					}
				}
				if(d.getsStatus().equals("기안")) {
					dList2.add(d);
				}
			}
		String catagory="기안";
		mv.addObject("dList",dList2);
		mv.addObject("pi",pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalCompleteListView");
		return mv;
	}
	
	// 문서함 목록(결재) 불러오기
	@RequestMapping("approvalListView.do")
	public ModelAndView approvalListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
			
			// 로그인 세션 사용자 사번 가져오기
			int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
			System.out.println("사용자 사번 : " + memNo);

			// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
			int listCount = aService.getCompleteAllListCount(memNo);

			// 페이징
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo, pi);
			
			ArrayList<Document> dList2 = new ArrayList<Document>();
		
			for(Document d : dList) {
				ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
				// 로그인 사용자가 기안자이거나 문서가 반려되지 않았을 때
				if(memNo == d.getDrafterNo() && d.getrStatus().equals("N")) {
					d.setsStatus("기안");
				// 문서가 반려되었을 때
				}else if(d.getrStatus().equals("Y")) {
					d.setsStatus("반려");
				}else {
					for(Step s : sList) {
						if(memNo == s.getStaffNo()) {
							if(s.getLineNo() == 1) {
								d.setsStatus("결재");
							}else if(s.getLineNo() == 2) {
								d.setsStatus("회람");
							}else if(s.getLineNo() == 3) {
								d.setsStatus("수신");
							}
						}
					}
				}
				if(d.getsStatus().equals("결재")) {
					dList2.add(d);
				}
			}
		String catagory="결재";
		mv.addObject("dList",dList2);
		mv.addObject("pi",pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalCompleteListView");
		return mv;
	}
	// 문서함 목록(수신) 불러오기
	@RequestMapping("receiveListView.do")
	public ModelAndView recevieListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
			
			// 로그인 세션 사용자 사번 가져오기
			int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
			System.out.println("사용자 사번 : " + memNo);

			// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
			int listCount = aService.getCompleteAllListCount(memNo);

			// 페이징
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo, pi);
			
			ArrayList<Document> dList2 = new ArrayList<Document>();
		
			for(Document d : dList) {
				ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
				// 로그인 사용자가 기안자이거나 문서가 반려되지 않았을 때
				if(memNo == d.getDrafterNo() && d.getrStatus().equals("N")) {
					d.setsStatus("기안");
				// 문서가 반려되었을 때
				}else if(d.getrStatus().equals("Y")) {
					d.setsStatus("반려");
				}else {
					for(Step s : sList) {
						if(memNo == s.getStaffNo()) {
							if(s.getLineNo() == 1) {
								d.setsStatus("결재");
							}else if(s.getLineNo() == 2) {
								d.setsStatus("회람");
							}else if(s.getLineNo() == 3) {
								d.setsStatus("수신");
							}
						}
					}
				}
				if(d.getsStatus().equals("수신")) {
					dList2.add(d);
				}
			}
		String catagory="수신";
		mv.addObject("dList",dList2);
		mv.addObject("pi",pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalCompleteListView");
		return mv;
	}
	
	// 문서함 목록(회람) 불러오기
	@RequestMapping("referenceListView.do")
	public ModelAndView referenceListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
			
			// 로그인 세션 사용자 사번 가져오기
			int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
			System.out.println("사용자 사번 : " + memNo);

			// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
			int listCount = aService.getCompleteAllListCount(memNo);

			// 페이징
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo, pi);
			
			ArrayList<Document> dList2 = new ArrayList<Document>();
		
			for(Document d : dList) {
				ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
				// 로그인 사용자가 기안자이거나 문서가 반려되지 않았을 때
				if(memNo == d.getDrafterNo() && d.getrStatus().equals("N")) {
					d.setsStatus("기안");
				// 문서가 반려되었을 때
				}else if(d.getrStatus().equals("Y")) {
					d.setsStatus("반려");
				}else {
					for(Step s : sList) {
						if(memNo == s.getStaffNo()) {
							if(s.getLineNo() == 1) {
								d.setsStatus("결재");
							}else if(s.getLineNo() == 2) {
								d.setsStatus("회람");
							}else if(s.getLineNo() == 3) {
								d.setsStatus("수신");
							}
						}
					}
				}
				if(d.getsStatus().equals("회람")) {
					dList2.add(d);
				}
			}
		String catagory="회람";
		mv.addObject("dList",dList2);
		mv.addObject("pi",pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalCompleteListView");
		return mv;
	}
	
	// 문서함 목록(반려) 불러오기
	@RequestMapping("rejectListView.do")
	public ModelAndView rejectListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
			
			// 로그인 세션 사용자 사번 가져오기
			int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
			System.out.println("사용자 사번 : " + memNo);

			// 로그인 사용자가 기안자이거나 결재 스탭에 포함되어 있는 문서의 갯수 조회
			int listCount = aService.getCompleteAllListCount(memNo);

			// 페이징
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(10개씩)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo, pi);
			
			ArrayList<Document> dList2 = new ArrayList<Document>();
		
			for(Document d : dList) {
				ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
				// 로그인 사용자가 기안자이거나 문서가 반려되지 않았을 때
				if(memNo == d.getDrafterNo() && d.getrStatus().equals("N")) {
					d.setsStatus("기안");
				// 문서가 반려되었을 때
				}else if(d.getrStatus().equals("Y")) {
					d.setsStatus("반려");
				}else {
					for(Step s : sList) {
						if(memNo == s.getStaffNo()) {
							if(s.getLineNo() == 1) {
								d.setsStatus("결재");
							}else if(s.getLineNo() == 2) {
								d.setsStatus("회람");
							}else if(s.getLineNo() == 3) {
								d.setsStatus("수신");
							}
						}
					}
				}
				if(d.getsStatus().equals("반려")) {
					dList2.add(d);
				}
			}
		String catagory="반려";
		mv.addObject("dList",dList2);
		mv.addObject("pi",pi);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalCompleteListView");
		return mv;
	}
	
	// 문서 상세보기
	@RequestMapping("approvalDetail.do")
	public ModelAndView approvalDetail(ModelAndView mv, HttpServletResponse response, HttpSession session, String docNo) {
		
		Document d = aService.approvalDetail(docNo);
		
		ArrayList<Step> sList = aService.selectStepList(d.getDocTempNo());
		
		ArrayList<Step> apprList = new ArrayList<Step>();
		ArrayList<Step> checkList = new ArrayList<Step>();
		ArrayList<Step> receiveList = new ArrayList<Step>();
		
		for(Step s : sList) {
			if(s.getLineNo() == 1) {
				apprList.add(s);
			}else if(s.getLineNo() == 2) {
				checkList.add(s);
			}else {
				receiveList.add(s);
			}
		}
		
		mv.addObject("d",d);
		
		// 업무연락 문서일 때 
		if(d.getFormNo() == 1) {
			mv.addObject("apprList",apprList);
			mv.addObject("checkList",checkList);
			mv.addObject("receiveList",receiveList);
			mv.setViewName("approval/businessDocumentDetail");
		// 회람 문서일 때
		}else if(d.getFormNo() == 2) {
			mv.addObject("checkList",checkList);
			mv.setViewName("approval/referDocumentDetail");
	    // 휴가 신청서일 때
		}else if(d.getFormNo() == 3) {
			Leave leaveInfo = aService.selectLeaveInfo(d.getDocTempNo());
			mv.addObject("apprList",apprList);
			mv.addObject("checkList",checkList);
			mv.addObject("receiveList",receiveList);
			mv.addObject("leaveInfo",leaveInfo);
			mv.setViewName("approval/leaveDocumentDetail");
		// 휴직 신청서일 때
		}else if(d.getFormNo() == 4) {
			Absence absenceInfo = aService.selectAbsenceInfo(d.getDocTempNo());
			mv.addObject("apprList",apprList);
			mv.addObject("checkList",checkList);
			mv.addObject("receiveList",receiveList);
			mv.addObject("absenceInfo",absenceInfo);
			mv.setViewName("approval/absenceDocumentDetail");
		// 사직서일 때
		}else {
			Resign resignInfo = aService.selectResignInfo(d.getDocTempNo());
			mv.addObject("apprList",apprList);
			mv.addObject("checkList",checkList);
			mv.addObject("receiveList",receiveList);
			mv.addObject("resignInfo",resignInfo);
			mv.setViewName("approval/resignDocumentDetail");
		}
		
		
		return mv;
	}
	
	// 결재하기
	@RequestMapping("approvalSigning.do")
	public String approvalSigning(Model model, HttpServletResponse response, HttpSession session, String docTempNo, String docNo) {
		
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		
		Document d = aService.approvalDetail(docNo);
		
		
		ArrayList<Step> sList = aService.selectStepList(docTempNo);
		
		ArrayList<Step> apprList = new ArrayList<Step>();
		ArrayList<Step> checkList = new ArrayList<Step>();
		ArrayList<Step> receiveList = new ArrayList<Step>();
		
		for(Step s : sList) {
			if(s.getLineNo() == 1) {
				apprList.add(s);
			}else if(s.getLineNo() == 2) {
				checkList.add(s);
			}else {
				receiveList.add(s);
			}
		}
		
		// 결재자 수(결재자 수 == 최종 결재자 순번)
		int stepListCount = apprList.size();
		
		int result1 = 0;
		int result2 = 0;
		
		for(Step s : apprList) {
			if(memNo == s.getStaffNo()) {
				// 현재 사용자의 결재 순번이 결재자 수(최종 결재자 순번) 보다 낮을 때
				if(stepListCount > s.getStepPriority()) {
					// 후결 버튼 클릭할 때(문서 순번은 바꾸지 않음)
					if(d.getTurnNo() > s.getStepPriority()){
						result1 = aService.stepSigning(docTempNo, memNo);
					// 결재 버튼 클릭할 때(문서 순번을 사용자의 다음 스텝 순번으로 변경해줌)
					}else {
						result1 = aService.stepSigning(docTempNo, memNo);
						result2 = aService.documentSigning(docTempNo, s.getStepPriority());
					}
				// 현재 사용자의 결재 순번이 결재자 수(최종 결재자 순번)과 같을때 --> 최종 결재자일 때
				}else if(stepListCount == s.getStepPriority()) {
					// 결재하기
					result1 = aService.stepSigning(docTempNo, memNo);
					result2 = aService.decisionSigning(docTempNo, s.getStepPriority());
				}
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:approvalDetail.do?docNo="+docNo;
		}else if(result1 > 0) {
			return "redirect:approvalDetail.do?docNo="+docNo;
		}else {
			model.addAttribute("msg", "결재 오류!");
			return "common/errorPage";
		}
	}
	
	// 반려하기
	@RequestMapping("approvalRejecting.do")
	public String approvalRejecting(Model model, HttpServletResponse response, HttpSession session, String docTempNo, String docNo) {
		
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();		
		
		ArrayList<Step> sList = aService.selectStepList(docTempNo);
		
		ArrayList<Step> apprList = new ArrayList<Step>();
		ArrayList<Step> checkList = new ArrayList<Step>();
		ArrayList<Step> receiveList = new ArrayList<Step>();
		
		for(Step s : sList) {
			if(s.getLineNo() == 1) {
				apprList.add(s);
			}else if(s.getLineNo() == 2) {
				checkList.add(s);
			}else {
				receiveList.add(s);
			}
		}
		
		// 결재자 수(결재자 수 == 최종 결재자 순번)
		int stepListCount = apprList.size();
		
		int result1 = 0;
		int result2 = 0;

		for(Step s : apprList) {
			// 반려는 결재자 순번과 관계없이 문서 완료 처리를 한다.(상위 미 결재자는 반려처리) (최종 결재자 순번 == 결재자 수)의 식이 성립-->문서 순번을 최상위 순위로 올려서 처리함
			if(memNo == s.getStaffNo()) {
				result1 = aService.stepRejecting(docTempNo, memNo);
				result2 = aService.decisionRejecting(docTempNo, stepListCount);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:approvalDetail.do?docNo="+docNo;
		}else {
			model.addAttribute("msg", "반려 오류!");
			return "common/errorPage";
		}
	}
	
	// 확인하기
	@RequestMapping("referSigning.do")
	public String referSigning(Model model, HttpServletResponse response, HttpSession session, String docTempNo, String docNo) {
		
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();
		
		Document d = aService.approvalDetail(docNo);
		
		
		ArrayList<Step> sList = aService.selectStepList(docTempNo);
		
		ArrayList<Step> apprList = new ArrayList<Step>();
		ArrayList<Step> checkList = new ArrayList<Step>();
		ArrayList<Step> receiveList = new ArrayList<Step>();
		
		for(Step s : sList) {
			if(s.getLineNo() == 1) {
				apprList.add(s);
			}else if(s.getLineNo() == 2) {
				checkList.add(s);
			}else {
				receiveList.add(s);
			}
		}
		
		// 회람 문서에서 확인완료한 스텝 수
		int completeStepCount = 0;
		
		// 참조자 수
		int stepListCount = checkList.size();
		
		int result1 = 0;
		int result2 = 0;
		
		// 회람 문서일 때
		if(d.getFormNo() == 2) {
			// 확인 완료한 스텝 수 찾기
			for(Step s : checkList) {
				if(s.getApprStatus().equals("Y")) {
					completeStepCount++;
				}
			}
			for(Step s : checkList) {
				if(memNo == s.getStaffNo()) {
					// 현재 사용자가 마지막으로 확인처리를 할 때
					if(completeStepCount == stepListCount-1) {
						result1 = aService.stepReference(docTempNo, memNo);
						result2 = aService.decisionReference(docTempNo);
					// 현재 사용자가 마지막이 아닐 때(미확인 참조자가 있을 때)
					}else {
						result1 = aService.stepReference(docTempNo, memNo);
					}
				}
			}
		// 회람 문서가 아닐 때
		}else {
			for(Step s : checkList) {
				if(memNo == s.getStaffNo()) {
					result1 = aService.stepReference(docTempNo, memNo);
				}
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:approvalDetail.do?docNo="+docNo;
		}else if(result1 > 0) {
			return "redirect:approvalDetail.do?docNo="+docNo;
		}else {
			model.addAttribute("msg", "확인 오류!");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("approvalInsertView.do")
	public String approvalInsertView(HttpServletResponse response) {
		return "approval/approvalSelectDocumentForm";
	}

	
	@RequestMapping("selectFormView.do")
	public ModelAndView selectFormView(ModelAndView mv, HttpSession session, int option) {
		System.out.println("서식번호 : " + option);
		
		// 임시 문서
		Document d = new Document();
		d.setFormNo(option);
		d.setDrafterNo(((Member) session.getAttribute("loginUser")).getMemNo());
		d.setDrafterName(((Member) session.getAttribute("loginUser")).getName());
		d.setDrafterDeptNo(((Member) session.getAttribute("loginUser")).getDeptNo());
		d.setDrafterDeptName(((Member) session.getAttribute("loginUser")).getDeptName());
		d.setDrafterRankNo(((Member) session.getAttribute("loginUser")).getLankNo());
		d.setDrafterRankName(((Member) session.getAttribute("loginUser")).getRankName());
		
		
		
		// 임시 문서 생성하기(결재선 설정을 위한 선행작업)
		int result = aService.insertTempDocument(d);
		
		if(result > 0) {
			if(option == 1) {
				d.setFormName("업무연락");
				mv.addObject("d", d);
				mv.setViewName("approval/businessInsertForm");
			}else if(option == 2) {
				d.setFormName("회람");
				mv.addObject("d", d);
				mv.setViewName("approval/referInsertForm");
			}else if(option == 3) {
				d.setFormName("휴가");
				mv.addObject("d", d);
				mv.setViewName("approval/leaveInsertForm");
			}else if(option == 4) {
				d.setFormName("휴직");
				mv.addObject("d", d);
				mv.setViewName("approval/absenceInsertForm");
			}else if(option == 5){
				d.setFormName("사직");
				mv.addObject("d", d);
				mv.setViewName("approval/resignInsertForm");
			}
			
		}
		
		return mv;
	}
	
//	@ResponseBody
//	@RequestMapping("test.do")
//	public void test(@RequestParam("docTempNo") String docTempNo) {
//		
//	}

	@RequestMapping("approvalAllDList.do")
	public String approvalAllDList(HttpServletResponse response) {
		return "approval/approvalAllDList";
	}

	@RequestMapping("approvalDeleteDList.do")
	public String approvalDeleteDList(HttpServletResponse response) {
		return "approval/approvalDeleteDList";
	}


}
