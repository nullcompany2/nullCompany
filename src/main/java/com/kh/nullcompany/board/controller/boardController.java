package com.kh.nullcompany.board.controller;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.board.model.service.boardService;
import com.kh.nullcompany.board.model.vo.PageInfo;
import com.kh.nullcompany.board.model.vo.bcomment;
import com.kh.nullcompany.board.model.vo.board;
import com.kh.nullcompany.board.model.vo.bcomment;
import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.member.model.vo.Member;
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
	
	@RequestMapping("bwrite.do")
	public String insertNotice(board b,HttpServletRequest request,
			@RequestParam(name="uploadFile",required=false)MultipartFile file) {
	
		
		System.out.println(b);
		
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드 진행
			// saveFile메소드 : 저장하고자하는 file과 request를 전달해서 서버에 업로드시키고 저장된 파일명을 반환해주는 메소드
			String renameFileName = saveFile(file,request); 

			if(renameFileName != null) { // 파일이 잘 저장된 경우
				b.setOriginalFileName(file.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		} 

		int result = bService.insertBoard(b);

		if(result > 0) {
			
			return "redirect:board.do";
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
	
	@RequestMapping("bupView.do")
	public ModelAndView boardDetail(ModelAndView mv, int bNo) {
		mv.addObject("b", bService.selectUpdateBoard(bNo)).setViewName("board/bupView");
		return mv;
	}
			
	@RequestMapping("bupdate.do")
	public ModelAndView boardUpdate(ModelAndView mv,board b,
					HttpServletRequest request, 
					@RequestParam(value="reloadFile", required=false) MultipartFile  file) {
		if(file != null && !file.isEmpty()) { // 새로 업로드된 파일이 있다면
			if(b.getRenameFileName() != null) { // 기존의 파일이 존재했을 경우 기존 파일을 삭제해준다.
				deleteFile(b.getRenameFileName(),request); 
			}
			
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				b.setOriginalFileName(file.getOriginalFilename());
				b.setRenameFileName(renameFileName);
			}
		}
		
		int result = bService.updateBoard(b);

		if(result > 0) {
			mv.addObject("bNo", b.getbNo()).setViewName("redirect:bdetail.do");
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
	
	@RequestMapping("bdelete.do")
	public String boardDelete(int bNo, HttpServletRequest request) {
		board b = bService.selectUpdateBoard(bNo);
		
		if(b.getRenameFileName() != null) {
			deleteFile(b.getRenameFileName(),request);
		}
		
		int result = bService.deleteBoard(bNo);
		
		if(result > 0) {
			return "redirect:board.do";
		}else {
			return "common/errorPage";
		}
	}
	
	// 검색하기 
		@RequestMapping("searchBoard.do")
		public ModelAndView searchBoard(ModelAndView mv, String category, String search,HttpSession session) {
		
			String memId = ((Member)session.getAttribute("loginUser")).getId();
		
		Map map = new HashMap();
		
		map.put("search",search);
		map.put("memId",memId);
		
		if(category.equals("제목")) {
		ArrayList<board> list = bService.searchbTitle(map);
		mv.addObject("list",list);
		}else if(category.equals("글쓴이")){
		ArrayList<board> list = bService.searchbWriter(map);
		mv.addObject("list",list);
		}else if(category.equals("내용")) {
			ArrayList<board> list = bService.searchbContent(map);
			mv.addObject("list",list);
		}else if(category.equals("제목내용")) {
			ArrayList<board> list = bService.searchbtitleContent(map);
			mv.addObject("list",list);
		}
		
		mv.addObject("search",search);
		mv.setViewName("board/searchBoard");
		return mv;
		}
	

}