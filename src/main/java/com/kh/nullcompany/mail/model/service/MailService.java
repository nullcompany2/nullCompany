package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;

public interface MailService {

	/**
	 * 1. 답장하기 
	 * @param recipient
	 * @return
	 */
	Mail replyMail(String recipient);

	/**
	 * 2. 받은 메일함 리스트 갯수 세기 
	 * @return
	 */
	int getListCount();

	/**
	 * 3. 받은 메일함 리스트 가져오기 
	 * @param mailListmap
	 * @return
	 */

	ArrayList<Mail> selectMailReceiveList(PageInfo pi);


	
	

}
