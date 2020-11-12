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
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.notice.model.service.tnoticeService;
import com.kh.nullcompany.notice.model.vo.tcomment;
import com.kh.nullcompany.notice.model.vo.tnotice;

@Controller
public class tnoticeController {
	
	@Autowired
	private tnoticeService tService;
	
	// 팀내공지로 보내주는 컨트롤러 
	   @RequestMapping("tnotice.do")
	   public ModelAndView tnotice(ModelAndView mv, 
	         @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
	      
	      int listCount = tService.getListCount();
	      
	      // 페이지네이션 부분
	      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	      
	      ArrayList<tnotice> list = tService.selectListtNotice(pi);
	      
	      mv.addObject("list",list);
	      mv.addObject("pi",pi);
	      mv.setViewName("board/tnotice");
	      
	      return mv;
	   }
	   
	   // 게시판 디테일
	      @RequestMapping("tdetail.do")
	      public ModelAndView tdetail(ModelAndView mv,int tNo,
	            @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
	         
	         tnotice t = tService.selecttNotice(tNo);
	         
	         if(t != null) {
	            mv.addObject("t", t)
	            .addObject("currentPage", currentPage).setViewName("board/tdetail");
	         }else {
	            mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
	         }
	         return mv;
	      }
	      
	      @RequestMapping("tcList.do")
	      public void gettCommentList(HttpServletResponse response, int tNo) throws JsonIOException, IOException {
	         ArrayList<tcomment> tcList = tService.selecttCommenList(tNo);
	         
	         response.setContentType("application/json; charset=utf-8");
	         
	         Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	         gson.toJson(tcList,response.getWriter());
	         
	      }
	      
	      @ResponseBody
	      @RequestMapping("addtComment.do")
	      public String addtComment(tcomment c) {
	         
	         int result = tService.inserttComment(c);
	         
	         if(result > 0) {
	            return "success";
	         }else {
	            return "fail";
	         }
	      }
}
