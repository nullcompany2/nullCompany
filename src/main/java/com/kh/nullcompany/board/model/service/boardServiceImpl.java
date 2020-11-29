package com.kh.nullcompany.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.dao.boardDao;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.board.model.vo.bcomment;

@Service("bService")
public class boardServiceImpl implements boardService {

	@Autowired
	private boardDao bDao;

	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	@Override
	public ArrayList<board> selectListBoard(PageInfo pi) {
		return bDao.selectListBoard(pi);
	}

	@Override
	public board selectBoard(int bNo) {
		int result = bDao.updateCount(bNo);

		if(result >0) {
			return bDao.selectBoard(bNo);
		}else {
			return null;
		}
	}

	@Override
	public ArrayList<bcomment> selectbCommentList(int bNo) {
		return bDao.selectbCommentList(bNo);
	}

	@Override
	public int insertbComment(bcomment c) {
		return bDao.insertbComment(c);
	}

	@Override
	public int insertBoard(board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public Object selectUpdateBoard(int bNo) {
		return bDao.selectBoard(bNo);
	}

	@Override
	public int updateBoard(board b) {
		return bDao.updateBoard(b);
	}







}