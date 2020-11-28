package com.kh.nullcompany.logo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.logo.model.vo.Logo;

@Repository("lDao") 
public class LogoDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int logoUpload(Logo l) {
		return sqlSession.insert("logoMapper.logoUpload",l);
	}

	public Logo logoSelect() {
		return sqlSession.selectOne("logoMapper.logoSelect");
	}

}
