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
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.notice.model.service.tnoticeService;
import com.kh.nullcompany.notice.model.vo.notice;
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

	@RequestMapping("twrite.do")
	public String inserttNotice(tnotice t,HttpServletRequest request,
			@RequestParam(name="uploadFile",required=false)MultipartFile file) {


		System.out.println(t);

		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드 진행
			// saveFile메소드 : 저장하고자하는 file과 request를 전달해서 서버에 업로드시키고 저장된 파일명을 반환해주는 메소드
			String renameFileName = saveFile(file,request); 

			if(renameFileName != null) { // 파일이 잘 저장된 경우
				t.setOriginalFileName(file.getOriginalFilename());
				t.setRenameFileName(renameFileName);
			}
		} 

		int result = tService.inserttNotice(t);

		if(result > 0) {

			return "redirect:tnotice.do";
		}else {
			return "common/errorPage";
		}
	}

	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하자
		// 웹 서버 contextPath를 불러와서 폴더의 경로를 가져온다.(webapp하위의 resources)
		// D:\H_PM\springWorkspace\springProject\src\main\webapp\resources
		String root = request.getSession().getServletContext().getRealPath("resources");

		// root 하위의 buploadFiles 폴더를 연결
		// \를 문자로 인식하기 위해서는 \\를 사용한다.
		// D:\H_PM\springWorkspace\springProject\src\main\webapp\resources\buploadFiles
		String savePath = root + "\\buploadFiles";

		File folder = new File(savePath); // savePath의 폴더를 불러온다.

		if(!folder.exists()) {
			// 폴더가 없으면 만들어라.
			folder.mkdirs();
		}

		// 원본 파일명을 년월일시분초.파일확장자명으로 변경
		String originalFileName = file.getOriginalFilename(); // test.png

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		//                      [       20200929191422.                                       ] 
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				//				 [       20200929191422.png      
				+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName; // 실제 저장될 파일 경로 + 파일명
		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이떄 서버에 저장이된다.
		}catch(Exception e) {
			System.out.println("파일 전송 에러: " + e.getMessage());
		}
		return renameFileName;
	}
	
	// 팀 공지 메인에 띄우기
	
		@ResponseBody
		@RequestMapping(value="tnoticeList.do",produces="application/json; charset=utf-8")
		public String tnoticeList() throws JsonProcessingException {
			ArrayList<tnotice> list = tService.tnoticeList();
			
			ObjectMapper mapper = new ObjectMapper();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			mapper.setDateFormat(sdf);
			
			String jsonStr = mapper.writeValueAsString(list);
			
			return jsonStr;
		}
		
		@RequestMapping("tupView.do")
		public ModelAndView tnoticeDeatil(ModelAndView mv, int tNo) {
			mv.addObject("t", tService.selectUpdatetNotice(tNo)).setViewName("board/tupView");
			return mv;
		}
				
		@RequestMapping("tupdate.do")
		public ModelAndView tnoticeUpdate(ModelAndView mv,tnotice t,
						HttpServletRequest request, 
						@RequestParam(value="reloadFile", required=false) MultipartFile  file) {
			if(file != null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면
				if(t.getRenameFileName() != null) { // 기존의 파일이 존재했을 경우 기존 파일을 삭제해준다.
					deleteFile(t.getRenameFileName(),request); 
				}
				
				String renameFileName = saveFile(file,request);
				
				if(renameFileName != null) {
					t.setOriginalFileName(file.getOriginalFilename());
					t.setRenameFileName(renameFileName);
				}
			}
			
			int result = tService.updatetNotice(t);

			if(result > 0) {
				mv.addObject("tNo", t.gettNo()).setViewName("redirect:tdetail.do");
			}else {
				mv.addObject("msg","수정 실패").setViewName("common/errorPage");
			}
			return mv;
		}
		
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\buploadFiles";
			// D:\H_PM\springWorkspace\springProject\src\main\webapp\resources\buploadFiles\20201005160703.jpg
			File f = new File(savePath + "\\" + fileName);
			
			if(f.exists()) {
				f.delete();
			}
		}
		
		@RequestMapping("tdelete.do")
		public String tnoticeDelete(int tNo, HttpServletRequest request) {
			tnotice t = tService.selectUpdatetNotice(tNo);
			
			if(t.getRenameFileName() != null) {
				deleteFile(t.getRenameFileName(),request);
			}
			
			int result = tService.deletetNotice(tNo);
			
			if(result > 0) {
				return "redirect:tnotice.do";
			}else {
				return "common/errorPage";
			}
		}
		
		// 검색하기 
		@RequestMapping("searchtNotice.do")
		public ModelAndView searchtNotice(ModelAndView mv, String category, String search,HttpSession session) {
		
			String memId = ((Member)session.getAttribute("loginUser")).getId();
		
		Map map = new HashMap();
		
		map.put("search",search);
		map.put("memId",memId);
		
		if(category.equals("제목")) {
		ArrayList<tnotice> list = tService.searchtTitle(map);
		mv.addObject("list",list);
		}else if(category.equals("글쓴이")){
		ArrayList<tnotice> list = tService.searchtWriter(map);
		mv.addObject("list",list);
		}else if(category.equals("내용")) {
			ArrayList<tnotice> list = tService.searchtContent(map);
			mv.addObject("list",list);
		}else if(category.equals("제목내용")) {
			ArrayList<tnotice> list = tService.searchttitleContent(map);
			mv.addObject("list",list);
		}
		
		mv.addObject("search",search);
		mv.setViewName("board/searchtNotice");
		return mv;
		}

}
