package com.kh.nullcompany.personnelManagement.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.service.PersonnelManagementService;
import com.kh.nullcompany.personnelManagement.model.vo.Absence;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.personnelManagement.model.vo.DiligenceCountAllMember;
import com.kh.nullcompany.personnelManagement.model.vo.ForEmLeave;
import com.kh.nullcompany.personnelManagement.model.vo.ForEmUsedLeave;
import com.kh.nullcompany.personnelManagement.model.vo.MixForLeave;
import com.kh.nullcompany.personnelManagement.model.vo.ModificationDiligence;
import com.kh.nullcompany.personnelManagement.model.vo.RecordDiligence;
import com.kh.nullcompany.personnelManagement.model.vo.RecordLeave;
import com.kh.nullcompany.personnelManagement.model.vo.RewardLeave;
import com.kh.nullcompany.personnelManagement.model.vo.SelectedMemberDiligenceCount;
import com.kh.nullcompany.personnelManagement.model.vo.SetAttendance;
import com.kh.nullcompany.personnelManagement.model.vo.SetLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeLeave;
import com.kh.nullcompany.personnelManagement.model.vo.TypeUsedLeave;
	
@Controller
public class PersonnelManagementController {
	
	
	@Autowired
	private PersonnelManagementService pService;
	
	// 서브네비 휴가 계산 및 휴가일수 업데이트(json)
	@RequestMapping(value="leaveCalculate.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String leaveCalculate(String enDate, int memNo){
		int rewardLeave = 0;
		
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
			annualLeave = pService.leaveCalculate(workyear);
		}else if(period.getYears() == 0){
			SetLeave firstyearLeave = pService.firstyearLeave();
			if(firstyearLeave.getFirstyear() == 0) {
				annualLeave = period.getMonths();
			}else {
				annualLeave = firstyearLeave.getAnnualLeave();
			}
			
		}else {
			workyear = "N"+(period.getYears()+1);			
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
			annualLeave = pService.leaveCalculate(workyear);
		}else if(period.getYears() == 0){
			SetLeave firstyearLeave = pService.firstyearLeave();
			if(firstyearLeave.getFirstyear() == 0) {
				annualLeave = period.getMonths();
			}else {
				annualLeave = firstyearLeave.getAnnualLeave();
			}
			
		}else {
			workyear = "N"+(period.getYears()+1);			
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
		ArrayList<RecordLeave> applyLeave = pService.applyLeave(memNo);
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
	@RequestMapping("detailRecordLeave.do")
	public void detailRecordLeave(HttpServletResponse response, int noRecord) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		MixForLeave mixL = pService.detailRecordLeave(noRecord);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mixL,response.getWriter());
		
	}
	
	// 휴가현황- 휴가캘린더
	@RequestMapping("leaveCalendar.do")
	public ModelAndView leaveCalendar(ModelAndView mv,  HttpServletResponse response, HttpSession session) {
			
		// 총 휴가 리스트
		ArrayList<RecordLeave> RecordLeaveList = pService.RecordLeaveList();
		mv.addObject("RecordLeaveList", RecordLeaveList);
		mv.setViewName("personnel_management/leaveCalendar");

		return mv;
	
	}

	// 근태현황
	@RequestMapping("myDiligence.do")
	public ModelAndView myDiligence(ModelAndView mv, HttpServletResponse response, HttpSession session) {
		SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		// 올해 몇월인지(월평 지각수 계산용)
		Date today = new Date();
		int TMonth = today.getMonth()+1;
		
		// 근무시간 설정값 가져오기
		SetAttendance setAttendance = pService.setAttendance();
		// 지각횟수/ 월평균 지각횟수 계산
		int lateCount = pService.lateCountY(memNo);
		double avgLateCount = (Math.round(((double)lateCount / (double)TMonth)*100)/100.0);

		
		// 출퇴근 기록 미체크-(출근기록이없는날-결근) , 퇴근체크(비정상)-(출근은했지만 퇴근기록이없는상황)
		int noAttendanceCount = pService.noAttendanceCount(memNo);
		int noCheckOffwork = pService.noCheckOffwork(memNo);
		
		// 전체 근태기록 (for Calendar)
		ArrayList<RecordDiligence> recordDiligenceList = pService.recordDiligenceList(memNo);
		
		
		
		// 전체 휴가 사용날 / 사용일수 기록(for Calendar)
		
		// 근태 수정내역 보기 
		ArrayList<ModificationDiligence> recordMod = pService.selectRecordModification(memNo);
		
		mv.addObject("recordDiligenceList",recordDiligenceList);
		mv.addObject("recordMod",recordMod);
		mv.addObject("noAttendanceCount",noAttendanceCount);
		mv.addObject("noCheckOffwork",noCheckOffwork);
		mv.addObject("lateCount",lateCount);
		mv.addObject("avgLateCount",avgLateCount);
		mv.addObject("setAttendance",setAttendance);
		mv.setViewName("personnel_management/myDiligence");
		return mv;
	}
	
	//근태 현황 조회 년,월 (모달)-gson
	@RequestMapping("searchDiligenceYM.do")
	public void searchDiligenceYM(HttpSession session, HttpServletResponse response, int year,int month, int memNo,
			@RequestParam(value="currentPage", required=false,defaultValue="1") int currentPage) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		Map forsearchYM = new HashMap();
		forsearchYM.put("year",year);
		forsearchYM.put("month",month);
		forsearchYM.put("memNo",memNo);
		
		
		int dListCount = pService.dListCount(forsearchYM);
		PageInfo pi = Pagination.getPageInfoForModal(currentPage, dListCount);
		ArrayList<RecordDiligence> dList = pService.searchDiligenceYM(forsearchYM,pi);
		
		
		Map list = new HashMap();
		list.put("dList",dList);
		list.put("pi",pi);
		list.put("dListCount",dListCount);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	
	// 출퇴근 기록-gson
	@RequestMapping("recordTA.do")
	public void RecordTimeAndAttendance(HttpSession session,int or, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		SetAttendance setAttendance = pService.setAttendance(); // 근무시간 설정값
		
		String str = "";
		Date today = new Date(); // 현재 시간 계산용
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		String currentTime = sdf.format(today); // 현재시간
		
		int setATime = Integer.parseInt(setAttendance.getTimeAttendance().replaceAll(":",""));
		int setOTime = Integer.parseInt(setAttendance.getTimeOffWork().replaceAll(":", ""));
		int setCTime = Integer.parseInt(currentTime.replaceAll(":", ""));
		Map	forR = new HashMap(); // 기록 상태값용
		forR.put("memNo",memNo);
		// 출퇴근 해당날자인지 체크
		ArrayList<SetAttendance> ADay = pService.AttendanceDays();
		Calendar todayCalen = Calendar.getInstance();
		int todayDate = todayCalen.get(Calendar.DAY_OF_WEEK)-1;
		int checkADay = 0;
		for(SetAttendance i : ADay) {
			if(i.getDayAvailable().equals("Y")) {
				if(todayDate == i.getNoDay()) {
					checkADay=1;
					break;
				}
			}
		}
		// 출근 & 퇴근 기록 및 알림
		if(checkADay ==1) {
			if(or ==1) {
				int RecordAB_A = pService.RecordAB_A(memNo);
				if(RecordAB_A == 0) {
					if(setCTime < 1400) {
						if(setCTime > setATime) {
							forR.put("statusD","지각");
						}else {
							forR.put("statusD","정상");
						}
						int insertRA= pService.insertRA(forR);
						str = "출근시간 : "+currentTime+" "+((Member)session.getAttribute("loginUser")).getName()+"님 오늘도 열씸히 근무해주세요. ";					
					}else {
						str="결근입니다.";
					}
				}else if(RecordAB_A==1) {
					str = "이미 출근되어 있습니다.";
				}else {
					str = "뭔가잘못된듯..";
				}
			}else if(or==2) {
				if(setCTime > setOTime) {
					int RecordAB_O = pService.RecordAB_O(memNo);
					if(RecordAB_O == 1) {
						int insertRO = pService.insertRO(forR);
						if(insertRO == 1) {
							str=((Member)session.getAttribute("loginUser")).getName()+"님 오늘하루 고생하셨습니다. ";	
						}else {
							str="오류 발생 인사담당자에게 연락주세요";
						}
					}else if(RecordAB_O == 0) {
						str ="출근을 하지않으셨거나, 결근처리 또는 이미퇴근이 완료되었습니다.";
					}
				}else {
					str="퇴근시간이 되지 않았습니다.";
				}
			}
			
		}else {
			str="출근일이 아닙니다.";
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(str,response.getWriter());
		
	}
	// 출퇴근 당일 기록(헤더용)
	@RequestMapping("recordToday.do")
	public void RecordToday(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		RecordDiligence RecordToday = pService.RecordToday(memNo);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(RecordToday,response.getWriter());
	}

	// 휴가 관리-기본설정
	@RequestMapping("setLeaveStandard.do")
	public ModelAndView setLeaveStandard(ModelAndView mv) {
		
		ArrayList<SetLeave> setLeave = pService.setLeaveStandard();
		
		ArrayList<TypeLeave> leaveList = pService.typeLeave();
		mv.addObject("leaveList",leaveList);
		mv.addObject("setLeave",setLeave);
		mv.setViewName("personnel_management/setLeaveStandard");
		return mv;
	}
	// 휴가 관리 설정저장용
	@ResponseBody
	@RequestMapping(value="fixSetLeave.do")
	public void fixSetLeave(
							String firstyear, String setAnnualLeave,  String newLeaveArr , HttpServletResponse response,
							String leaveTypeSet
							) throws JsonIOException, IOException{
		String str = "311aa";
		
		Date today = new Date();
		ArrayList<SetLeave> setLeave = new ArrayList<SetLeave>();
		ArrayList<TypeLeave> newLeave = new ArrayList<TypeLeave>();
		ArrayList<TypeLeave> LeaveTypeSetting = new ArrayList<TypeLeave>();

		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray)jsonParser.parse(setAnnualLeave);
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
		      
		    String year = (object.get("year")).getAsString();
		    int days = (object.get("days")).getAsInt();
		    SetLeave setArr = new SetLeave(year, days,0,Integer.parseInt(firstyear),today);
		    setLeave.add(setArr);
		}
		
		
		if(!newLeaveArr.isEmpty() ) {
			jsonArray = (JsonArray)jsonParser.parse(newLeaveArr);
			for(int j=0; j<jsonArray.size(); j++) {
				JsonObject object = (JsonObject) jsonArray.get(j);
				   
				String nameType = (object.get("name")).getAsString();
				String annualUse = (object.get("useAnnual")).getAsString();
				String status = (object.get("able")).getAsString();
				
				if(annualUse.equals("false")) {
					annualUse = "N";
				}else {
					annualUse = "Y";
				}
				
				if(status.equals("able")) {
					status = "Y";
				}else {
					status = "N";
				}
				TypeLeave newArr = new TypeLeave(0, nameType, annualUse, status);
				
				newLeave.add(newArr);
			}
			
			
			
		}
		jsonArray = (JsonArray)jsonParser.parse(leaveTypeSet);
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject object = (JsonObject) jsonArray.get(i);
		      
		    int no = (object.get("no")).getAsInt();
		    String useAnnual = (object.get("useAnnual")).getAsString();
		    if(useAnnual.equals("false")) {
		    	useAnnual = "N";
		    }else {
		    	useAnnual ="Y";
		    }
		    String able = (object.get("able")).getAsString();
		    if( able.equals("able")) {
		    	able = "Y";
		    }else {
		    	able = "N";
		    }
		    TypeLeave setL = new TypeLeave(no, null, useAnnual, able);
		    LeaveTypeSetting.add(setL);
		}
		
	       
	       
	       
	       int updateLeaveSetting = pService.updateLeaveSetting(setLeave);
	       
	       if(!newLeave.isEmpty()) {
	    	   int insertLeaveType = pService.insertLeaveType(newLeave);	    	   
	       }
	       
	       int updateLeaveTypeSetting = pService.updateLeaveType(LeaveTypeSetting);

//		
//		int result = pService.fixSetLeave(newLeaveArr,setAnnualLeave,firstyear);
		// javascript에서 배열형태의 객체를 json형태로 controller로 전달
		// controller에서는 json문자열을 다시 자바객체(ex 배열) 형태로 다시 바꿔서 값을처리행한다.
		
	   Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	   gson.toJson(str,response.getWriter());
		   
	}
	
	// 휴가 관리 -직원 휴가 관리
	@RequestMapping("emLeaveManagement.do")
	public ModelAndView emLeaveManagement(ModelAndView mv, HttpServletResponse response, 
									String changeMemNo,String changeAnnual, String changeReward, String reasonAnnual, String reasonReward) {
		if(changeMemNo != null) {
			Member changeMember = pService.detailMemberInfo(Integer.parseInt(changeMemNo));
			Map changeAL = new HashMap();
			Map changeRL = new HashMap();
			changeAL.put("memNo",changeMember.getMemNo());
			changeRL.put("memNo",changeMember.getMemNo());
			if(changeMember.getAnnualLeave() != Integer.parseInt(changeAnnual)&& changeMember.getRewardLeave() != Integer.parseInt(changeReward)) {
				// 포상 , 연차 둘다 변경
				int reductionDaysAnnual = (changeMember.getAnnualLeave() - Integer.parseInt(changeAnnual));
				changeAL.put("reductionDaysAnnual",reductionDaysAnnual);
				changeAL.put("reasonAnnual",reasonAnnual);
				
				int reduceAnnualLeave = pService.reduceAnnualLeave(changeAL);
				
				int reductionDaysReward = (changeMember.getRewardLeave() - Integer.parseInt(changeReward));
				changeRL.put("reductionDaysReward",reductionDaysReward);
				changeRL.put("reasonReward",reasonReward);
				
				int reduceRewardLeave = pService.reduceRewardLeave(changeRL);
				
			}else if(changeMember.getAnnualLeave() != Integer.parseInt(changeAnnual)) {
				// 연차만 변경
				int reductionDaysAnnual = (changeMember.getAnnualLeave() - Integer.parseInt(changeAnnual));
				changeAL.put("reductionDaysAnnual",reductionDaysAnnual);
				changeAL.put("reasonAnnual",reasonAnnual);
				
				int reduceAnnualLeave = pService.reduceAnnualLeave(changeAL);
				
			}else {
				// 포상만 변경
				int reductionDaysReward = (changeMember.getRewardLeave() - Integer.parseInt(changeReward));
				changeRL.put("reductionDaysReward",reductionDaysReward);
				changeRL.put("reasonReward",reasonReward);
				
				int reduceRewardLeave = pService.reduceRewardLeave(changeRL);
			}
			
		}
		SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
		
		
		ArrayList<ForEmLeave> emList = pService.emAllMemeber();
		
		ArrayList<TypeLeave> leaveList = pService.typeLeave();
		

		
		String workyear = "";
		int annualLeave = 0;
		
		
		ForEmLeave fel2 = new ForEmLeave();
		
		for(ForEmLeave fel : emList) {
			fel2 = fel;
			workyear = fel2.getWorkyear();
			String enDate = formatD.format(fel2.getEnrollDate());
			if(workyear.equals("N1")) {
				SetLeave firstyearLeave = pService.firstyearLeave();
				if(firstyearLeave.getFirstyear() == 0) {
					
					int w1 = Integer.parseInt(enDate.substring(0,4));
					int w2 = Integer.parseInt(enDate.substring(5,7));
					int w3 = Integer.parseInt(enDate.substring(8,10));

					
					LocalDate today = LocalDate.now();
					
					LocalDate hiredDate = LocalDate.of(w1,w2,w3);
					// 입사일로부터 오늘까지의 날짜 차이 계산
					Period period = hiredDate.until(today);
					annualLeave = period.getMonths();
					fel2.setAnnualLeave(annualLeave);
				}else {
					annualLeave = firstyearLeave.getAnnualLeave();
					fel2.setAnnualLeave(annualLeave);
				}
			}else {
				annualLeave = pService.leaveCalculate(workyear);
				fel2.setAnnualLeave(annualLeave);
			}
			
		}
		
		mv.addObject("leaveList",leaveList);
		mv.addObject("emList",emList);
		mv.setViewName("personnel_management/emLeaveManagement");
		return mv;
	}
	
	// 직원휴가관리 수정 모달
	@RequestMapping("modalModifyLeave.do")
	public void modalModifyLeave(HttpServletResponse response, int memNo) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
		
		Member m = pService.detailMemberInfo(memNo);
		
		String enDate = formatD.format(m.getEnrollDate());
		
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
		
		int remainAnnual = m.getAnnualLeave();
		int remainReward = m.getRewardLeave();
		
		Map member = new HashMap();
		member.put("m",m);
		member.put("createDate",createDate);
		member.put("endDate",endDate);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		   gson.toJson(member,response.getWriter());
	}
	
	// 직원 휴가관리 사용된 휴가 계산
	@RequestMapping("AllMemberUsedLeave.do")
	public void allMemberUsedLeave(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<ForEmUsedLeave> usedLeave = pService.usedLeave();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(usedLeave,response.getWriter());
		
	}
	
	// 직원 휴가관리 상세보기
	@RequestMapping("selectedMemberDetailLeave.do")
	public void selectedMemberDetailLeave(int memNo,HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
		Member m = pService.detailMemberInfo(memNo);
		String enDate = formatD.format(m.getEnrollDate());
			
		
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
			annualLeave = pService.leaveCalculate(workyear);
		}else if(period.getYears() == 0){
			SetLeave firstyearLeave = pService.firstyearLeave();
			if(firstyearLeave.getFirstyear() == 0) {
				annualLeave = period.getMonths();
			}else {
				annualLeave = firstyearLeave.getAnnualLeave();
			}
			
		}else {
			workyear = "N"+(period.getYears()+1);			
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
		ArrayList<RecordLeave> applyLeave = pService.applyLeave(memNo);
		// 휴가 종류 리스트
		ArrayList<TypeLeave> typeLeave = pService.typeLeave();
		
		//휴가 신청 기록테이블(휴가 타입믹스)
		ArrayList<MixForLeave> mixLeave = pService.mixLeave(memNo); 
		
		// 휴가별 사용횟수
		ArrayList<TypeUsedLeave> TUL = pService.tul(memNo);
		
		Map detail = new HashMap();
		detail.put("createdReward",createdReward);
		detail.put("applyLeave",applyLeave);
		detail.put("typeLeave",typeLeave);
		detail.put("mixLeave",mixLeave);
		detail.put("typeUsedLeave",TUL);
		
		detail.put("annualLeave",annualLeave);
		detail.put("rewardLeave",rewardLeave);
		detail.put("totalUsedLeave",totalUsedLeave);
		detail.put("remainingLeave",remainingLeave);
		detail.put("totalLeave",totalLeave);
		detail.put("usedRewardLeave",usedRewardLeave);
		detail.put("usedAnnualLeave",usedAnnualLeave);
		
		detail.put("createDate",createDate);
		detail.put("endDate",endDate);
		detail.put("m",m);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(detail,response.getWriter());
	}

	//근태관리 - 기본설정
	@RequestMapping("setDiligenceStandard.do")
	public ModelAndView setDiligenceStandard(ModelAndView mv, HttpServletResponse response, String sDate, String eDate, String setDate) {
		
		if(setDate != null) {
			String date ="";
			String[] setDateArr = setDate.split(",");
			Map setA = new HashMap();
			for(int i =0; i<7; i++) {
				switch(i){
				case 0: date = "SUN"; break;
				case 1: date = "MON"; break;
				case 2: date = "TUE"; break;
				case 3: date = "WED"; break;
				case 4: date = "THU"; break;
				case 5: date = "FRI"; break;
				case 6: date = "SAT"; break;
				
				}
				setA.put("date", date);			
				setA.put("dateStatus", setDateArr[i]);
				setA.put("sDate",sDate);
				setA.put("eDate",eDate);
				int result = pService.updateAttendance(setA);
				setA.clear();
				
			}
			
		}
		ArrayList<SetAttendance> settingArr = pService.setDiligenceStandard();
		
		
		mv.addObject("settingArr",settingArr);
		mv.setViewName("personnel_management/setDiligenceStandard");
		return mv;
	}

	//근태관리 -휴직자관리
	@RequestMapping("emAbsenceManagement.do")
	public ModelAndView emAbsenceManagement(ModelAndView mv ,HttpServletResponse response) {
				
		ArrayList<Absence> absenceList = pService.absenceList();
		mv.addObject("absenceList",absenceList);
		mv.setViewName("personnel_management/emAbsenceManagement");
		return mv;
	}
	//근태관리 - 이전휴직자(모달)페이징
	@RequestMapping("previousAbsence.do")
	public void previousAbsence(HttpSession session, HttpServletResponse response,
			@RequestParam(value="currentPage", required=false,defaultValue="1") int currentPage) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		
		
		int previousAbsenceCount = pService.previousAbsenceCount();
		PageInfo pi = Pagination.getPageInfoForModal(currentPage, previousAbsenceCount);
		ArrayList<Absence> previousAbsence = pService.previousAbsence(pi);
		
		System.out.println(previousAbsence);
		Map list = new HashMap();
		list.put("previousAbsence",previousAbsence);
		list.put("pi",pi);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
	}
	// 근태관리 -휴직자 복직
	@RequestMapping("returnToWork.do")
	public String returnToWork(HttpServletResponse response, int noAbsence) {
		
		int result = pService.returnToWork(noAbsence);
		return "redirect:emAbsenceManagement.do";
	}
	
	// 근태 수정요청 페이지

	@RequestMapping("reqDiligence.do")
	public ModelAndView reqDiligence(ModelAndView mv, HttpServletResponse response, int noDiligence) {
		RecordDiligence record = pService.recordDiligence(noDiligence);
		mv.addObject("record",record);
		mv.setViewName("personnel_management/reqDiligence");
		return mv;
	}
	// 근태 수정요청
	@RequestMapping("modificationDiligence.do")
	public String modificationDiligence(ModificationDiligence mod , HttpServletRequest request,
			@RequestParam(name="uploadFile", required=false)MultipartFile file) throws ParseException {
		
		
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드를 진행
			// 파일을 저장하는 메소드 생성 (saveFile)
			// saveFile : 저장하고자 하는 file과 request를 전달해서 서버에 업로드시키고 저장된 파일을 반환해주는 메소드
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {	//파일이 잘저장된 경우
				mod.setOriginalAttachmentMod(file.getOriginalFilename());
				mod.setRenameAttachmentMod(renameFileName);
			}
		}
		
		int result = pService.modificationDiligence(mod);
		return "redirect:myDiligence.do";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 지정
		
		// 웹 서버 ContextPath를 불러와서 폴더의 경로를 가져온다.(webapp하위의 resources)
		// C:\Users\dbstn\Documents\H\springWorkspace\SpringProject
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// root 하위의 buploadFiles 폴더를 연결
		// \를 문자로 인식하기 위해서는 \\를 사용한다.
		// C:\Users\dbstn\Documents\H\springWorkspace\SpringProject\buploadFiles
		String savePath = root + "\\modificationDiligenceUploadFiles";
		
		File folder = new File(savePath); //savePath의 폴더를 불러온다.
		
		if(!folder.exists()) {
			//폴더가 없으면 만들자.
			folder.mkdirs();
		}
		
		// 원본 파일명을 년월일시분초.파일명으로 변경
		String originalFileName = file.getOriginalFilename();  // test.png
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
//								[		20200929191522.											]
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
									//	20200929191522.png
									+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;	//실제 저장될 파일 경로 + 파일명
		
		// 파일저장
		try {
			file.transferTo(new File(renamePath));	//전달받은 file이 rename명으로 이때 서버에 저장이된다.
		}catch(Exception e) {
		}
		return renameFileName;
	}
	
	// 근태 수정 취소
	@RequestMapping("cancelMod.do")
	public void cancelMod (int noMod,HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		int result = pService.cancelMod(noMod);
		String str ="";
		if(result >0) {
			str = "수정취소 완료.";
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(str,response.getWriter());
	}
	
	// 포상휴가 부여1
	@RequestMapping("selectTargetReward.do")
	public void selectTargetReward(HttpServletResponse response, String eDate, String sDate, String inputword) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		Map searchCondition = new HashMap();
		
		searchCondition.put("sDate",sDate);
		searchCondition.put("eDate",eDate);
		searchCondition.put("inputword",inputword);
		
		ArrayList<Member> mList = pService.selectTargetReward(searchCondition);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mList,response.getWriter());
	}
	// 포상휴가 부여2
	@ResponseBody
	@RequestMapping(value="grantReward.do")
	public void grantReward(HttpServletResponse response, String listArr) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray)jsonParser.parse(listArr);
		ArrayList<Member> selectedList = new ArrayList<Member>();
		
		for(int i =0; i<jsonArray.size(); i++) {
			int object = jsonArray.get(i).getAsInt();
			selectedList.add(pService.detailMemberInfo(object));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(selectedList,response.getWriter());
		
	}
	// 포상휴가 부여3
	@RequestMapping(value="grantReward1.do")
	public String grantReward1(HttpServletResponse response, String cMemNoArr, String cDaysArr) {
		response.setContentType("application/json; charset=utf-8");
		
		
		String[] cMem = (cMemNoArr.split(","));
		String[] cDay = cDaysArr.split(",");
		
		int [] fda = Arrays.stream(cMem).mapToInt(Integer::parseInt).toArray();
      	int [] fds = Arrays.stream(cDay).mapToInt(Integer::parseInt).toArray();
		
      	Map CR = new HashMap();
		for(int i=0; i<fda.length; i++) {
			CR.put("memNo", fda[i]);
			CR.put("days", fds[i]);
			
			int insert = pService.grantReward(CR);
			CR.clear();
		}
		
		return "redirect:emLeaveManagement.do";
		
	}
	
	//근태관리 - 직원근태관리
		@RequestMapping("emDiligenceManagement.do")
		public ModelAndView emDiligenceManagement(ModelAndView mv, HttpServletResponse response) {
			SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
			// 올해 몇월인지(월평 지각수 계산용)
			Date today = new Date();
			int TMonth = today.getMonth()+1;
			
			// 근무시간 설정값 가져오기
			SetAttendance setAttendance = pService.setAttendance();

			
			// 전체직원 근태 카운트
			
			DiligenceCountAllMember DiligenceCount = pService.DiligenceCountAllMember();
			
			
			// 모든 사원 정보 가져오기
			ArrayList<Member> mList = pService.selectAllMember();
			ArrayList<RecordDiligence> rD = new ArrayList<RecordDiligence>();
			ArrayList<SelectedMemberDiligenceCount> mC = new ArrayList<SelectedMemberDiligenceCount>();
			if(mList != null) {
				for(int i= 0; i<mList.size(); i++) {
					int memNo = mList.get(i).getMemNo();
					rD.addAll(pService.recordDiligenceList(memNo));
					SelectedMemberDiligenceCount smdc = pService.SelectedMemberDiligenceCount(memNo);
					mC.add(smdc);
				}
				
			}
			
			mv.addObject("memberDiligenceCount",mC);
			mv.addObject("diligenceCount",DiligenceCount);
			mv.addObject("setAttendance",setAttendance);
			mv.addObject("mList",mList);
			mv.addObject("recordDiligenceList",rD);
			mv.setViewName("personnel_management/emDiligenceManagement");
			return mv;
			
		}
		
		//근태 수정요청 관리
		@RequestMapping("attendanceModificationRequests.do")
		public ModelAndView modificationRequest(ModelAndView mv, HttpServletResponse response) {
			ArrayList<ModificationDiligence> modRequestList = pService.modRequestList();
			mv.addObject("modRequestList",modRequestList);
			mv.setViewName("personnel_management/attendanceModificationRequests");
			return mv;
		}
		// 근태수정요청 승인
		@RequestMapping("modificationAcknowledgment.do")
		public String modificationAcknowledgment(int noMod) {
			int reulst = pService.modificationAcknowledgment(noMod);
			
			return "redirect:attendanceModificationRequests.do";
		}
		// 근태수정요청 반려
		@RequestMapping("modificationCancel.do")
		public String modificationCancel(int noMod) {
			int reulst = pService.modificationCancel(noMod);
			
			return "redirect:attendanceModificationRequests.do";
		}
		
		// 직원 근태 현황 검색 출력
		@RequestMapping("searchEmDiligence.do")
		public ModelAndView searchEmDiligence(ModelAndView mv,
											  @RequestParam(name="searchKey", required=false) String searchKey) {
			SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
			// 올해 몇월인지(월평 지각수 계산용)
			Date today = new Date();
			int TMonth = today.getMonth()+1;
			
			// 근무시간 설정값 가져오기
			SetAttendance setAttendance = pService.setAttendance();

			
			// 전체직원 근태 카운트
			
			DiligenceCountAllMember DiligenceCount = pService.DiligenceCountAllMember();
			
			
			// 모든 사원 정보 가져오기
			ArrayList<Member> mList = pService.searchMemberND(searchKey);
			ArrayList<RecordDiligence> rD = new ArrayList<RecordDiligence>();
			ArrayList<SelectedMemberDiligenceCount> mC = new ArrayList<SelectedMemberDiligenceCount>();
			if(mList != null) {
				for(int i= 0; i<mList.size(); i++) {
					int memNo = mList.get(i).getMemNo();
					rD.addAll(pService.recordDiligenceList(memNo));
					SelectedMemberDiligenceCount smdc = pService.SelectedMemberDiligenceCount(memNo);
					mC.add(smdc);
				}
				
			}
			mv.addObject("memberDiligenceCount",mC);
			mv.addObject("diligenceCount",DiligenceCount);
			mv.addObject("setAttendance",setAttendance);
			mv.addObject("mList",mList);
			mv.addObject("recordDiligenceList",rD);
			mv.setViewName("personnel_management/emDiligenceManagement");
			
			
			return mv;
		}
		
		// 직원 근태보기 검색
		@RequestMapping("searchEmLeave.do")
		public ModelAndView searchEmLeave(ModelAndView mv,HttpServletResponse response, 
				String changeMemNo,String changeAnnual, String changeReward, String reasonAnnual, String reasonReward,
				@RequestParam(value="searchKey", required=false) String searchKey) {
			if(changeMemNo != null) {
				Member changeMember = pService.detailMemberInfo(Integer.parseInt(changeMemNo));
				Map changeAL = new HashMap();
				Map changeRL = new HashMap();
				changeAL.put("memNo",changeMember.getMemNo());
				changeRL.put("memNo",changeMember.getMemNo());
				if(changeMember.getAnnualLeave() != Integer.parseInt(changeAnnual)&& changeMember.getRewardLeave() != Integer.parseInt(changeReward)) {
					// 포상 , 연차 둘다 변경
					int reductionDaysAnnual = (changeMember.getAnnualLeave() - Integer.parseInt(changeAnnual));
					changeAL.put("reductionDaysAnnual",reductionDaysAnnual);
					changeAL.put("reasonAnnual",reasonAnnual);
					
					int reduceAnnualLeave = pService.reduceAnnualLeave(changeAL);
					
					int reductionDaysReward = (changeMember.getRewardLeave() - Integer.parseInt(changeReward));
					changeRL.put("reductionDaysReward",reductionDaysReward);
					changeRL.put("reasonReward",reasonReward);
					
					int reduceRewardLeave = pService.reduceRewardLeave(changeRL);
					
				}else if(changeMember.getAnnualLeave() != Integer.parseInt(changeAnnual)) {
					// 연차만 변경
					int reductionDaysAnnual = (changeMember.getAnnualLeave() - Integer.parseInt(changeAnnual));
					changeAL.put("reductionDaysAnnual",reductionDaysAnnual);
					changeAL.put("reasonAnnual",reasonAnnual);
					
					int reduceAnnualLeave = pService.reduceAnnualLeave(changeAL);
					
				}else {
					// 포상만 변경
					int reductionDaysReward = (changeMember.getRewardLeave() - Integer.parseInt(changeReward));
					changeRL.put("reductionDaysReward",reductionDaysReward);
					changeRL.put("reasonReward",reasonReward);
					
					int reduceRewardLeave = pService.reduceRewardLeave(changeRL);
				}
				
			}
			SimpleDateFormat formatD = new SimpleDateFormat("yyyy-MM-dd");
			
			
			ArrayList<ForEmLeave> emList = pService.searchMemberForEmLeaveND(searchKey);
			ArrayList<TypeLeave> leaveList = pService.typeLeave();
			

			
			String workyear = "";
			int annualLeave = 0;
			
			
			ForEmLeave fel2 = new ForEmLeave();
			
			for(ForEmLeave fel : emList) {
				fel2 = fel;
				workyear = fel2.getWorkyear();
				String enDate = formatD.format(fel2.getEnrollDate());
				if(workyear.equals("N1")) {
					SetLeave firstyearLeave = pService.firstyearLeave();
					if(firstyearLeave.getFirstyear() == 0) {
						
						int w1 = Integer.parseInt(enDate.substring(0,4));
						int w2 = Integer.parseInt(enDate.substring(5,7));
						int w3 = Integer.parseInt(enDate.substring(8,10));

						
						LocalDate today = LocalDate.now();
						
						LocalDate hiredDate = LocalDate.of(w1,w2,w3);
						// 입사일로부터 오늘까지의 날짜 차이 계산
						Period period = hiredDate.until(today);
						annualLeave = period.getMonths();
						fel2.setAnnualLeave(annualLeave);
					}else {
						annualLeave = firstyearLeave.getAnnualLeave();
						fel2.setAnnualLeave(annualLeave);
					}
				}else {
					annualLeave = pService.leaveCalculate(workyear);
					fel2.setAnnualLeave(annualLeave);
				}
				
			}
			
			mv.addObject("leaveList",leaveList);
			mv.addObject("emList",emList);
			mv.setViewName("personnel_management/emLeaveManagement");
			
			return mv;
		}
		
		//근태관리 - 근태수정 (모달)페이징
		@RequestMapping("previousModificationDiligence.do")
		public void previousModificationDiligence(HttpSession session, HttpServletResponse response,
				@RequestParam(value="currentPage", required=false,defaultValue="1") int currentPage) throws JsonIOException, IOException {
			response.setContentType("application/json; charset=utf-8");
			
			
			
			int previousModificationDiligenceCount = pService.previousModificationDiligenceCount();
			PageInfo pi = Pagination.getPageInfoForModal(currentPage, previousModificationDiligenceCount);
			ArrayList<ModificationDiligence> previousModificationDiligence = pService.previousModificationDiligence(pi);
			
			System.out.println(previousModificationDiligence);
			Map list = new HashMap();
			list.put("previousModificationDiligence",previousModificationDiligence);
			list.put("pi",pi);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list,response.getWriter());
		}
	
}
