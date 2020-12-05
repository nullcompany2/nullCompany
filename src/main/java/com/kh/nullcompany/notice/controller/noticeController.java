package com.kh.nullcompany.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.notice.model.service.noticeService;
import com.kh.nullcompany.notice.model.service.tnoticeService;
import com.kh.nullcompany.notice.model.vo.ncomment;
import com.kh.nullcompany.notice.model.vo.notice;
import com.kh.nullcompany.notice.model.vo.tnotice;

@Controller
public class noticeController {


	@Autowired
	private noticeService nService;
	private tnoticeService tService;

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

	@RequestMapping("nwrite.do")
	public String insertNotice(notice n,HttpServletRequest request,
			@RequestParam(name="uploadFile",required=false)MultipartFile file) {
	
		
		System.out.println(n);
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file,request); 

			if(renameFileName != null) { 
				n.setOriginalFileName(file.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		} 

		int result = nService.insertNotice(n);

		if(result > 0) {
			
			return "redirect:notice.do";
		}else {
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath); 
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String originalFileName = file.getOriginalFilename(); 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
								+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName; 
		try {
			file.transferTo(new File(renamePath)); 
		}catch(Exception e) {
			System.out.println("파일 전송 에러: " + e.getMessage());
		}
		return renameFileName;
	}

	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="noticeList.do",produces="application/json; charset=utf-8")
	public String noticeList() throws JsonProcessingException {
		ArrayList<notice> list = nService.noticeList();
		
		ObjectMapper mapper = new ObjectMapper();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		mapper.setDateFormat(sdf);
		
		String jsonStr = mapper.writeValueAsString(list);
		
		return jsonStr;
	}
	
	
	@RequestMapping("nupView.do")
	public ModelAndView noticeDeatil(ModelAndView mv, int nNo) {
		mv.addObject("n", nService.selectUpdateNotice(nNo)).setViewName("board/nupView");
		return mv;
	}
			
	@RequestMapping("nupdate.do")
	public ModelAndView noticeUpdate(ModelAndView mv,notice n,
					HttpServletRequest request, 
					@RequestParam(value="reloadFile", required=false) MultipartFile  file) {
		if(file != null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면
			if(n.getRenameFileName() != null) { // 기존의 파일이 존재했을 경우 기존 파일을 삭제해준다.
				deleteFile(n.getRenameFileName(),request); 
			}
			
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				n.setOriginalFileName(file.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}
		
		int result = nService.updateNotice(n);

		if(result > 0) {
			mv.addObject("nNo", n.getnNo()).setViewName("redirect:ndetail.do");
		}else {
			mv.addObject("msg","수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("ndelete.do")
	public String noticeDelete(int nNo, HttpServletRequest request) {
		notice n = nService.selectUpdateNotice(nNo);
		
		if(n.getRenameFileName() != null) {
			deleteFile(n.getRenameFileName(),request);
		}
		
		int result = nService.deleteNotice(nNo);
		
		if(result > 0) {
			return "redirect:notice.do";
		}else {
			return "common/errorPage";
		}
	}
	
	// 검색하기 
	@RequestMapping("searchNotice.do")
	public ModelAndView searchNotice(ModelAndView mv, String category, String search,HttpSession session) {
	
		String memId = ((Member)session.getAttribute("loginUser")).getId();
	
	Map map = new HashMap();
	
	map.put("search",search);
	map.put("memId",memId);
	
	if(category.equals("제목")) {
	ArrayList<notice> list = nService.searchnTitle(map);
	mv.addObject("list",list);
	}else if(category.equals("글쓴이")){
	ArrayList<notice> list = nService.searchnWriter(map);
	mv.addObject("list",list);
	}else if(category.equals("내용")) {
		ArrayList<notice> list = nService.searchnContent(map);
		mv.addObject("list",list);
	}else if(category.equals("제목내용")) {
		ArrayList<notice> list = nService.searchntitleContent(map);
		mv.addObject("list",list);
	}
	
	mv.addObject("search",search);
	mv.setViewName("board/searchNotice");
	return mv;
	}

}
