package com.kh.nullcompany.logo.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullcompany.logo.model.service.LogoService;
import com.kh.nullcompany.logo.model.vo.Logo;
import com.kh.nullcompany.member.model.vo.Member;

@SessionAttributes("logo")	
@Controller
public class LogoController {
		
		@Autowired
		private LogoService lService;
		
		// 로고 등록 메소드 
		 @RequestMapping("logoUpload.do")
		   public String insertBoard(HttpServletRequest request,Model model,Logo l,HttpSession session,
		         @RequestParam(name="logoFile",required=false) MultipartFile file,String basic) {
		     
			 if(basic.equals("basic")) {
				 
				 l.setRenameLogo("resources/logoUploadFiles/20201128202837.png");
				 l.setLogo("LOGO_test.png");
				 
			 }else if(basic.equals("안녕")) {
				 
				 if(!file.getOriginalFilename().equals("")) {
					 // 서버에 업로드 진행
					 // saveFile메소드 : 저장하고자하는 file과 request를 전달해서 서버에 업로드시키고 저장된 파일명을 반환해주는 메소드
					 String logoFileName = saveFile(file,request);
					 
					 if(logoFileName != null) { // 파일이 잘 저장된 경우
						 l.setRenameLogo(logoFileName);
						 l.setLogo(file.getOriginalFilename());
						 
					 }
				 }
			 }
		      	int result = lService.logoUpload(l);
		        	
		      	if( result > 0) {
		        	return "redirect:home.do";	
		        	}else {
		        	model.addAttribute("msg", "로고 등록 실패~");
					return "common/errorPage";
		        	
		        	}
		   }
		   
		 // 로고를 서버에 저장해주는 메소드 
		   public String saveFile(MultipartFile file, HttpServletRequest request) {
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      
		      String savePath = root + File.separator+"logoUploadFiles";
		      
		      File folder = new File(savePath); // savePath의 폴더를 불러온다.
		      
		      if(!folder.exists()) {
		         folder.mkdirs();
		      }
		      
		      
		      String originalFileName = file.getOriginalFilename(); // test.png
		      
		      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		      //                      년월일시분초. 까지 
		      String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
		      //                      년월일시분초.확장자명 까지
		                        + originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		      
		      String renamePath = folder + File.separator + renameFileName;
		     // String renamePath = folder + "/" + renameFileName;  // 실제 저장될 파일 경로 + 파일명
		      
		      try {
		         file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 이때 서버에 저장이 된다.
		      }catch(Exception e) {
		         System.out.println("파일 전송 에러 : " + e.getMessage());
		      }
		      return "resources/logoUploadFiles/" + renameFileName;
		   }
}
