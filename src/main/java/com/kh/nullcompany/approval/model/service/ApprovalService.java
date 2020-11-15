package com.kh.nullcompany.approval.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.approval.model.vo.Document;
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
	 * 1_2. 진행 중인 문서 --------> 게시판 리스트 조회
	 * @param memNo 
	 * @param pi
	 * @return
	 */
	ArrayList<Document> selectProgressAllList(int memNo, PageInfo pi);

	/**
	 * 1_3. 진행 중인 문서 -----> 게시판 스텝 조회(리스트 상태값 뽑기)
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
	 * 2_2. 문서함 ------> 게시판 리스트 조회 
	 * @param memNo
	 * @param pi
	 * @return
	 */
	ArrayList<Document> selectCompleteAllList(int memNo, PageInfo pi);

	/**
	 * 3_1. 문서 한 개 정보 가져오기
	 * @param docNo
	 * @return
	 */
	Document approvalDetail(String docNo);

}
