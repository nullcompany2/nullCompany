package com.kh.nullcompany.officeManagement.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.officeManagement.model.dao.OfficeDao;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainContactInformation;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainInformationCalculation;

@Service("oService")
public class OfficeServiceImpl implements OfficeService {
	@Autowired
	private OfficeDao oDao; 

	@Override
	public ArrayList<OfficeMainContactInformation> contactInformation() {
		return oDao.contactInformation();
	}

	@Override
	public OfficeMainInformationCalculation informationCalculate() {
		return oDao.informationCalculate();
	}

	@Override
	public ArrayList<OfficeMainContactInformation> officeManager() {
		return oDao.officeManager();
	}

	@Override
	public ArrayList<Member> notManagerMember() {
		return oDao.notManagerMember();
	}

	@Override
	public ArrayList<Member> ManagerMember() {
		return oDao.ManagerMember();
	}

}
