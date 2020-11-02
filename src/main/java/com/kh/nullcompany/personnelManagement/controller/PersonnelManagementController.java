package com.kh.nullcompany.personnelManagement.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.member.controller.MemberController;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.service.PersonnelManagementService;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.MixForLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RecodeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RewardLeave;
import com.kh.nullcompany.personnelManagement.model.vo.SetAttendance;
import com.kh.nullcompany.personnelManagement.model.vo.SetLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeUsedLeave;
import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
	
@Controller
public class PersonnelManagementController {
	

	
	// logging	(import-slf4j)
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private PersonnelManagementService pService;
	
	
	// 서브네비 휴가 계산 및 휴가일수 업데이트(json)
	@RequestMapping(value="leaveCalculate.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String leaveCalculate(String enDate, int memNo){
		int rewardLeave = 0;
		
		
		SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
		
		int w1 = Integer.parseInt(enDate.substring(0,4));
		int w2 = Integer.parseInt(enDate.substring(5,7));
		int w3 = Integer.parseInt(enDate.substring(8,10));

		
		LocalDate today = LocalDate.now();
		
		LocalDate hiredDate = LocalDate.of(w1,w2,w3);
		// 입사일로부터 오늘까지의 날짜 차이 계산
		Period period = hiredDate.until(today);
		
		String workyear = "";
		int annualLeave = 0;
		if(period.getYears() > 38) {
			workyear = "N" + 38;
		}else if(period.getYears() == 0){
			SetLeave firstyearLeave = pService.firstyearLeave();
			if(firstyearLeave.getFirstyear() == 0) {
				annualLeave = period.getMonths();
			}else {
				annualLeave = firstyearLeave.getAnnualLeave();
			}
			
		}else {
			workyear = "N"+period.getYears();			
			// 생성된 연차
			annualLeave = pService.leaveCalculate(workyear);
		}
		
		
		
		
		
		
		// 포상휴가 체크 (+)
		
		rewardLeave = pService.rewardLeave(memNo);
		
		
		// 사용한 포상휴가 계산
		int usedRewardLeave = pService.usedRewardLeave(memNo);
		// 사용한 연차 계산
		int usedAnnualLeave = pService.usedAnnualLeave(memNo);
		
		// 총 남은 휴가
		int remainingLeave = annualLeave + rewardLeave - usedRewardLeave -usedAnnualLeave;
		
		// 회원 휴가 업데이트
		Map updatemap = new HashMap();
		updatemap.put("memNo", memNo);
		updatemap.put("annual",(annualLeave - usedAnnualLeave) );
		updatemap.put("reward", (rewardLeave - usedRewardLeave));
		int updateLeave = pService.updateLeave(updatemap);
		
		//근태 지각횟수
		
		int lateCountM = pService.lateCountM(memNo);
		
		int lateCountY = pService.lateCountY(memNo);
		
		
		JSONObject status = new JSONObject();
		status.put("remainingLeave", remainingLeave);
		status.put("lateCountM",lateCountM);
		status.put("lateCountY",lateCountY);
		
		return status.toJSONString();
	}

	// 인사관리 기본화면 ( 조직도)
	@RequestMapping("organization.do")
	public ModelAndView  infoOrganization(ModelAndView mv, String searchText) {
		
		ArrayList<Department> deptList = new ArrayList<>();
		ArrayList<Member> mList = new ArrayList<>();
		
		//모든 부서
		deptList = pService.deptList();
		//모든 직원
		if(searchText == null || searchText == "") {
			mList = pService.deptAllMemberList();
			
		}else {
			mList = pService.searchMemberById(searchText);
		}
		
		mv.addObject("deptList",deptList);
		mv.addObject("mList",mList);
		mv.setViewName("personnel_management/infoOrganization");
		return mv;
	}
	
	// 인사관리 사번으로 회원조회(모달) (Gson)
	@RequestMapping("detailMemberInfo.do")
	public void detailMemberInfo (int memNo, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		Member m = new Member();
		
		m = pService.detailMemberInfo(memNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
		
	}
	
	// 내정보관리
	@RequestMapping("modificationMyInfo.do")
	public String modificationMyInfo(HttpServletResponse response) {
		
		
		
		return "personnel_management/modificationMyInfo";
	}

	// 휴가현황 -내휴가
	@RequestMapping("myLeave.do")
	public ModelAndView myLeave(ModelAndView mv, HttpServletResponse response, HttpSession session) {
		
		SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
		
		String enDate = formatD.format(((Member)session.getAttribute("loginUser")).getEnrollDate());
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		
		
		int w1 = Integer.parseInt(enDate.substring(0,4));
		int w2 = Integer.parseInt(enDate.substring(5,7));
		int w3 = Integer.parseInt(enDate.substring(8,10));
		
		LocalDate today = LocalDate.now();
		LocalDate hiredDate = LocalDate.of(w1, w2, w3);
		// 입사일로부터 오늘까지의 날짜 차이 계산
		Period period = hiredDate.until(today);
		
		String createDate ="";
		String endDate="";
		if(period.getYears() != 0) {
			createDate = w1+period.getYears()+"-"+w2+"-"+w3;
			endDate = w1+(period.getYears()+1)+"-"+w2+"-"+w3;
		}else {
			createDate = enDate;
			endDate = w1+1+"-"+w2+"-"+w3;
		}
		
		String workyear = "";
		int annualLeave = 0;
		if(period.getYears() > 38) {
			workyear = "N" + 38;
		}else if(period.getYears() == 0){
			SetLeave firstyearLeave = pService.firstyearLeave();
			if(firstyearLeave.getFirstyear() == 0) {
				annualLeave = period.getMonths();
			}else {
				annualLeave = firstyearLeave.getAnnualLeave();
			}
			
		}else {
			workyear = "N"+period.getYears();			
			// 생성된 연차
			annualLeave = pService.leaveCalculate(workyear);
		}
		
		
		
		// 포상휴가 수 체크 (+)
		int rewardLeave = pService.rewardLeave(memNo);
		
		// 사용한 포상휴가 계산
		int usedRewardLeave = pService.usedRewardLeave(memNo);
		// 사용한 연차 계산
		int usedAnnualLeave = pService.usedAnnualLeave(memNo);
		
		// 남은 휴가
		int remainingLeave = annualLeave + rewardLeave - usedRewardLeave - usedAnnualLeave;
		// 총 얻은 휴가
		int totalLeave = annualLeave + rewardLeave;
		// 총사용된 휴가
		int totalUsedLeave = usedRewardLeave + usedAnnualLeave;
		
		// 포상휴가 테이블 전체조회(사번)
		ArrayList<RewardLeave> createdReward = pService.createdReward(memNo);
		// 휴가 신청 기록테이블 전체조회(사번)
		ArrayList<RecodeLeave> applyLeave = pService.applyLeave(memNo);
		// 휴가 종류 리스트
		ArrayList<TypeLeave> typeLeave = pService.typeLeave();
		
		//휴가 신청 기록테이블(휴가 타입믹스)
		ArrayList<MixForLeave> mixLeave = pService.mixLeave(memNo); 
		
		// 휴가별 사용횟수
		ArrayList<TypeUsedLeave> TUL = pService.tul(memNo);
		
		mv.addObject("createdReward",createdReward);
		mv.addObject("applyLeave",applyLeave);
		mv.addObject("typeLeave",typeLeave);
		mv.addObject("mixLeave",mixLeave);
		mv.addObject("typeUsedLeave",TUL);
		
		mv.addObject("annualLeave",annualLeave);
		mv.addObject("rewardLeave",rewardLeave);
		mv.addObject("totalUsedLeave",totalUsedLeave);
		mv.addObject("remainingLeave",remainingLeave);
		mv.addObject("totalLeave",totalLeave);
		mv.addObject("usedRewardLeave",usedRewardLeave);
		mv.addObject("usedAnnualLeave",usedAnnualLeave);
		
		mv.addObject("createDate",createDate);
		mv.addObject("endDate",endDate);
		mv.setViewName("personnel_management/myLeave");
		return mv;
	}
	
	// 휴가현황 -내휴가 -모달
	@RequestMapping("detailRecodeLeave.do")
	public void detailRecodeLeave(HttpServletResponse response, int noRecode) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		MixForLeave mixL = pService.detailRecodeLeave(noRecode);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mixL,response.getWriter());
		
	}
	
	// 휴가현황- 휴가캘린더
	@RequestMapping("leaveCalendar.do")
	public String leaveCalendar(HttpServletResponse response) {
		return "personnel_management/leaveCalendar";
	}

	// 근태현황
	@RequestMapping("myDiligence.do")
	public ModelAndView myDiligence(ModelAndView mv, HttpServletResponse response) {
		// 근무시간 설정값 가져오기
		ArrayList<SetAttendance> setAttendance = pService.setAttendance();
		
		// 지각횟수/ 월평균 지각횟수 계산
	
		// 출퇴근 기록 미체크-(출근기록이없는날) , 퇴근체크(비정상)-(출근은했지만 퇴근기록이없는상황)
		
		// 전체 근태기록
		
		// 전체 휴가 사용날 / 사용일수 기록
		
		
		
		mv.addObject("setAttendance",setAttendance);
		mv.setViewName("personnel_management/myDiligence");
		return mv;
	}

	// 휴가 관리-기본설정
	@RequestMapping("setLeaveStandard.do")
	public String setLeaveStandard(HttpServletResponse response) {
		return "personnel_management/setLeaveStandard";
	}

	// 휴가 관리 -직원 휴가 관리
	@RequestMapping("emLeaveManagement.do")
	public String emLeaveManagement(HttpServletResponse response) {
		return "personnel_management/emLeaveManagement";
	}

	//근태관리 - 기본설정
	@RequestMapping("setDiligenceStandard.do")
	public String setDiligenceStandard(HttpServletResponse response) {
		return "personnel_management/setDiligenceStandard";
	}

	//근태관리 -휴직자관리
	@RequestMapping("emAbsenceManagement.do")
	public String emAbsenceManagement(HttpServletResponse response) {
		return "personnel_management/emAbsenceManagement";
	}

	//근태관리 - 직원근태관리
	@RequestMapping("emDiligenceManagement.do")
	public String emDiligenceManagement(HttpServletResponse response) {
		return "personnel_management/emDiligenceManagement";
	}

	// 근태 수정요청 페이지

	@RequestMapping("reqDiligence.do")
	public String reqDiligence(HttpServletResponse response) {
		return "personnel_management/reqDiligence";
	}


	

}
