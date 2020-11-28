package com.kh.nullcompany.logo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("lDao") 
public class LogoDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int logoUpload(String logoFileName) {
		return sqlSession.insert("logoMapper.logoUpload",logoFileName);
	}

}
