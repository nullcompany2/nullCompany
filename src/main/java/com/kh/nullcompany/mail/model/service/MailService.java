package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.member.model.vo.Member;

public interface MailService {

	
	 /** 1. 이름 누르고 그 사람에게 메일 보내기 
	 * @param senderId
	 * @return
	 */
	Member mailWriteId(int memNo);

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
	ArrayList<Mail> selectMailReceiveList(PageInfo pi, String memId);
	
	/**
	 * 4. 메일 디테일뷰 보기 
	 * @param mailNo
	 * @return
	 */
	Mail mailDetailView(int mailNo);

	/**
	 *  받은 메일함 
	  5. 읽은 메일 리스트 
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

	/**
	 * 5. 메일 답장하기 
	 * @param mailNo
	 * @return
	 */
	Mail mailReply(int mailNo);

	/** 
	 * 보낸 편지함 리스트 
	 * @param pi
	 * @param memId
	 * @return
	 */
	ArrayList<Mail> selectMailSendList(PageInfo pi, String memId);

	/**
	 * 보낸 편지함 디테일뷰 
	 * @param mailNo
	 * @return
	 */
	Mail sendMailDetailView(int mailNo);

	/** 
	 * 6. 답장 - > 임시 저장 
	 * @param ma
	 * @return
	 */
	int saveMail(Mail ma);

	/**
	 *  답장 - 보내기 
	 * @param ma
	 * @return
	 */
	int sendMail(Mail ma);

	/**
	 *  임시 보관함 리스트 
	 * @param pi
	 * @param memId
	 * @return
	 */
	ArrayList<Mail> mailSaveList(PageInfo pi, String memId);
	
	/**
	 * 임시 보관함 디테일뷰 
	 * @param mailNo
	 * @return
	 */
	Mail saveDetailView(int mailNo);

	/**
	 * 
	 * 받은 메일함에서 전체 삭제 
	 * @param memId
	 * @return
	 */
	int allDelMail(String memId);

	/**
	 * 휴지통 리스트 
	 * @param pi
	 * @param memId
	 * @return
	 */
	ArrayList<Mail> binMailList(PageInfo pi, String memId);

	/**
	 * 휴지통 리스트 세기 
	 * @param memId
	 * @return
	 */
	int getBinListCount(String memId);


//	/**
//	 * 12. 쓰레기통 from 받은 메일함 
//	 * @param pi
//	 * @param memId
//	 * @return
//	 */
//	ArrayList<Mail> RecieveMailbinList(PageInfo pi, String memId);
//
//	/**
//	 *  13. 쓰레기통에 인서트하기전 문서번호 셀렉트 
//	 * @param memNo
//	 * @return
//	 */
//	ArrayList<Mail> selectRmaNo(int memNo);
//	
//	/**
//	 *  14. 문서번호 리스트 가지고, 맵퍼에 쓰레기통 인서트 하러가기 
//	 * @param list
//	 * @param memId 
//	 * @return
//	 */
//	int insertReBin(List<Mail> list);

	
	
	

	

	



	
	

}
