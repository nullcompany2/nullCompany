
package com.kh.nullcompany.approval.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.approval.model.service.ApprovalService;
import com.kh.nullcompany.approval.model.vo.Absence;
import com.kh.nullcompany.approval.model.vo.DeptList;
import com.kh.nullcompany.approval.model.vo.DivDeptStaff;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.DocumentListCount;
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
								d.setsStatus("미결");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("참조 대기");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예결");
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
		mv.addObject("listCount",listCount);
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

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo);

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
								
								d.setsStatus("미결");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("참조 대기");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예결");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					} 
				}
			}
			if(d.getsStatus().equals("미결") || d.getsStatus().equals("후결 대기")) {
				 dList2.add(d);
			}
		}
		
		String catagory = "대기";
		int listCount = dList2.size();
		
		mv.addObject("dList", dList2);
		mv.addObject("listCount",listCount);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}
	
	// 진행중인 문서 목록(참조) 불러오기
	@RequestMapping("checkDocListView.do")
	public ModelAndView chechDocListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();


		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo);

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
								d.setsStatus("미결");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("참조 대기");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예결");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					}
				}
			}
			if(d.getsStatus().equals("참조 대기")) {
				 dList2.add(d);
			}
		}
			
		String catagory = "참조";
		int listCount = dList2.size();
		
		mv.addObject("dList", dList2);
		mv.addObject("listCount",listCount);
		mv.addObject("catagory",catagory);
		mv.setViewName("approval/approvalProgressListView");
		
		return mv;
	}
	
	// 진행중인 문서 목록(예결) 불러오기
	@RequestMapping("scheduledDocListView.do")
	public ModelAndView scheduledDocListView(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();


		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo);

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
								d.setsStatus("미결");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("참조 대기");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예결");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					}
				}
			}
			if(d.getsStatus().equals("예결")) {
				 dList2.add(d);
			}
		}
			
		String catagory = "예결";
		int listCount = dList2.size();
		
		mv.addObject("dList", dList2);
		mv.addObject("listCount",listCount);
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

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo);

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
								d.setsStatus("미결");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("참조 대기");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예결");
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
		int listCount = dList2.size();
		
		mv.addObject("dList", dList2);
		mv.addObject("listCount",listCount);
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
		mv.addObject("listCount",listCount);
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

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo);
			
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
		int listCount = dList2.size();
		
		mv.addObject("dList",dList2);
		mv.addObject("listCount",listCount);
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

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo);
			
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
		int listCount = dList2.size();
		
		mv.addObject("dList",dList2);
		mv.addObject("listCount",listCount);
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

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo);
			
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
		int listCount = dList2.size();
		
		mv.addObject("dList",dList2);
		mv.addObject("listCount",listCount);
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

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo);
			
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
		int listCount = dList2.size();
		
		mv.addObject("dList",dList2);
		mv.addObject("listCount",listCount);
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

			// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
			ArrayList<Document> dList = aService.selectCompleteAllList(memNo);
			
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
		int listCount = dList2.size();
		
		mv.addObject("dList",dList2);
		mv.addObject("listCount",listCount);
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
		
		// 관리자 페이지에서 들어온 건지 여부 --> 현재 메소드는 진행중인 문서, 문서함에서 접근 
		d.setAdmin(false);
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
		
		for(Step s : sList) {
			if(s.getLineNo() == 1) {
				apprList.add(s);
			}
		}
		
		// 결재자 수(결재자 수 == 최종 결재자 순번)
		int stepListCount = apprList.size();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
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
					if(d.getFormNo() == 3) {
						// 휴가 관리용 데이터 업데이트(결재완료)
						result3 = aService.completeRecordingLeave(docTempNo);
					}else if(d.getFormNo() == 4) {
						// 휴직 관리용 데이터 입력하기
						Absence a = aService.selectAbsenceInfo(docTempNo);
						result3 = aService.recordingAbsence(d.getDrafterNo(), a.getStartDate(), a.getReason());
					}
				}
			}
		}
		
		if(result1 > 0 && result2 > 0 || result3 > 0) {
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
		
		Document d = aService.approvalDetail(docNo);
		
		ArrayList<Step> sList = aService.selectStepList(docTempNo);
		
		ArrayList<Step> apprList = new ArrayList<Step>();

		
		for(Step s : sList) {
			if(s.getLineNo() == 1) {
				apprList.add(s);
			}
		}
		
		// 결재자 수(결재자 수 == 최종 결재자 순번)
		int stepListCount = apprList.size();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;

		for(Step s : apprList) {
			// 반려는 결재자 순번과 관계없이 문서 완료 처리를 한다.(상위 미 결재자는 반려처리) (최종 결재자 순번 == 결재자 수)의 식이 성립-->문서 순번을 최상위 순위로 올려서 처리함
			if(memNo == s.getStaffNo()) {
				result1 = aService.stepRejecting(docTempNo, memNo);
				result2 = aService.decisionRejecting(docTempNo, stepListCount);
				if(d.getFormNo() == 3) {
					// 휴가 관리용 데이터 업데이트(반려) 
					result3 = aService.rejectRecodingLeave(docTempNo);
				}
			}
		}
		
		if(result1 > 0 && result2 > 0 || result3 > 0) {
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
		
		ArrayList<Step> checkList = new ArrayList<Step>();
		
		for(Step s : sList) {
			if(s.getLineNo() == 2) {
				checkList.add(s);
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
	
	// 서식 선택 화면
	@RequestMapping("approvalInsertView.do")
	public String approvalInsertView(HttpServletResponse response) {
		return "approval/approvalSelectDocumentForm";
	}

	// 문서 작성하기 화면
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
		// 부서 정보 가져가기(결재선 설정을 위한 선행작업)
		ArrayList<DeptList> dtList = aService.selectAllDept();
		
		
		if(result > 0) {
			if(option == 1) {
				d.setFormName("업무연락");
				mv.addObject("d", d);
				mv.addObject("dtList", dtList);
				mv.setViewName("approval/businessInsertForm");
			}else if(option == 2) {
				d.setFormName("회람");
				mv.addObject("d", d);
				mv.addObject("dtList", dtList);
				mv.setViewName("approval/referInsertForm");
			}else if(option == 3) {
				d.setFormName("휴가");
				mv.addObject("d", d);
				mv.addObject("dtList", dtList);
				mv.setViewName("approval/leaveInsertForm");
			}else if(option == 4) {
				d.setFormName("휴직");
				mv.addObject("d", d);
				mv.addObject("dtList", dtList);
				mv.setViewName("approval/absenceInsertForm");
			}else if(option == 5){
				d.setFormName("사직");
				mv.addObject("d", d);
				mv.addObject("dtList", dtList);
				mv.setViewName("approval/resignInsertForm");
			}
			
		}
		
		return mv;
	}
	
	// 부서별 사원 정보 가져오기
	@RequestMapping("selectDeptStaff.do")
	public void selectDeptStaff(HttpServletResponse response, int deptNo, String docTempNo) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<DivDeptStaff> dsList = aService.selectDeptStaff(deptNo, docTempNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(dsList,response.getWriter());
	}
	
	// 결재 스텝 등록하기
	@RequestMapping("insertStep.do")
	public void insertStep(HttpServletResponse response, Step s) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		// 결재자 일 때
		if(s.getLineNo() == 1) {
			// 결재 순번 정하기
			int stepCount = aService.apprStepListCount(s);
			s.setStepPriority(stepCount+1);
			
			// 결재자 등록하기
			int result = aService.apprStepInsert(s);
			
			// 등록한 결재자 정보 가져오기 
			if(result > 0) {
				Step st = aService.currentStepInfo(s);
				gson.toJson(st,response.getWriter());
			}
		// 참조자, 수신자일 때
		}else {
			// 참조자, 수신자 등록하기
			int result = aService.notApprStepInsert(s);
			
			if(result > 0) {
				// 등록한 참조자, 수신자 정보 가져오기 
				Step st = aService.currentStepInfo(s);
				
				gson.toJson(st,response.getWriter());
			}
		}
	}
	@RequestMapping("deleteStep.do")
	public void deleteStep(HttpServletResponse response,
			               @RequestParam(value="docTempNo", required=false) String docTempNo,
			               @RequestParam(value="staffNoArray", required=false) List<String> staffNoArray) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		
		// 파싱할 정수형 리스트
		List<Integer> staffNoList = new ArrayList<Integer>();
		
		// 정수형 파싱
		for(int i = 0; i < staffNoArray.size(); i++) {
			staffNoList.add(Integer.parseInt(staffNoArray.get(i)));
		}
		
		// 보낼 리스트
		ArrayList<Step> sList = new ArrayList<Step>();
		int result = 0;
		
		for(int staffNo : staffNoList) {
			result = aService.deleteStep(docTempNo, staffNo);
			
			Step s = new Step();
			s.setStaffNo(staffNo);
			// 보낼 리스트에 담기
			sList.add(s);
		}
		
		if(result > 0) {
			gson.toJson(sList,response.getWriter());
		}
	}
	
	// 인서트 페이지 나갈 때 문서 정보 삭제
	@RequestMapping("deleteTempInfo.do")
	public void deleteTempInfo(HttpServletResponse response, String docTempNo) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		// 스텝 삭제
		aService.omitStep(docTempNo);
		// 문서 삭제
		int result = aService.omitDocument(docTempNo);
		
		String word = "";
		
		if(result > 0) {
			word = "문서 삭제 성공!";
			gson.toJson(word,response.getWriter());
		}
		
	}
	
	// 업무 연락 문서 기안하기(임시 문서 업데이트)
	@RequestMapping("insertBusinessDocumet.do")
	public String insertDocument(Model model, HttpServletResponse response,
								 @RequestParam(value="docTempNo", required=false) String docTempNo,
								 @RequestParam(value="dTitle", required=false) String dTitle,
								 @RequestParam(value="dContent", required=false) String dContent) {
		
		// 스텝 가져오기(직급 순서로)
		ArrayList<Step> sList = aService.orderByStepRank(docTempNo);
		int stepCount = sList.size();
		
		// 스텝 순번 정렬하기(직급 순서대로)
		for(int i = 0; i < stepCount; i++ ) {
			sList.get(i).setStepPriority(stepCount - (stepCount - (i+1)));
			aService.sortingStep(sList.get(i).getStaffNo(), sList.get(i).getStepPriority(), docTempNo);
		}
		
		Document d = new Document();
		d.setDocTempNo(docTempNo);
		d.setdTitle(dTitle);
		d.setdContent(dContent);
		
		int result = aService.insertDocument(d);
		if(result > 0) {			
			return "redirect:approvalProgressAllListView.do";
		}else {
			model.addAttribute("msg", "문서 기안 실패!");
			return "common/errorPage";
		}
	}
	
	
	// 회람 문서 기안하기
	@RequestMapping("insertReferDocumet.do")
	public String insertReferDocumet(Model model, HttpServletResponse response,
			 @RequestParam(value="docTempNo", required=false) String docTempNo,
			 @RequestParam(value="dTitle", required=false) String dTitle,
			 @RequestParam(value="dContent", required=false) String dContent) {

		Document d = new Document();
		d.setDocTempNo(docTempNo);
		d.setdTitle(dTitle);
		d.setdContent(dContent);
		
		int result = aService.insertDocument(d);
		
		if(result > 0) {			
			return "redirect:approvalProgressAllListView.do";
		}else {
			model.addAttribute("msg", "문서 기안 실패!");
			return "common/errorPage";
		}
	}
	
	// 휴가 문서 기안하기
	@RequestMapping("insertLeaveDocumet.do")
	public String insertLeaveDocument(Model model, HttpServletResponse response, HttpSession session,
									 @RequestParam(value="docTempNo", required=false) String docTempNo,
									 @RequestParam(value="startDate", required=false) String startDate,
									 @RequestParam(value="endDate", required=false) String endDate,
									 @RequestParam(value="typeNo", required=false) int typeNo,
									 @RequestParam(value="type", required=false) String type,
									 @RequestParam(value="totalDate", required=false) int totalDate,
									 @RequestParam(value="reason", required=false) String reason) {
		
		// 스텝 가져오기(직급 순서로)
		ArrayList<Step> sList = aService.orderByStepRank(docTempNo);
		int stepCount = sList.size();
		
		// 스텝 순번 정렬하기(직급 순서대로)
		for(int i = 0; i < stepCount; i++ ) {
			sList.get(i).setStepPriority(stepCount - (stepCount - (i+1)));
			aService.sortingStep(sList.get(i).getStaffNo(), sList.get(i).getStepPriority(), docTempNo);
		}
		
		
		Document d = new Document();
		
		int drafterNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		String drafterDeptName = ((Member)session.getAttribute("loginUser")).getDeptName();
		String drafterRankName = ((Member)session.getAttribute("loginUser")).getRankName();
		String drafterName = ((Member)session.getAttribute("loginUser")).getName();
		
		d.setDocTempNo(docTempNo);
		d.setdTitle("[" + type + "]"+startDate+"("+totalDate+"일)_"+drafterDeptName+"부 / "+drafterRankName+" / "+drafterName);
		d.setdContent(reason);
		
		Leave l = new Leave();
		
		l.setDocTempNo(docTempNo);
		l.setType(type);
		l.setStartDate(startDate);
		l.setEndDate(endDate);
		l.setTotalDate(totalDate);
		l.setReason(reason);
		
		// 문서 기안하기
		int result1 = aService.insertDocument(d);
		// 휴가 정보 입력하기
		int result2 = aService.insertLeaveInfo(l);
		// 휴가 관리용 데이터 입력하기
		int result3 = aService.recordingLeave(drafterNo, typeNo, startDate, totalDate, reason, docTempNo);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 ) {
			return "redirect:approvalProgressAllListView.do";
		}else {
			model.addAttribute("msg", "문서 기안 실패!");
			return "common/errorPage";
		}
	}
	
	// 휴직 문서 기안하기
	@RequestMapping("insertAbsenceDocumet.do")
	public String insertAbsenceDocument(Model model, HttpServletResponse response, HttpSession session,
									   @RequestParam(value="docTempNo", required=false) String docTempNo,
									   @RequestParam(value="startDate", required=false) String startDate,
									   @RequestParam(value="endDate", required=false) String endDate,
									   @RequestParam(value="totalDate", required=false) int totalDate,
									   @RequestParam(value="reason", required=false) String reason) {
		
		// 스텝 가져오기(직급 순서로)
		ArrayList<Step> sList = aService.orderByStepRank(docTempNo);
		int stepCount = sList.size();
		
		// 스텝 순번 정렬하기(직급 순서대로)
		for(int i = 0; i < stepCount; i++ ) {
			sList.get(i).setStepPriority(stepCount - (stepCount - (i+1)));
			aService.sortingStep(sList.get(i).getStaffNo(), sList.get(i).getStepPriority(), docTempNo);
		}

		Document d = new Document();
		
		String drafterDeptName = ((Member)session.getAttribute("loginUser")).getDeptName();
		String drafterRankName = ((Member)session.getAttribute("loginUser")).getRankName();
		String drafterName = ((Member)session.getAttribute("loginUser")).getName();
		
		d.setDocTempNo(docTempNo);
		d.setdTitle("[휴직신청]"+startDate+"("+totalDate+"일)_"+drafterDeptName+"부 / "+drafterRankName+" / "+drafterName);
		d.setdContent(reason);
		
		Absence a = new Absence();
		
		a.setDocTempNo(docTempNo);
		a.setReason(reason);
		a.setStartDate(startDate);
		a.setEndDate(endDate);
		a.setTotalDate(totalDate);
		
		// 문서 기안하기
		int result1 = aService.insertDocument(d);
		// 휴직 정보 입력하기
		int result2 = aService.insertAbsenceInfo(a);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:approvalProgressAllListView.do";
		}else {
			model.addAttribute("msg", "문서 기안 실패!");
			return "common/errorPage";
		}
	}
	
	// 사직 문서 기안하기
	@RequestMapping("insertResignDocumet.do")
	public String insertResignDocumet(Model model, HttpServletResponse response, HttpSession session,
									  @RequestParam(value="docTempNo", required=false) String docTempNo,
									  @RequestParam(value="enrollDate", required=false) String enrollDate) {
		
		// 스텝 가져오기(직급 순서로)
		ArrayList<Step> sList = aService.orderByStepRank(docTempNo);
		int stepCount = sList.size();
		
		// 스텝 순번 정렬하기(직급 순서대로)
		for(int i = 0; i < stepCount; i++ ) {
			sList.get(i).setStepPriority(stepCount - (stepCount - (i+1)));
			aService.sortingStep(sList.get(i).getStaffNo(), sList.get(i).getStepPriority(), docTempNo);
		}
		
		Document d = new Document();
		
		String drafterDeptName = ((Member)session.getAttribute("loginUser")).getDeptName();
		String drafterRankName = ((Member)session.getAttribute("loginUser")).getRankName();
		String drafterName = ((Member)session.getAttribute("loginUser")).getName();
		
		d.setDocTempNo(docTempNo);
		d.setdTitle("[사직서]"+enrollDate+"_"+drafterDeptName+"부 / "+drafterRankName+" / "+drafterName);
		d.setdContent("내용없음");
		
		Resign r = new Resign();
		
		r.setDocTempNo(docTempNo);
		r.setEnrollDate(enrollDate);
		
		// 문서 기안하기
		int result1 = aService.insertDocument(d);
		// 사직 정보 입력하기
		int result2 = aService.insertResignInfo(r);
		
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:approvalProgressAllListView.do";
		}else {
			model.addAttribute("msg", "문서 기안 실패!");
			return "common/errorPage";
		}
	}
									  
	// 부서별 전체 문서 리스트
	@RequestMapping("adminAllList.do")
	public ModelAndView adminAllList(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		// 로그인 세션 부서번호 가져오기
		int deptNo = ((Member) session.getAttribute("loginUser")).getDeptNo();
		
		int listCount = aService.getAdminAllListCount(deptNo);
		
		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Document> dList = aService.selectAdminAllList(deptNo, pi);
		
		for(Document d : dList) {
			if(d.getrStatus().equals("Y")) {
				d.setsStatus("반려");
			}else {
				d.setsStatus("결재완료");
			}
		}
		
		mv.addObject("dList",dList);
		mv.addObject("listCount",listCount);
		mv.addObject("pi",pi);
		mv.setViewName("approval/adminAllList");
		
		return mv;
	}
	
	// 부서별 삭제 문서 리스트
	@RequestMapping("adminDeleteList.do")
	public ModelAndView approvalDeleteDList(ModelAndView mv, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		// 로그인 세션 부서번호 가져오기
		int deptNo = ((Member) session.getAttribute("loginUser")).getDeptNo();
		
		int listCount = aService.getAdminDeleteListCount(deptNo);
		
		// 페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Document> dList = aService.selectAdminDeleteList(deptNo, pi);
		
		for(Document d : dList) {
			d.setsStatus("관리자에 의한 삭제");
		}
		
		mv.addObject("dList",dList);
		mv.addObject("listCount",listCount);
		mv.addObject("pi",pi);
		mv.setViewName("approval/adminDeleteList");
		
		return mv;
	}
	
	// 문서 상세보기(문서 관리자일 때)
	@RequestMapping("approvalAdminDetail.do")
	public ModelAndView approvalAdminDetail(ModelAndView mv, HttpServletResponse response, HttpSession session, String docNo) {
		
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
		
		// 관리자 페이지에서 들어온 건지 여부 --> 현재 메소드는 관리자 페이지에서 접근 
		d.setAdmin(true);
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
	
	// 관리자 --> 삭제하기
	@RequestMapping("deleteDocument.do")
	public String deleteDocument(Model model, HttpServletResponse response, String docTempNo) {
		
		int result = aService.deleteDocument(docTempNo);
		
		if(result > 0) {
			return "redirect:adminAllList.do";
		}else {
			model.addAttribute("msg", "문서 삭제 오류!");
			return "common/errorPage";
		}
	}
	
	// 관리자 --> 복원하기
	@RequestMapping("restoreDocument.do")
	public String restoreDocument(Model model, HttpServletResponse response, String docTempNo) {
		
		int result = aService.restoreDocument(docTempNo);
		
		if(result > 0) {
			return "redirect:adminDeleteList.do";
		}else {
			model.addAttribute("msg", "문서 복원 오류!");
			return "common/errorPage";
		}
	}	
	
	// 관리자 --> 완전 삭제하기
	@RequestMapping("omitDocumentInfo.do")
	public String omitDocumentInfo(Model model, HttpServletResponse response, String docTempNo, int formNo) {
		
		int result = 0;
		
		// 업무연락 또는 회람 문서일 경우
		if(formNo == 1 || formNo == 2) {
			aService.omitStep(docTempNo);
			result = aService.omitDocument(docTempNo);
		// 휴가 문서일 경우	
		}else if(formNo == 3) {
			aService.omitStep(docTempNo);
			aService.omitLeaveInfo(docTempNo);
			aService.omitLeaveRecord(docTempNo);
			result = aService.omitDocument(docTempNo);
		// 휴직 문서일 경우
		}else if(formNo == 4) {
			aService.omitStep(docTempNo);
			aService.omitAbsenceInfo(docTempNo);
			result = aService.omitDocument(docTempNo);
		// 사직 문서일 경우
		}else {
			aService.omitStep(docTempNo);
			aService.omitResignInfo(docTempNo);
			result = aService.omitDocument(docTempNo);
		}
		
		if(result > 0) {
			return "redirect:adminDeleteList.do";
		}else {
			model.addAttribute("msg", "문서 완전 삭제 오류!");
			return "common/errorPage";
		}
	}
	
	// 메인 화면 문서 리스트 카운트
	@RequestMapping("approvalBox.do")
	public void approvalBox(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		
		// 로그인 세션 사용자 사번 가져오기
		int memNo = ((Member) session.getAttribute("loginUser")).getMemNo();

		// 로그인 사용자가 기안자이거나 결재라인에 있는 문서리스트 조회(전체 문서)
		ArrayList<Document> dList = aService.selectProgressAllList(memNo);

		ArrayList<Document> standByList = new ArrayList<Document>();
		ArrayList<Document> checkList = new ArrayList<Document>();
		ArrayList<Document> progressList = new ArrayList<Document>();
		DocumentListCount dCount = new DocumentListCount();
		
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
								
								d.setsStatus("미결");
								// 결재사원의 결재선 타입이 참조이거나, 문서 서식종류가 회람문서일경우
							} else if (s.getLineNo() == 2 || d.getFormNo() == 2) {
								d.setsStatus("참조 대기");
								// 아직 결재 순번이 내 차례가 되기 전일때(예정상황)
							} else if (d.getTurnNo() < s.getStepPriority()) {
								d.setsStatus("예결");
								// 나보다 뒷 순번 결재자가 먼저 결재를 하였을때(후결상황)
							} else if (d.getTurnNo() > s.getStepPriority()) {
								d.setsStatus("후결 대기");
							}
						}
					} 
				}
			}
			if(d.getsStatus().equals("미결") || d.getsStatus().equals("후결 대기")) {
				standByList.add(d);
			}else if(d.getsStatus().equals("참조 대기")) {
				checkList.add(d);
			}else if(d.getsStatus().equals("진행")) {
				progressList.add(d);
			}
		}
		
		dCount.setStandByDocCount(standByList.size());
		dCount.setCheckDocCount(checkList.size());
		dCount.setProgressDocCount(progressList.size());
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(dCount,response.getWriter());
	}

}
