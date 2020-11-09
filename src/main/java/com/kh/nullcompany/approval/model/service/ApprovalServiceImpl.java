package com.kh.nullcompany.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.approval.model.dao.ApprovalDao;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.board.model.vo.PageInfo;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDao aDao;
	
	@Override
	public int getProgressAllListCount(int memNo) {
		return aDao.getProgressAllListCount(memNo);
	}

	@Override
	public ArrayList<Document> selectProgressAllList(int memNo,PageInfo pi) {
		return aDao.selectProgressAllList(memNo, pi);
	}

}
