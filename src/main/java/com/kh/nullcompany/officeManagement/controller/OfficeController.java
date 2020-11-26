package com.kh.nullcompany.officeManagement.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public String officeAdminAp(HttpServletResponse response) {
		return "office-management/officeAdminAP";
	}
	
	// 오피스 로고 설정
	@RequestMapping("officeLogo.do")
	public String officeSettingLogo(HttpServletResponse response) {
		return "office-management/officeSettingLogo";
	}
}
