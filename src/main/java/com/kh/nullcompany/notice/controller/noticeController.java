package com.kh.nullcompany.notice.controller;

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
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.notice.model.service.noticeService;
import com.kh.nullcompany.notice.model.vo.ncomment;
import com.kh.nullcompany.notice.model.vo.notice;

@Controller
public class noticeController {

	
	@Autowired
	private noticeService nService;
	
	 // 사내공지로 보내주는 컨트롤러 
	   @RequestMapping("notice.do")
	   public ModelAndView notice(ModelAndView mv, 
	         @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
	      
	      int listCount = nService.getListCount();
	      
	      // 페이지네이션 부분
	      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	      
	      ArrayList<notice> list = nService.selectListNotice(pi);
	      
	      mv.addObject("list",list);
	      mv.addObject("pi",pi);
	      mv.setViewName("board/notice");
	      
	      return mv;
	   }
	   
	   // 게시판 디테일
	      @RequestMapping("ndetail.do")
	      public ModelAndView ndetail(ModelAndView mv,int nNo,
	            @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
	         
	         notice n = nService.selectNotice(nNo);
	         
	         if(n != null) {
	            mv.addObject("n", n)
	            .addObject("currentPage", currentPage).setViewName("board/ndetail");
	         }else {
	            mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
	         }
	         return mv;
	      }
	      
	      @RequestMapping("ncList.do")
	      public void getnCommentList(HttpServletResponse response, int nNo) throws JsonIOException, IOException {
	         ArrayList<ncomment> ncList = nService.selectnCommentList(nNo);
	         
	         response.setContentType("application/json; charset=utf-8");
	         
	         Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	         gson.toJson(ncList,response.getWriter());
	         
	      }
	      
	      @ResponseBody
	      @RequestMapping("addnComment.do")
	      public String addnComment(ncomment c) {
	         
	         int result = nService.insertnComment(c);
	         
	         if(result > 0) {
	            return "success";
	         }else {
	            return "fail";
	         }
	      }
}
