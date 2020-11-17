
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
	public ModelAndView approvalDetail(ModelAndView mv, HttpServletResponse response, HttpSession session, String docNo, int formNo) {
		
		Document d = aService.approvalDetail(docNo);
		System.out.println("문서 정보 : " + d);
		
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
		}
		
		return mv;
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
