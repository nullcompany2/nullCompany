package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.mail.model.vo.MailListCount;
import com.kh.nullcompany.member.model.vo.Member;

public interface MailService {

	
	 /** 1. 이름 누르고 그 사람에게 메일 보내기 
	 * @param senderId
	 * @return
	 */
	Member mailWriteId(int memNo);


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

	/**
	 *  휴지통 디테일 뷰 
	 * @param mailNo
	 * @return
	 */
	Mail delMailDetailView(int mailNo);

	/**
	 *  휴지통에 있는 거 전부 삭제 
	 * @param memId
	 * @return
	 */
	int allBinDelMail(String memId);


	/**
	 *  메일 전송시 보내는 사람 아이디 이름 가져와서 addOb
	 * @param recipient
	 * @return
	 */
	Member findIdName(String recipient);
	
	/**
	 * 받는 메일함에서 리얼 삭제 
	 * @param memId
	 * @return
	 */
	int allRealDelMail(String memId);

	/**
	 *  메일 디테일뷰에서 한개 삭제 
	 * 
	 * @param mailNo
	 * @return
	 */
	int deleteOneMail(int mailNo);

	/**
	 *  메일 디테일뷰에서 한개 완전 삭제 
	 * @param mailNo
	 * @return
	 */
	int realDeleteOneMail(int mailNo);

	/**
	 * 2. 받은 메일함 리스트 갯수 세기 
	 * @return
	 */
	int getReListCount(String memId);

	/**
	 * 
	 * 3. 보낸 메일함 리스트 갯수 세기 
	 * @param memId
	 * @return
	 */
	int getSendListCount(String memId);


	/**
	 * 
	 *  4. 임시보관함 리스트 갯수 세기 
	 * @param memId
	 * @return
	 */
	int getSaveListCount(String memId);

	/**
	 *  메일쓰기 -> 받는 사람 이메일 주소 자동완성 
	 * 
	 * @param text
	 * @return
	 */
	ArrayList<Member> autoComplete(String text);


	/**
	 *  스레기통에서 복구 하기... 
	 * @param mailNo
	 * @return
	 */
	int backMail(int mailNo);


	/** 
	 * 안 읽은 메일 갯수 세기 
	 * @param memId
	 * @return
	 */
	int getReReListCount(String memId);


	/**
	 * 메인에 뿌릴 메일 갯수 세기 
	 * @param memId
	 * @return
	 */
	MailListCount getMailBoxCount(String memId);


	/**
	 * 제목 검색하기 
	 * 
	 * @param map
	 * @return
	 */
	ArrayList<Mail> searchTitle(Map map);
	
}
