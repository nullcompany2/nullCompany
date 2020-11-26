package com.kh.nullcompany.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.member.model.dao.MemberDao;
import com.kh.nullcompany.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;
	
//	@Autowired
//	SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}


	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

	@Override
	public int emailCheck(String email) {
		return mDao.emailCheck(email);
	}

	@Override
	public int insertInfoMember(Member m) {
		return mDao.insertInfoMember(m);
	}

	@Override
	public int phoneCheck(String phone) {
		return mDao.phoneCheck(phone);
	}

	
}
