package com.kh.nullcompany.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.approval.model.dao.ApprovalDao;
import com.kh.nullcompany.approval.model.vo.Absence;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.Leave;
import com.kh.nullcompany.approval.model.vo.Resign;
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

	@Override
	public Document approvalDetail(String docNo) {
		return aDao.approvalDetail(docNo);
	}

	@Override
	public Leave selectLeaveInfo(String docTempNo) {
		return aDao.selectLeaveInfo(docTempNo);
	}

	@Override
	public Absence selectAbsenceInfo(String docTempNo) {
		return aDao.selectAbsenceInfo(docTempNo);
	}

	@Override
	public Resign selectResignInfo(String docTempNo) {
		return aDao.selectResignInfo(docTempNo);
	}

	@Override
	public int stepSigning(String docTempNo, int memNo) {
		return aDao.stepSigning(docTempNo, memNo);
	}

	@Override
	public int documentSigning(String docTempNo, int stepPriority) {
		return aDao.documentSigning(docTempNo, stepPriority);
	}

	@Override
	public int decisionSigning(String docTempNo, int stepPriority) {
		return aDao.decisionSigning(docTempNo, stepPriority);
	}

	@Override
	public int stepRejecting(String docTempNo, int memNo) {
		return aDao.stepRejecting(docTempNo, memNo);
	}

	@Override
	public int decisionRejecting(String docTempNo, int stepListCount) {
		return aDao.decisionRejecting(docTempNo, stepListCount);
	}

	@Override
	public int stepReference(String docTempNo, int memNo) {
		return aDao.stepReference(docTempNo, memNo);
	}

	@Override
	public int decisionReference(String docTempNo) {
		return aDao.decisionReference(docTempNo);
	}
}
