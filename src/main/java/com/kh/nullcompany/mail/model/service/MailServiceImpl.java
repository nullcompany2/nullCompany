package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;
import java.util.Map;

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

	
	// 받은 메일함 리스트 
	@Override
	public ArrayList<Mail> selectMailReceiveList(PageInfo pi, int memNo) {
		return maDao.selectMailReceiveList(pi,memNo);
	}

	// 받은 편지함 리스트 카운트 
	@Override
	public int getListCount(int memNo) {
		return maDao.getListCount(memNo);
	}

	// 이름 누르고 그 사람에게 메일 보내기 
	@Override
	public Member mailWriteId(int senderNo) {
		return 	maDao.mailWriteId(senderNo);
	}

	@Override
	public Mail mailDetailView(int mailNo) {
		int result = maDao.updateCount(mailNo);
		
		if(result > 0) {
			return maDao.mailDetailView(mailNo);
			
		}else {
			return null;
		}
	}

	@Override
	public Mail mailReply(int mailNo) {
		return maDao.mailReply(mailNo);
	}

	

}
