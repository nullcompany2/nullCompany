
package com.kh.nullcompany.officeManagement.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainContactInformation;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainInformationCalculation;


public interface OfficeService {  

	ArrayList<OfficeMainContactInformation> contactInformation();

	OfficeMainInformationCalculation informationCalculate();

	ArrayList<OfficeMainContactInformation> officeManager();
	
	// 오피스관리자 아닌멤버
	ArrayList<Member> notManagerMember();
	// 오피스관리자
	ArrayList<Member> ManagerMember();
	// 오피스관리자 검색 아이디 / 이름
	ArrayList<Member> searchMember(String key);
	// 오피스관리자 업데이트
	int updateOfficeManager(String[] managerList);

}
