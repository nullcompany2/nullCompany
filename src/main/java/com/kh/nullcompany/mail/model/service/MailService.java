package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
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

	



	
	

}
