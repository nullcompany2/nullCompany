package com.kh.nullcompany.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.board.model.service.boardService;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.bcomment;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.board.model.vo.bcomment;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.notice.model.vo.ncomment;
import com.kh.nullcompany.notice.model.vo.notice;



@Controller
public class boardController {

	@Autowired
	private boardService bService;


	// 글쓰기로 보내주는 컨트롤러 
	@RequestMapping("write.do")
	public String write(HttpServletResponse response){
		return "board/write";
	}

	// 임시보관함으로 보내주는 컨트롤러 
	@RequestMapping("save.do")
	public String save(HttpServletResponse response){
		return "board/save";
	}

	// 임시보관함으로 보내주는 컨트롤러 
	@RequestMapping("goSave.do")
	public String goSave(HttpServletResponse response){
		return "board/sagoSaveve";
	}

	// 자유게시판으로 보내주는 컨트롤러 
	@RequestMapping("board.do")
	public ModelAndView board(ModelAndView mv, 
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {

		int listCount = bService.getListCount();

		// 페이지네이션 부분
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<board> list = bService.selectListBoard(pi);

		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("board/board");

		return mv;
	}

	// 게시판 디테일
	@RequestMapping("bdetail.do")
	public ModelAndView bdetail(ModelAndView mv,int bNo,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {

		board b = bService.selectBoard(bNo);

		if(b != null) {
			mv.addObject("b", b)
			.addObject("currentPage", currentPage).setViewName("board/bdetail");
		}else {
			mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("bcList.do")
	public void getbCommentList(HttpServletResponse response, int bNo) throws JsonIOException, IOException {
		ArrayList<bcomment> bcList = bService.selectbCommentList(bNo);

		response.setContentType("application/json; charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(bcList,response.getWriter());

	}

	@ResponseBody
	@RequestMapping("addbComment.do")
	public String addbComment(bcomment c) {

		int result = bService.insertbComment(c);

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

}