package com.kh.nullcompany.notice.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.notice.model.vo.ncomment;
import com.kh.nullcompany.notice.model.vo.notice;
import com.kh.nullcompany.notice.model.vo.tnotice;

public interface noticeService {

	
	/**
	 * 1_1. 게시판 총 갯수 조회
	 * @return
	 */
	int getListCount();

	/**
	 * 2. 사내공지 리스트 조회
	 * @param pi
	 * @return
	 */
	ArrayList<notice> selectListNotice(PageInfo pi);

	/**
	 * 3. 게시판 상세 조회
	 * @param nNo
	 * @return
	 */
	notice selectNotice(int nNo);

	
	/**
	 * 댓글 관련
	 * @param nNo
	 * @return
	 */
	ArrayList<ncomment> selectnCommentList(int nNo);

	int insertnComment(ncomment c);

	int insertNotice(notice n);

	notice selectUpdateNotice(int nNo);



	int ndelete(int nNo);


	ArrayList<notice> noticeList();


	int updateNotice(notice n);

	int deleteNotice(int nNo);

	ArrayList<notice> searchnTitle(Map map);

	ArrayList<notice> searchnWriter(Map map);

	ArrayList<notice> searchnContent(Map map);

	ArrayList<notice> searchntitleContent(Map map);

}
