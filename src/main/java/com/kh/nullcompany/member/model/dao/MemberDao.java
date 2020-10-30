package com.kh.nullcompany.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.nullcompany.member.model.vo.Member;

@Repository("mDao") // DB와 접근하는 클래스타입 
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int deleteMember(String id) {
		return sqlSession.update("memberMapper.deleteMember",id);
	}

	public int idCheck(String id) {
		return sqlSession.selectOne("memberMapper.idCheck",id);
	}

	public int emailCheck(String email) {
		return sqlSession.selectOne("memberMapper.emailCheck",email);
	}

	public int insertInfoMember(Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

}
