package com.kh.nullcompany.board.model.service;

import java.util.ArrayList;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;

public interface boardService {

	
	
	
	/**
	 * 1_1. 게시판 총 갯수 조회
	 * @return
	 */
	int getListCount();

	/**
	 * 1_2. 중요게시판 리스트 조회
	 * @param pi 
	 * @return
	 */
	ArrayList<board> selectListImport(PageInfo pi);

	/**
	 * 1_3. 사내공지 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<board> selectListAll(PageInfo pi);

	/**
	 * 1_4. 팀내공지 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<board> selectListTeam(PageInfo pi);

	/**
	 * 1_5. 자유게시판 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<board> selectListFree(PageInfo pi);

	/**
	 * 2. 게시판 상세조회
	 * @param bId
	 * @return
	 */
	board selectBoard(int bNo);
	
	
	
	
	

}
