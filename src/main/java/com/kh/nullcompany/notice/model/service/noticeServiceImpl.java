package com.kh.nullcompany.notice.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.notice.model.dao.noticeDao;
import com.kh.nullcompany.notice.model.vo.ncomment;
import com.kh.nullcompany.notice.model.vo.notice;
import com.kh.nullcompany.notice.model.vo.tnotice;

@Service("nService")
public class noticeServiceImpl implements noticeService {

	@Autowired
	private noticeDao nDao;
	
	@Override
	public int getListCount() {
		return nDao.getListCount();
	}

	@Override
	public ArrayList<notice> selectListNotice(PageInfo pi) {
		return nDao.selectListNotice(pi);
	}

	@Override
	public notice selectNotice(int nNo) {
		int result = nDao.updateCount(nNo);
	      
	      if(result >0) {
	         return nDao.selectNotice(nNo);
	      }else {
	         return null;
	      }
	   }

	@Override
	public ArrayList<ncomment> selectnCommentList(int nNo) {
		return nDao.selectnCommentList(nNo);
	}

	@Override
	public int insertnComment(ncomment c) {
		return nDao.insertnComment(c);
	}

	@Override
	public int insertNotice(notice n) {
		return nDao.insertNotice(n);
	}

	

	@Override
	public notice selectUpdateNotice(int nNo) {
		return nDao.selectNotice(nNo);
	}


	@Override
	public int ndelete(int nNo) {
		return nDao.ndelete(nNo);
	}

	

	@Override
	public ArrayList<notice> noticeList() {
		return nDao.noticeList();
	}


	@Override
	public int updateNotice(notice n) {
		return nDao.updateNotice(n);
	}

	@Override
	public int deleteNotice(int nNo) {
		return nDao.deleteNotice(nNo);
	}

	@Override
	public ArrayList<notice> searchnTitle(Map map) {
		return nDao.searchnTitle(map);
	}

	@Override
	public ArrayList<notice> searchnWriter(Map map) {
		return  nDao.searchnWriter(map);
	}

	@Override
	public ArrayList<notice> searchnContent(Map map) {
		return  nDao.searchnContent(map);
	}

	@Override
	public ArrayList<notice> searchntitleContent(Map map) {
		return  nDao.searchntitleContent(map);
	}

	
}
