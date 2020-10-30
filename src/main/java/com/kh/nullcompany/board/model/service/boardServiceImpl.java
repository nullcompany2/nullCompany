package com.kh.nullcompany.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.board.model.dao.boardDao;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;

@Service("bService")
public class boardServiceImpl implements boardService {

	@Autowired
	private boardDao bDao;
	
	@Override
	public int getListCount() {
		return bDao.getListCount();
	}


	@Override
	public ArrayList<board> selectListImport(PageInfo pi) {
		return bDao.selectListImport(pi);
	}


	@Override
	public ArrayList<board> selectListAll(PageInfo pi) {
		return bDao.selectListAll(pi);
	}


	@Override
	public ArrayList<board> selectListTeam(PageInfo pi) {
		return bDao.selectListTeam(pi);
	}


	@Override
	public ArrayList<board> selectListFree(PageInfo pi) {
		return bDao.selectListFree(pi);
	}


	@Override
	public board selectBoard(int bNo) {
		int result = bDao.updateCount(bNo);
		System.out.println(result);
		
		if(result >0) {
			return bDao.selectBoard(bNo);
		}else {
			return null;
		}
	}


	
	

}
