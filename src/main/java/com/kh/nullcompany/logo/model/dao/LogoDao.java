package com.kh.nullcompany.logo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lDao") 
public class LogoDao {

	@Autowired
	SqlSessionTemplate sqlSession;

}
