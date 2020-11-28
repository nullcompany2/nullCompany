package com.kh.nullcompany.officeManagement.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.officeManagement.model.service.OfficeService;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainContactInformation;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainInformationCalculation;

@Controller
public class OfficeController {
	
	@Autowired
	private OfficeService oService;
	
	// 오피스 메인 
	@RequestMapping("officeMain.do")
	public ModelAndView officeManagementMain(ModelAndView mv,HttpServletResponse response) {
		
		ArrayList<OfficeMainContactInformation> mci = oService.contactInformation();
		OfficeMainInformationCalculation mic = oService.informationCalculate();
		ArrayList<OfficeMainContactInformation> om = oService.officeManager();
		System.out.println(mci);
		System.out.println(mic);
		System.out.println(om);
		mv.addObject("mci",mci);
		mv.addObject("mic",mic);
		mv.addObject("om",om);
		mv.setViewName("office-management/officeManagementMain");
		return mv;
	}
	
	// 오피스 전체관리자 지정
	@RequestMapping("officeAdminAP.do")
	public ModelAndView officeAdminAp(ModelAndView mv,HttpServletResponse response) {
		
		// 오피스 관리자 아닌 멤버 전체 출력
		ArrayList<Member> nomalMember = oService.notManagerMember();
		
		// 오피스 관리자 멤버 전체 출력
		ArrayList<Member> managerMember = oService.ManagerMember();
		System.out.println("nomalMember :"+nomalMember);
		System.out.println("manager : "+managerMember);
		
		mv.addObject("nomalMember",nomalMember);
		mv.addObject("managerMember",managerMember);
		mv.setViewName("office-management/officeAdminAP");
		return mv;
	}
	
	// 오피스 로고 설정
	@RequestMapping("officeLogo.do")
	public String officeSettingLogo(HttpServletResponse response) {
		return "office-management/officeSettingLogo";
	}
	
	@RequestMapping("searchManagerList.do")
	public void searchManagerList(String key, HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		System.out.println(key);
		
		ArrayList<Member> searchMember = oService.searchMember(key);
		System.out.println(searchMember);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(searchMember,response.getWriter());
	}
	
	@RequestMapping("updateOfficeManager.do")
	public String updateOfficeManager (String list ) {
		
		String[] managerList = list.split(",");
		
		for(String str : managerList) {
			System.out.println(str);
		}
		
		int result = oService.updateOfficeManager(managerList);
		
		return "redirect:officeAdminAP.do";
	}
}
