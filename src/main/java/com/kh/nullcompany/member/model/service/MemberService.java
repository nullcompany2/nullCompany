package com.kh.nullcompany.member.model.service;

import com.kh.nullcompany.member.model.vo.Member;

public interface MemberService {

	/**
	 *  1. 회원 로그인 서비스를 위한 메소드 
	 * @param m
	 * @return Member
	 */
	
	Member loginMember(Member m);
	
	/**
	 * 
	 * 2. 회원 가입 서비스를 위한 메소드 
	 * @param m
	 * @return 성공시 1이상 / 실패시 -1 
	 */
	int insertMember(Member m);
	
	/** 
	 * 4. 회원 탈퇴 서비스를 위한 메소드 
	 * @param id
	 * @return
	 */
	int deleteMember(String id);

	/**
	 *  회원 가입시 아이디 중복 체크 
	 * @param id
	 * @return
	 */
	int idCheck(String id);

	/**
	 *  회원 가입시 이메일 중복 체크 
	 * @param email
	 * @return
	 */
	int emailCheck(String email);

	/**
	 * 3. 회원 정보 수정 서비스를 위한 메소드 
	 * @param m
	 * @return
	 */
	int insertInfoMember(Member m);

	/**
	 * 회원 가입시 휴대전화 중복 체크 
	 * @param phone
	 * @return
	 */
	int phoneCheck(String phone);
	
}
