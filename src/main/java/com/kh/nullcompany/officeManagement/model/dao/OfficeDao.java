package com.kh.nullcompany.officeManagement.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainContactInformation;
import com.kh.nullcompany.officeManagement.model.vo.OfficeMainInformationCalculation;

@Repository("oDao")
public class OfficeDao {
	
	@Autowired
	SqlSessionTemplate sqlSession; 
	
	public OfficeMainInformationCalculation informationCalculate() {
		return sqlSession.selectOne("officeMapper.informationCalculate");
	}

	public ArrayList<OfficeMainContactInformation> contactInformation() {
		return (ArrayList)sqlSession.selectList("officeMapper.contactInformation");
	}

	public ArrayList<OfficeMainContactInformation> officeManager() {
		return (ArrayList)sqlSession.selectList("officeMapper.officeManager");
	}

	public ArrayList<Member> notManagerMember() {
		return (ArrayList)sqlSession.selectList("officeMapper.notManagerMember");
	}

	public ArrayList<Member> ManagerMember() {
		return (ArrayList)sqlSession.selectList("officeMapper.ManagerMember");
	}

	public ArrayList<Member> searchMember(String key) {
		return (ArrayList)sqlSession.selectList("officeMapper.searchMember",key);
	}

	public int updateOfficeManager(String[] managerList) {
		int result =0;
		for(String str : managerList) {
			result = sqlSession.update("officeMapper.updateOfficeManager",str);			
		}
		result = sqlSession.update("officeMapper.updateNomalMember",managerList);
		return result;
	}

}
