package com.kh.nullcompany.mail.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.mail.model.service.MailService;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.mail.model.vo.SaveMail;
import com.kh.nullcompany.member.controller.MemberController;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.board.model.vo.PageInfo;

@SessionAttributes("loginUser")	
@Controller
public class MailController {

@Autowired
private MailService maService;


		// 메일쓰기로 보내주는 컨트롤러 
		@RequestMapping("mailWrite.do")
		public String mailWrite(HttpServletResponse response){
			return "mail/writeMail";
		}
		

		// 받은 메일함 리스트
		@RequestMapping("recieveMail.do")
		public ModelAndView reciveMailList(ModelAndView mv, HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		

			int listCount = maService.getListCount(memNo);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.selectMailReceiveList(pi,memNo);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/receiveMailList");
			
			return mv;
		}
		
		// 답장 - > 임시저장 클릭 // 임시저장 테이블에 인서트  
		@RequestMapping("gosaveMail.do")
		public ModelAndView mailgosave(ModelAndView mv, Mail ma,HttpServletRequest request,
				@RequestParam(value="uploadPhoto",required=false)MultipartFile file) {
			
				String [] recipientArr = ma.getRecipient().split("<");
				String [] recipientArr2 = recipientArr[1].split(">");
				
				String [] senderArr = ma.getSender().split("<");
				String [] senderArr2 = senderArr[1].split(">");
				
				ma.setRecipient(recipientArr2[0]);
				ma.setSender(senderArr2[0]);
			
			
			if(!file.getOriginalFilename().equals("")) {

	         String mailFile = saveMailFile(file,request);
	         
	         if(mailFile != null) { 
	            ma.setmFileName(mailFile);
	          }
			}
			
			int result = maService.saveMail(ma);
			
			if(result > 0 ) {
				mv.setViewName("mail/gosaveMail");	
			}else {
				mv.addObject("msg", "회원가입에 실패하였습니다.");
				mv.setViewName("common/errorPage");	
			}
			 return mv;
		}
		
		// 파일 저장 메소드 
		public String saveMailFile(MultipartFile file, HttpServletRequest request) {
		     
		      String root = request.getSession().getServletContext().getRealPath("resources");
		      System.out.println(root);
		      
		      
		      //String savePath = root + "/muploadFiles"; 와 같음 
		      String savePath = root + File.separator +"/mailUploadFiles";
		      File folder = new File(savePath); // savePath의 폴더를 불러온다.
		      
		      if(!folder.exists()) {
		         // 폴더를 만들고 
		         folder.mkdirs();
		      }
		      
		      String mailFile = file.getOriginalFilename(); // test.png

		      String fileSavePath = folder + File.separator + mailFile;
		      
		      System.out.println(mailFile);
		      System.out.println(fileSavePath);
		      try {
		    	  file.transferTo(new File(fileSavePath));
		      }catch(Exception e) {
		    	  System.out.println("파일 전송 에러 : " + e.getMessage());
		      }
		      return "resources/mailUploadFiles/" + mailFile;

		   }			      
   // 일단 메일 전송 버튼 누르면 넘어가는 페이지 컨트롤러  
	@RequestMapping("sendMail.do")
		public String mailsend(){
		return "mail/sendMail";
		}
	
	// 보낸 메일함 리스트 컨트롤러  
		@RequestMapping("sendMailList.do")
			public String mailSendList(HttpServletResponse response){
			return "mail/sendMailList";
			}
		
		// 임시보관함 리스트 가져오기   
		@RequestMapping("saveMailList.do")
		public ModelAndView mailSaveList(ModelAndView mv, HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		

			int listCount = maService.getListCount(memNo);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<SaveMail> list = maService. mailSaveList(pi,memNo);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/saveMailList");
			
			return mv;
		}
		
		// 메일 한개 보기 컨트롤러   
		@RequestMapping("maildetailView.do")
		public ModelAndView mailDetailView(ModelAndView mv,int mailNo){
			
			System.out.println(mailNo);
			Mail ma = maService.mailDetailView(mailNo);
			
			mv.addObject("ma",ma);
			mv.setViewName("mail/mailDetailView");
			return mv;
		}
		
		
		// 리스트 - 아이디 누르고 메일 쓰기 
		@RequestMapping("mailWriteId.do")
		public ModelAndView mailWriteId(ModelAndView mv,
				int senderNo){
			
			Member m = maService.mailWriteId(senderNo);
			System.out.println(m);
			System.out.println(senderNo);
			
			mv.addObject("m",m);
			mv.setViewName("mail/mailWriteId");
			
			return mv;
			
		}
		
		// 임시 보관함 메일 한개 보기
		@RequestMapping("saveDetailView.do")
		public ModelAndView saveDetailView( ModelAndView mv, int mailNo) {
			System.out.println(mailNo);
			SaveMail sma = maService.saveDetailView(mailNo);
			
			mv.addObject("ma",sma);
			mv.setViewName("mail/saveDetailView");
			
			return mv;
		}
		
		
		// 답장하기 
		@RequestMapping("mailReply.do")
		public ModelAndView mailReply(ModelAndView mv, int mailNo){
			
			System.out.println(mailNo);
			Mail ma = maService.mailReply(mailNo);
			
			mv.addObject("ma",ma);
			mv.setViewName("mail/replyMail");
			return mv;
		}
		
		@RequestMapping("readMail.do")
		public ModelAndView readMailList(ModelAndView mv, HttpServletResponse response,
				HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) throws IOException {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		

			int listCount = maService.getListCount(memNo);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.readMailList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/readMailList");
			
		return mv;
			
		}
		
		@RequestMapping("unReadMail.do")
		public ModelAndView unReadMailList(ModelAndView mv, HttpServletResponse response,
				HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) throws IOException {
			
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		

			int listCount = maService.getListCount(memNo);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.unReadMailList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/unReadMailList");
			
		return mv;
			
		}
		
		// 받은 메일함 리스트에서 삭제 버튼 눌렀을 때 전체삭제 
		@RequestMapping("allDelMail.do")
		public String allDelMail( HttpSession session, Model model){
		
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		

			int result = maService.allDelMail(memNo);
//			int upResult = maService.insertAllDelMail() 
			if(result > 0 ) {
				return "redirect:recieveMail.do";			
			}else {
				model.addAttribute("msg", "모든 컬럼 삭제 실패~");
				return "common/errorPage";
			}
			
		}
		
		@RequestMapping("RecieveMailbinList.do")
		public ModelAndView RecieveMailbinList(ModelAndView mv, 
				HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) throws IOException {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		

			int listCount = maService.getListCount(memNo);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.RecieveMailbinList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/deleteMailList");
			
		return mv;
			
		}
		
}

