package com.kh.nullcompany.board.model.service;

import java.util.ArrayList;

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

	Object selectUpdateBoard(int bNo);

	int updateBoard(board b);













}