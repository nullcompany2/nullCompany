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
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.board.model.vo.comment;
import com.kh.nullcompany.common.Pagination;



@Controller
public class boardController {

   @Autowired
   private boardService bService;


   // 게시판 메인 리스트(중요게시물보기)로 보내주는 컨트롤러 
   @RequestMapping("boardList.do")
   public ModelAndView boardList(ModelAndView mv, 
         @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
      System.out.println(currentPage);
      
      int listCount = bService.getListCount();
      System.out.println(listCount);
      
      // 페이지네이션 부분
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<board> list = bService.selectListImport(pi);
      
      mv.addObject("list",list);
      mv.addObject("pi",pi);
      mv.setViewName("board/boardList");
      
      return mv;
   }
   
   
   // 사내공지로 보내주는 컨트롤러 
   @RequestMapping("boardAll.do")
   public ModelAndView boardListAll(ModelAndView mv, 
         @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
      System.out.println(currentPage);
      
      int listCount = bService.getListCount();
      System.out.println(listCount);
      
      // 페이지네이션 부분
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<board> list = bService.selectListAll(pi);
      
      mv.addObject("list",list);
      mv.addObject("pi",pi);
      mv.setViewName("board/boardAll");
      
      return mv;
   }
   
   
   // 팀내공지로 보내주는 컨트롤러 
   @RequestMapping("boardTeam.do")
   public ModelAndView boardListTeam(ModelAndView mv, 
         @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
      System.out.println(currentPage);
      
      int listCount = bService.getListCount();
      System.out.println(listCount);
      
      // 페이지네이션 부분
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<board> list = bService.selectListTeam(pi);
      
      mv.addObject("list",list);
      mv.addObject("pi",pi);
      mv.setViewName("board/boardTeam");
      
      return mv;
   }
   // 자유게시판으로 보내주는 컨트롤러 
   @RequestMapping("boardFree.do")
   public ModelAndView boardListFree(ModelAndView mv, 
         @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
      System.out.println(currentPage);
      
      int listCount = bService.getListCount();
      System.out.println(listCount);
      
      // 페이지네이션 부분
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<board> list = bService.selectListFree(pi);
      
      mv.addObject("list",list);
      mv.addObject("pi",pi);
      mv.setViewName("board/boardFree");
      
      return mv;
   }
   
   // 게시판 디테일
      @RequestMapping("boardDetail.do")
      public ModelAndView boardDetail(ModelAndView mv,int bNo,
            @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
         
         board b = bService.selectBoard(bNo);
         
         if(b != null) {
            mv.addObject("b", b)
            .addObject("currentPage", currentPage).setViewName("board/boardDetail");
         }else {
            mv.addObject("msg", "게시글 상세조회 실패").setViewName("common/errorPage");
         }
         return mv;
      }
   
   // 게시판쓰기로 보내주는 컨트롤러 
         @RequestMapping("boardWrite.do")
         public String boardWriter(HttpServletResponse response) throws IOException {
            return "board/writeBoard";
         }
   // 일단 임시저장 완료 페이지로 보내주는 컨트롤러 
   @RequestMapping("saveBoard.do")
   public String saveBoard(HttpServletResponse response) throws IOException {
      return "board/saveBoard";
   }
   
   // 임시저장 완료 페이지로 보내주는 컨트롤러 
      @RequestMapping("boardSave.do")
      public String boardSave(HttpServletResponse response) throws IOException {
         return "board/boardSave";
      }

      @RequestMapping("cList.do")
      public void getCommentList(HttpServletResponse response, int bNo) throws JsonIOException, IOException {
         ArrayList<comment> cList = bService.selectCommentList(bNo);
         
         response.setContentType("application/json; charset=utf-8");
         
         Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
         gson.toJson(cList,response.getWriter());
         
      }
      
      @ResponseBody
      @RequestMapping("addComment.do")
      public String addComment(comment c) {
         
         int result = bService.insertComment(c);
         
         if(result > 0) {
            return "success";
         }else {
            return "fail";
         }
      }

}