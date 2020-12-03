package com.kh.nullcompany.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullcompany.approval.model.dao.ApprovalDao;
import com.kh.nullcompany.approval.model.vo.Absence;
import com.kh.nullcompany.approval.model.vo.DeptList;
import com.kh.nullcompany.approval.model.vo.DivDeptStaff;
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
	public ArrayList<Document> selectProgressAllList(int memNo) {
		return aDao.selectProgressAllList(memNo);
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
	public ArrayList<Document> selectCompleteAllList(int memNo) {
		return aDao.selectCompleteAllList(memNo);
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

	@Override
	public int insertTempDocument(Document d) {
		return aDao.insertTempDocument(d);
	}

	@Override
	public ArrayList<DeptList> selectAllDept() {
		return aDao.selectAllDept();
	}

	@Override
	public ArrayList<DivDeptStaff> selectDeptStaff(int deptNo, String docTempNo) {
		return aDao.selectDeptStaff(deptNo, docTempNo);
	}

	@Override
	public int apprStepListCount(Step s) {
		return aDao.apprStepListCount(s);
	}

	@Override
	public int apprStepInsert(Step s) {
		return aDao.apprStepInsert(s);
	}

	@Override
	public Step currentStepInfo(Step s) {
		return aDao.currentStepInfo(s);
	}

	@Override
	public int notApprStepInsert(Step s) {
		return aDao.notApprStepInsert(s);
	}

	@Override
	public int deleteStep(String docTempNo, int staffNo) {
		return aDao.deleteStep(docTempNo, staffNo);
	}

	@Override
	public int insertDocument(Document d) {
		return aDao.insertDocument(d);
	}

	@Override
	public int omitStep(String docTempNo) {
		return aDao.omitStep(docTempNo);
	}

	@Override
	public int omitDocument(String docTempNo) {
		return aDao.omitDocument(docTempNo);
	}

	@Override
	public int insertLeaveInfo(Leave l) {
		return aDao.insertLeaveInfo(l);
	}

	@Override
	public int recordingLeave(int drafterNo, int typeNo, String startDate, int totalDate, String reason, String docTempNo) {
		return aDao.recordingLeave(drafterNo, typeNo, startDate, totalDate, reason, docTempNo);
	}

	@Override
	public int completeRecordingLeave(String docTempNo) {
		return aDao.completeRecordingLeave(docTempNo);
	}

	@Override
	public int rejectRecodingLeave(String docTempNo) {
		return aDao.rejectRecodingLeave(docTempNo);
	}

	@Override
	public int insertAbsenceInfo(Absence a) {
		return aDao.insertAbsenceInfo(a);
	}

	@Override
	public int recordingAbsence(int drafterNo, String startDate, String reason) {
		return aDao.recordingAbsence(drafterNo, startDate, reason);
	}

	@Override
	public int insertResignInfo(Resign r) {
		return aDao.insertResignInfo(r);
	}

	@Override
	public int getAdminAllListCount(int deptNo) {
		return aDao.getAdminAllListCount(deptNo);
	}

	@Override
	public ArrayList<Document> selectAdminAllList(int deptNo, PageInfo pi) {
		return aDao.selectAdminAllList(deptNo, pi);
	}

	@Override
	public int getAdminDeleteListCount(int deptNo) {
		return aDao.getAdminDeleteListCount(deptNo);
	}

	@Override
	public ArrayList<Document> selectAdminDeleteList(int deptNo, PageInfo pi) {
		return aDao.selectAdminDeleteList(deptNo, pi);
	}

	@Override
	public int deleteDocument(String docTempNo) {
		return aDao.deleteDocument(docTempNo);
	}

	@Override
	public int restoreDocument(String docTempNo) {
		return aDao.restoreDocument(docTempNo);
	}

	@Override
	public int omitLeaveInfo(String docTempNo) {
		return aDao.omitLeaveInfo(docTempNo);
	}

	@Override
	public int omitLeaveRecord(String docTempNo) {
		return aDao.omitLeaveRecord(docTempNo);
	}

	@Override
	public int omitAbsenceInfo(String docTempNo) {
		return aDao.omitAbsenceInfo(docTempNo);
	}

	@Override
	public int omitResignInfo(String docTempNo) {
		return aDao.omitResignInfo(docTempNo);
	}

}
