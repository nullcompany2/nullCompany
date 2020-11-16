package com.kh.nullcompany.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.board.model.vo.PageInfo;
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

	@RequestMapping("writer.do")
	public String insertNotice(notice n,HttpServletRequest request,
			@RequestParam(name="uploadFile",required=false)MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			// 서버에 업로드 진행
			// saveFile메소드 : 저장하고자하는 file과 request를 전달해서 서버에 업로드시키고 저장된 파일명을 반환해주는 메소드
			String renameFileName = saveFile(file,request); 

			if(renameFileName != null) { // 파일이 잘 저장된 경우
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

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		// D:\H_PM\springWorkspace\springProject\src\main\webapp\resources\buploadFiles\20201005160703.jpg
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("nupdate.do")
	public ModelAndView boardUpdate(ModelAndView mv,notice n,
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
	
	@RequestMapping("ndelete.do")
	public String ndelete(int nNo, Model model) {
		
		
		int result = nService.ndelete(nNo);
		
		if(result > 0) {
			return "redirect:notice.do";
		}else {
			return "common/errorPage";
		}
	}





}
