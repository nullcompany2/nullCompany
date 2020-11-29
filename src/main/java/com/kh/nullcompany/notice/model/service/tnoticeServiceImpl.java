package com.kh.nullcompany.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.notice.model.dao.noticeDao;
import com.kh.nullcompany.notice.model.dao.tNoticeDao;
import com.kh.nullcompany.notice.model.vo.tcomment;
import com.kh.nullcompany.notice.model.vo.tnotice;

@Service("tService")
public class tnoticeServiceImpl implements tnoticeService {

	@Autowired
	private tNoticeDao tDao;
	
	@Override
	public int getListCount() {
		return tDao.getListCount();
	}

	@Override
	public ArrayList<tnotice> selectListtNotice(PageInfo pi) {
		return tDao.selectListtNotice(pi);
	}

	@Override
	public tnotice selecttNotice(int tNo) {
		int result = tDao.updateCount(tNo);
	      
	      if(result >0) {
	         return tDao.selecttNotice(tNo);
	      }else {
	         return null;
	      }
	   }

	@Override
	public ArrayList<tcomment> selecttCommenList(int tNo) {
		return tDao.selecttCommentList(tNo);
	}

	@Override
	public int inserttComment(tcomment c) {
		return tDao.inserttComment(c);
	}

	@Override
	public int inserttNotice(tnotice t) {
		return tDao.inserttNoice(t);
	}

	@Override
	public ArrayList<tnotice> tnoticeList() {
		return tDao.tnoticeList();
	}

	@Override
	public Object selectUpdatetNotice(int tNo) {
		return tDao.selecttNotice(tNo);
	}

	@Override
	public int updatetNotice(tnotice t) {
		return tDao.updatetNotice(t);
	}

}
