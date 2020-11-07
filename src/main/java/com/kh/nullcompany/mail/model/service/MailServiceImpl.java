package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.dao.MailDao;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.member.model.vo.Member;

@Service("maService")
public class MailServiceImpl implements MailService {

@Autowired
	private MailDao maDao;

	

	// 리스트 카운트 
	@Override
	public int getListCount(int memNo) {
		return maDao.getListCount(memNo);
	}

	// 받은 편지함 리스트 가져오기 
	@Override
	public ArrayList<Mail> selectMailReceiveList(PageInfo pi, String memId) {
		return maDao.selectMailReceiveList(pi,memId);
	}

	// 받은 편지함 리스트 - 아이디 누르기 
	@Override
	public Member mailWriteId(int memNo) {
		return maDao.mailWriteId(memNo);
	}

	// 메일 디테일뷰 
	@Override
	public Mail mailDetailView(int mailNo) {
		int result = maDao.updateCount(mailNo);
		
		if(result >0) {
			return maDao.mailDetailView(mailNo);
	      }else {
	         return null;
	      }
	}

	// 받은 편지함 - 읽은 메일 리스트 
	@Override
	public ArrayList<Mail> readMailList(PageInfo pi, String memId) {
		return maDao.readMailList(pi,memId);
	}
	
	// 받은 편지함 - 안 읽은 메일 리스트 
	@Override
	public ArrayList<Mail> unReadMailList(PageInfo pi, String memId) {
		return maDao.unReadMailList(pi,memId);
	}

	// 받은 편지함 - 답장하기 
	@Override
	public Mail mailReply(int mailNo) {
		return maDao.mailReply(mailNo);
	}

	@Override
	public ArrayList<Mail> selectMailSendList(PageInfo pi, String memId) {
		return maDao.selectMailSendList(pi,memId);
	}

	@Override
	public Mail sendMailDetailView(int mailNo) {
		int result = maDao.updateCount(mailNo);
		
		if(result >0) {
			return maDao.sendMailDetailView(mailNo);
	      }else {
	         return null;
	      }
	}

	// 답장하기 - 임시저장 
	@Override
	public int saveMail(Mail ma) {
		return maDao.saveMail(ma);
	}

	// 답장하기 - 보내기 
	@Override
	public int sendMail(Mail ma) {
		return maDao.sendMail(ma);
	}

	// 임시 보관함 리스트 
	@Override
	public ArrayList<Mail> mailSaveList(PageInfo pi, String memId) {
		return maDao.mailSaveList(pi,memId);
	}

	// 임시 보관함 메일 한개 보기 
	@Override
	public Mail saveDetailView(int mailNo) {
		return maDao.saveDetailView(mailNo);
	}

	// 보낸 편지함 - 전체 삭제 
	@Override
	public int allDelMail(String memId) {
		return maDao.allDelMail(memId);
	}

	@Override
	public ArrayList<Mail> binMailList(PageInfo pi, String memId) {
		return maDao.binMailList(pi,memId);
	}

	@Override
	public int getBinListCount(String memId) {
		return maDao.getBinListCount(memId);
	}

	


	


	
	
}
