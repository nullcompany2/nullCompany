package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.mail.model.vo.SaveMail;
import com.kh.nullcompany.member.model.vo.Member;

public interface MailService {

	
	 /** 1. 이름 누르고 그 사람에게 메일 보내기 
	 * @param senderId
	 * @return
	 */
	Member mailWriteId(int senderNo);

	/**
	 * 2. 받은 메일함 리스트 갯수 세기 
	 * @return
	 */
	int getListCount(int memNo);

	/**
	 * 3. 받은 메일함 리스트 가져오기 
	 * @param mailListmap
	 * @return
	 */
	ArrayList<Mail> selectMailReceiveList(PageInfo pi, int memNo);

	/**
	 * 4. 메일 디테일뷰 보기 
	 * @param mailNo
	 * @return
	 */
	Mail mailDetailView(int mailNo);

	/**
	 * 5. 메일 답장하기 
	 * @param mailNo
	 * @return
	 */
	Mail mailReply(int mailNo);

	/** 
	 * 6. 답장 - > 임시 저장 
	 * @param ma
	 * @return
	 */
	int saveMail(Mail ma);

	/** 
	 * 7. 임시 보관함 리스트 가져오기 
	 * @param pi
	 * @param memNo
	 * @return
	 */
	ArrayList<SaveMail> mailSaveList(PageInfo pi, int memNo);

	/**
	 * 8. 임시 보관함 디테일뷰 보기
	 * @param mailNo
	 * @return
	 */
	SaveMail saveDetailView(int mailNo);

	/**
	 * 9. 읽은 메일 선택시 리스트 가져오기 에이작스 
	 * @param pi
	 * @param memId
	 * @return
	 */
	ArrayList<Mail> readMailList(PageInfo pi, String memId);

	/**
	 * 10. 안 읽은 메일 리스트 
	 * @param pi
	 * @param memId
	 * @return
	 */
	ArrayList<Mail> unReadMailList(PageInfo pi, String memId);

	



	
	

}
