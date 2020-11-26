package com.kh.nullcompany.officeManagement.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
