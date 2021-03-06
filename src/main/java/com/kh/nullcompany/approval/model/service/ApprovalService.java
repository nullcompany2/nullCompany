package com.kh.nullcompany.approval.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.approval.model.vo.Absence;
import com.kh.nullcompany.approval.model.vo.DeptList;
import com.kh.nullcompany.approval.model.vo.DivDeptStaff;
import com.kh.nullcompany.approval.model.vo.Document;
import com.kh.nullcompany.approval.model.vo.Leave;
import com.kh.nullcompany.approval.model.vo.Resign;
import com.kh.nullcompany.approval.model.vo.Step;
import com.kh.nullcompany.board.model.vo.PageInfo;

public interface ApprovalService {
	
	// 1. 게시판 전체 리스트 조회
	
	/**
	 * 1_1. 진행중인 문서/전체 --> 게시글 갯수 조회
	 * @param memNo 
	 * @return
	 */
	int getProgressAllListCount(int memNo);

	/**
	 * 1_2. 진행 중인 문서 --------> 게시판 리스트 조회(페이징처리)
	 * @param memNo 
	 * @param pi
	 * @return
	 */
	ArrayList<Document> selectProgressAllList(int memNo, PageInfo pi);

	
	/**
	 * 1_3. 진행 중인 문서 --------> 게시판 리스트 조회(페이징 처리 안함)
	 * @param memNo
	 * @return
	 */
	ArrayList<Document> selectProgressAllList(int memNo);
	
	/**
	 * 1_4. 게시판 스텝 조회(리스트 상태값 뽑기)
	 * @param memNo
	 * @param docTempNo
	 * @return
	 */
	ArrayList<Step> selectStepList(String docTempNo);

	/**
	 * 2_1. 문서함/전체 ----> 문서함 갯수 조회 
	 * @param memNo
	 * @return
	 */
	int getCompleteAllListCount(int memNo);

	/**
	 * 2_2. 문서함 ------> 게시판 리스트 조회(페이징처리) 
	 * @param memNo
	 * @param pi
	 * @return
	 */
	ArrayList<Document> selectCompleteAllList(int memNo, PageInfo pi);
	
	/**
	 * 2_3. 문서함 ------> 게시판 리스트 조회(페이징처리 안함) 
	 * @param memNo
	 * @return
	 */
	ArrayList<Document> selectCompleteAllList(int memNo);

	/**
	 * 3_1. 문서 한 개 정보 가져오기
	 * @param docNo
	 * @return
	 */
	Document approvalDetail(String docNo);

	/**
	 * 3_2 휴가 문서 정보 가져오기
	 * @param docTempNo
	 * @return
	 */
	Leave selectLeaveInfo(String docTempNo);

	/**
	 * 3_3 휴직 문서 정보 가져오기
	 * @param docTempNo
	 * @return
	 */
	Absence selectAbsenceInfo(String docTempNo);

	/**
	 * 3_4 사직서 정보 가져오기
	 * @param docTempNo
	 * @return
	 */
	Resign selectResignInfo(String docTempNo);

	/**
	 * 4_1 결재하기(스텝 상태값 변경)
	 * @param docTempNo
	 * @param memNo
	 * @return
	 */
	int stepSigning(String docTempNo, int memNo);

	/**
	 * 4_2 결재하기(문서 상태값 변경)
	 * @param docTempNo
	 * @param stepPriority 
	 * @return
	 */
	int documentSigning(String docTempNo, int stepPriority);

	/**
	 * 4_3 최종 결재하기(문서 상태값 변경)
	 * @param docTempNo
	 * @param stepPriority
	 * @return
	 */
	int decisionSigning(String docTempNo, int stepPriority);

	/**
	 * 4_4 반려하기(스텝 상태값 변경)
	 * @param docTempNo
	 * @param memNo
	 * @return
	 */
	int stepRejecting(String docTempNo, int memNo);

	/**
	 * 4_5 최종 반려하기(문서 상태값 변경)
	 * @param docTempNo
	 * @param stepListCount
	 * @return
	 */
	int decisionRejecting(String docTempNo, int stepListCount);

	/**
	 * 4_6 확인하기(스텝 상태값 변경)
	 * @param docTempNo
	 * @param memNo
	 * @return
	 */
	int stepReference(String docTempNo, int memNo);

	/**
	 * 4_7 회람문서 최종 확인하기(문서 상태값 변경)
	 * @param docTempNo
	 * @return
	 */
	int decisionReference(String docTempNo);

	/**
	 * 5_1 임시 문서 넣기(결재선 설정을 위한 작업)
	 * @param d
	 * @return
	 */
	int insertTempDocument(Document d);

	/**
	 * 6_1 결재선 모든 부서정보 가져오기
	 * @return
	 */
	ArrayList<DeptList> selectAllDept();

	/**
	 * 6_2 부서별 사원정보 가져오기
	 * @param deptNo
	 * @param docTempNo
	 * @return
	 */
	ArrayList<DivDeptStaff> selectDeptStaff(int deptNo, String docTempNo);

	/**
	 * 6_3 문서 하나의 포함된 결재자 수 가져오기
	 * @param s
	 * @return
	 */
	int apprStepListCount(Step s);

	/**
	 * 6_4 결재자 등록하기
	 * @param s
	 * @return
	 */
	int apprStepInsert(Step s);

	/**
	 * 6_5 등록한 사원 정보 가져오기
	 * @param s
	 * @return
	 */
	Step currentStepInfo(Step s);

	/**
	 * 6_6 참조자,수신자 등록하기
	 * @param s
	 * @return
	 */
	int notApprStepInsert(Step s);

	/**
	 * 6_7 스텝 삭제하기
	 * @param docTempNo
	 * @param staffNo
	 * @return
	 */
	int deleteStep(String docTempNo, int staffNo);

	/**
	 * 7_1 문서 기안하기
	 * @param d
	 * @return
	 */
	int insertDocument(Document d);

	/**
	 * 7_2 스텝 삭제
	 * @param docTempNo
	 * @return
	 */
	int omitStep(String docTempNo);

	/**
	 * 7_3 문서 삭제
	 * @param docTempNo
	 * @return
	 */
	int omitDocument(String docTempNo);

	/**
	 * 7_4 휴가 정보 기록하기(디테일에서 보여줄 내용)
	 * @param l
	 * @return
	 */
	int insertLeaveInfo(Leave l);

	/**
	 * 7_5 휴가 관리용 데이터 입력하기
	 * @param drafterNo
	 * @param typeNo
	 * @param startDate
	 * @param totalDate
	 * @param docTempNo
	 * @return
	 */
	int recordingLeave(int drafterNo, int typeNo, String startDate, int totalDate, String reason, String docTempNo);

	/**
	 * 7_6 휴가 관리용 데이터 업데이트(결재완료)
	 * @param docTempNo
	 * @return
	 */
	int completeRecordingLeave(String docTempNo);

	/**
	 * 7_7 휴가 관리용 데이터 업데이트(반려)
	 * @param docTempNo
	 * @return
	 */
	int rejectRecodingLeave(String docTempNo);

	/**
	 * 7_8 휴직 정보 기록하기(디테일에서 보여줄 내용) 
	 * @param a
	 * @return
	 */
	int insertAbsenceInfo(Absence a);

	/**
	 * 7_9 휴직 관리용 데이터 입력하기
	 * @param drafterNo
	 * @param startDate
	 * @param reason
	 * @return
	 */
	int recordingAbsence(int drafterNo, String startDate, String reason);

	/**
	 * 7_10 사직 정보 기록하기(디테일에서 보여줄 내용)
	 * @param r
	 * @return
	 */
	int insertResignInfo(Resign r);

	/**
	 * 8_1 부서별 전체 문서 리스트 갯수
	 * @param deptNo
	 * @return
	 */
	int getAdminAllListCount(int deptNo);

	/**
	 * 8_2 부서별 전체 문서 리스트
	 * @param deptNo
	 * @param pi
	 * @return
	 */
	ArrayList<Document> selectAdminAllList(int deptNo, PageInfo pi);

	/**
	 * 8_3 부서별 삭제 문서 리스트 갯수
	 * @param deptNo
	 * @return
	 */
	int getAdminDeleteListCount(int deptNo);

	/**
	 * 8_4 부서별 삭제 문서 리스트
	 * @param deptNo
	 * @param pi
	 * @return
	 */
	ArrayList<Document> selectAdminDeleteList(int deptNo, PageInfo pi);

	/**
	 * 9_1 문서 삭제하기(update)
	 * @param docTempNo
	 * @return
	 */
	int deleteDocument(String docTempNo);

	/**
	 * 9_2 문서 복원하기(update)
	 * @param docTempNo
	 * @return
	 */
	int restoreDocument(String docTempNo);

	/**
	 * 9_3 휴가 정보 삭제하기
	 * @param docTempNo
	 * @return
	 */
	int omitLeaveInfo(String docTempNo);

	/**
	 * 9_4 휴가 기록 삭제하기
	 * @param docTempNo
	 * @return
	 */
	int omitLeaveRecord(String docTempNo);

	/**
	 * 9_5 휴직 정보 삭제하기
	 * @param docTempNo
	 * @return
	 */
	int omitAbsenceInfo(String docTempNo);

	/**
	 * 9_6 사직 정보 삭제하기
	 * @param docTempNo
	 * @return
	 */
	int omitResignInfo(String docTempNo);

	/**
	 * 10_1 문서에 등록된 스텝들 낮은 직급부터 조회 
	 * @param docTempNo
	 * @return
	 */
	ArrayList<Step> orderByStepRank(String docTempNo);

	/**
	 * 10_2 문서 기안 전 직급 순으로 스텝 정렬
	 * @param staffNo
	 * @param stepPriority
	 * @param docTempNo
	 * @return
	 */
	int sortingStep(int staffNo, int stepPriority, String docTempNo);

}
