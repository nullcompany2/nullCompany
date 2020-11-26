package com.kh.nullcompany.officeManagement.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.officeManagement.model.vo.OfficeMainContactInformation;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainInformationCalculation;


public interface OfficeService { 

	ArrayList<OfficeMainContactInformation> contactInformation();

	OfficeMainInformationCalculation informationCalculate();

	ArrayList<OfficeMainContactInformation> officeManager();

}
