package com.kh.nullcompany.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.mail.model.vo.Email;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.service.ScheduleService;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.DetailSchedule;
import com.kh.nullcompany.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService sService;

	// 일정 관리 메인
	@RequestMapping("Schedulermain.do")
	public ModelAndView Schedulermain(ModelAndView mv,  HttpServletResponse response, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();	
		
		// 총 부서 리스트
		ArrayList<Department> deptList = sService.deptList();
		// 총 사원 리스트
		ArrayList<Member> memList = sService.memList();
		// 공유 캘린더 리스트
		ArrayList<Calendar> publicCalList = sService.publicCalList(memNo);
		// 내 캘린더 리스트
		ArrayList<Calendar> IndividualCalList = sService.IndividualCalList(memNo);
		ArrayList<Calendar> SelectpublicCalList = sService.SelectpublicCalList(memNo);
		// 일정 리스트
		ArrayList<Schedule> ScheduleList = sService.ScheduleList(memNo);

		mv.addObject("deptList", deptList);
		mv.addObject("memList", memList);
		mv.addObject("publicCalList", publicCalList);
		mv.addObject("IndividualCalList", IndividualCalList);
		mv.addObject("SelectpublicCalList", SelectpublicCalList);
		mv.addObject("ScheduleList", ScheduleList);
		
		mv.setViewName("Scheduler/Schedulermain");

		return mv;
	}
	// 검색 결과
	@RequestMapping("SchedulerSearch.do")
	public ModelAndView SchedulerSearch(ModelAndView mv, String text, String select_option, HttpServletResponse response, HttpSession session) {
	
		if(select_option.equals("Sche_name")) {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();	
		
			ArrayList<Schedule> Sche_name_Search = sService.Sche_name_Search(text);
			System.out.println("스케쥴" + Sche_name_Search);
			mv.addObject("Sche_name_Search", Sche_name_Search);
			
			// 총 부서 리스트
			ArrayList<Department> deptList = sService.deptList();
			// 총 사원 리스트
			ArrayList<Member> memList = sService.memList();
			// 공유 캘린더 리스트
			ArrayList<Calendar> publicCalList = sService.publicCalList(memNo);
			// 내 캘린더 리스트
			ArrayList<Calendar> IndividualCalList = sService.IndividualCalList(memNo);
			ArrayList<Calendar> SelectpublicCalList = sService.SelectpublicCalList(memNo);
			// 일정 리스트
			ArrayList<Schedule> ScheduleList = sService.ScheduleList(memNo);

			mv.addObject("deptList", deptList);
			mv.addObject("memList", memList);
			mv.addObject("publicCalList", publicCalList);
			mv.addObject("IndividualCalList", IndividualCalList);
			mv.addObject("SelectpublicCalList", SelectpublicCalList);
			mv.addObject("ScheduleList", ScheduleList);
			
			mv.setViewName("Scheduler/SchedulerResearch");
			
			return mv;
		}else {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();	
			
			// 총 부서 리스트
			ArrayList<Department> deptList = sService.deptList();
			// 총 사원 리스트
			ArrayList<Member> memList = sService.memList();
			// 공유 캘린더 리스트
			ArrayList<Calendar> publicCalList = sService.publicCalList(memNo);
			// 내 캘린더 리스트
			ArrayList<Calendar> IndividualCalList = sService.IndividualCalList(memNo);
			ArrayList<Calendar> SelectpublicCalList = sService.SelectpublicCalList(memNo);
			// 일정 리스트
			ArrayList<Schedule> ScheduleList = sService.ScheduleList(memNo);

			mv.addObject("deptList", deptList);
			mv.addObject("memList", memList);
			mv.addObject("publicCalList", publicCalList);
			mv.addObject("IndividualCalList", IndividualCalList);
			mv.addObject("SelectpublicCalList", SelectpublicCalList);
			mv.addObject("ScheduleList", ScheduleList);
			
			ArrayList<Schedule> Cal_name_Search = sService.Cal_name_Search(text);
			mv.addObject("Cal_name_Search", Cal_name_Search);
			mv.setViewName("Scheduler/SchedulerResearch");
			
			return mv;
		}

		
	}

	// 공유 캘린더 인써트
	@RequestMapping("insertCommunityCal.do")

	public void insertCommunity(@Param("Calendar") Calendar Calendar ) {
		sService.insertCommunity(Calendar);


		// 등록권한 리스트
		String[] enrollarray = Calendar.getEnrollMember().split(",");
		int [] enrollmemno = Arrays.stream(enrollarray).mapToInt(Integer::parseInt).toArray();

		sService.EnrollMember(enrollmemno, Calendar.getCalNo());
		// 조회권한 리스트
		String[] lookarray = Calendar.getLookMember().split(",");
		int [] lookmemno = Arrays.stream(lookarray).mapToInt(Integer::parseInt).toArray();

		sService.LookMember(lookmemno, Calendar.getCalNo());

	}
	
	// 공유 캘린더 사원 검색 아라언니 최고!
	@RequestMapping("SearchMem_public.do")
	public void autoComplete(HttpServletResponse response, String text) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		System.out.println(text);
		
		ArrayList<Member> m = sService.SearchMem_public(text);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(m,response.getWriter());
	}

	// 내 캘린더 인써트
	@RequestMapping("insertIndividual.do")

	public void insertIndividual(@Param("Calendar") Calendar Calendar ) {
		int result = sService.insertIndividual(Calendar);


		int IndEnrollMember = Integer.parseInt(Calendar.getEnrollMember());
		int IndLookMember = Integer.parseInt(Calendar.getLookMember());
		sService.IndEnrollMember(IndEnrollMember, Calendar.getCalNo());

		sService.IndLookMember(IndLookMember, Calendar.getCalNo());


	}

	// 일정 인써트
	@RequestMapping("insertSchedule.do")
	public void insertSchedule(@Param("Schedule") Schedule Schedule ) {
		int result = sService.insertSchedule(Schedule);

		

	}
	
	// 일정 디테일
	@RequestMapping("detailSchedule.do" )
	public void detailSchedule(@Param("Sche_name") String Sche_name, Model model , HttpServletResponse response) throws JsonIOException, IOException {
		Schedule sche = new Schedule();
		
		String memcount =sService.getCalmemCount(Sche_name);

		Map map = new HashMap();
		map.put("memcount", memcount);
		map.put("Sche_name", Sche_name);
		int result = (sService.updateCalCountMember(map));
		
		sche = sService.detailSchedule(Sche_name);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(sche,response.getWriter());
	
	}
	
	// 일정 디테일 총 인원 수

	@RequestMapping("detailCalMember.do" )
	public void detailCalMember(@Param("calNo") int calNo, Model model , HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Calendar> DetailCalmemberList = sService.DetailCalmemberList(calNo);
		System.out.println(calNo);
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(DetailCalmemberList,response.getWriter());
	
	}

	// 일정 수정 모달 디테일 뜨게
	@RequestMapping("editDetailSchedule.do" )
	public void editDetailSchedule(@Param("Sche_name") int Sche_no, Model model , HttpServletResponse response) throws JsonIOException, IOException {
		Schedule sche = new Schedule();
		
		sche = sService.editDetailSchedule(Sche_no);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(sche,response.getWriter());
	
	}

	// 일정 수정
	@RequestMapping("updateSchedule.do")
	public ModelAndView updateSchedule(ModelAndView mv,Schedule Schedule ,HttpServletRequest request){
		int result = sService.updateSchedule(Schedule);
		System.out.println(Schedule);
		System.out.println(result);
		if(result>0) {
			mv.setViewName("Scheduler/Schedulermain");
		}else {
			mv.addObject("msg","삭제실패").setViewName("common/errorPage");
		}
		return mv;


	}
	
	// 일정 삭제
	@RequestMapping("DeleteSchedule.do")
	public ModelAndView DeleteSchedule(ModelAndView mv, int sche_no,HttpServletRequest request){

		int result = (sService.DeleteSchedule(sche_no));

		if(result>0) {
			mv.setViewName("Scheduler/Schedulermain");
		}else {
			mv.addObject("msg","삭제실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
		
	// 내 캘린더 정보 가져오기
	@RequestMapping("editDetailIndiCal.do" )
	public void editDetailIndiCal(ModelAndView mv, int calNo, HttpServletResponse response) throws JsonIOException, IOException{
		Calendar cal = sService.editDetailIndiCal(calNo);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(cal,response.getWriter());

	
	}
		
	// 내 캘린더 수정
	@RequestMapping("editIndiCal.do" )
	public void editIndiCal(@Param("Calendar") Calendar calendar, HttpServletResponse response) throws JsonIOException, IOException {
		
		int result = sService.editIndiCal(calendar);
	
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(result,response.getWriter());

	
	}

		
		
	// 내 캘린더 삭제
	@RequestMapping("DeleteIndiCal.do")
	public ModelAndView DeleteIndiCal(ModelAndView mv, int calNo, HttpServletRequest request){
		int result = sService.DeleteIndiCal(calNo);
		int result2 = sService.DeleteIndiCal_Sche(calNo);
		
		if(result>0 && result2 > 0) {
			mv.setViewName("Scheduler/Schedulermain");
		}else {
			mv.addObject("msg","수정실패").setViewName("common/errorPage");
		}
		return mv;
		
		
		
		
	}
	
	// 일정도 같이 업데이트
	@RequestMapping("editIndiCal_Sche.do" )
	public ModelAndView updateacceptMember(ModelAndView mv, int cal_no,
			HttpServletRequest request){

		int result = (sService.editIndiCal_Sche(cal_no));

		if(result>0) {
			mv.setViewName("Scheduler/Schedulermain");
		}else {
			mv.addObject("msg","수정실패").setViewName("common/errorPage");
		}
		return mv;
		
	
	}
	
	
	// 공유 캘린더 정보 가져오기
	@RequestMapping("editDetailPublicCal.do" )
	public void editDetailPublicCal(ModelAndView mv, int calNo, HttpServletResponse response) throws JsonIOException, IOException{
		Calendar cal = sService.editDetailPublicCal(calNo);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(cal,response.getWriter());

	
	}
	

}