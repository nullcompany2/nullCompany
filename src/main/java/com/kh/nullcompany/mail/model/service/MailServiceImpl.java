package com.kh.nullcompany.mail.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.mail.model.dao.MailDao;
import com.kh.nullcompany.mail.model.vo.Mail;

@Service("maService")
public class MailServiceImpl implements MailService {

@Autowired
	private MailDao maDao;

	@Override
	public Mail replyMail(String recipient) {
		return null;
	}

	@Override
	public int getListCount() {
		return maDao.getListCount();
	}

	@Override
	public ArrayList<Mail> selectMailReceiveList(PageInfo pi) {
		return maDao.selectMailReceiveList(pi);
	}

	

}
