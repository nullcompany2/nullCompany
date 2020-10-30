package com.kh.nullcompany.officeManagement.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OfficeController {
	
	// 오피스 메인
	@RequestMapping("officeMain.do")
	public String officeManagementMain(HttpServletResponse response) {
		return "office-management/officeManagementMain";
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
