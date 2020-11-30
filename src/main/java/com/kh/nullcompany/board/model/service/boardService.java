package com.kh.nullcompany.board.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.bcomment;
import com.kh.nullcompany.board.model.vo.board;

public interface boardService {

	int getListCount();

	ArrayList<board> selectListBoard(PageInfo pi);

	board selectBoard(int bNo);

	ArrayList<bcomment> selectbCommentList(int bNo);

	int insertbComment(bcomment c);

	int insertBoard(board b);

	board selectUpdateBoard(int bNo);

	int updateBoard(board b);

	int deleteBoard(int bNo);

	ArrayList<board> searchbTitle(Map map);

	ArrayList<board> searchbWriter(Map map);

	ArrayList<board> searchbContent(Map map);

	ArrayList<board> searchbtitleContent(Map map);













}