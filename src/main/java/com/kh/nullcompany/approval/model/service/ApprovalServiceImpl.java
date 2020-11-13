package com.kh.nullcompany.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.approval.model.dao.ApprovalDao;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.Step;
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

	@Override
	public ArrayList<Step> selectStepList(String docTempNo) {
		return aDao.selectStepList(docTempNo);
	}

	@Override
	public int getCompleteAllListCount(int memNo) {
		return aDao.getCompleteAllListCount(memNo);
	}

	@Override
	public ArrayList<Document> selectCompleteAllList(int memNo, PageInfo pi) {
		return aDao.selectCompleteAllList(memNo, pi);
	}
}
