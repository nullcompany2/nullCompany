package com.kh.nullcompany.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("aDao")
public class ApprovalDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getProgressAllListCount(int memNo) {
		return sqlSession.selectOne("approvalMapper.getProgressAllListCount", memNo);
	}

}
