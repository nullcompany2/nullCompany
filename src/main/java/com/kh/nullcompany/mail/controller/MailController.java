package com.kh.nullcompany.mail.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.mail.model.service.MailService;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.member.controller.MemberController;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.board.model.vo.PageInfo;

@SessionAttributes("loginUser")	
@Controller
public class MailController {

@Autowired
private MailService maService;

//login
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	

	// 메일쓰기로 보내주는 컨트롤러 
		@RequestMapping("mailWrite.do")
		public String mailWrite(HttpServletResponse response){
			return "mail/writeMail";
		}
		

		// 받은 메일함 리스트
		@RequestMapping("recieveMail.do")
		public ModelAndView reciveMailList(ModelAndView mv, 
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
			
			
			int listCount = maService.getListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.selectMailReceiveList(pi);

			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/receiveMailList");
			
			return mv;
		}
		
	// 일단 임시저장 완료 페이지로 보내주는 컨트롤러 
		@RequestMapping("gosaveMail.do")
		public String mailgosave(HttpServletResponse response) {
		return "mail/gosaveMail";
		}
   // 일단 메일 전송 버튼 누르면 넘어가는 페이지 컨트롤러  
	@RequestMapping("sendMail.do")
		public String mailsend(HttpServletResponse response){
		return "mail/sendMail";
		}
	
	// 보낸 메일함 리스트 컨트롤러  
		@RequestMapping("sendMailList.do")
			public String mailSendList(HttpServletResponse response){
			return "mail/sendMailList";
			}
		
		// 임시보관함 리스트 컨트롤러  
		@RequestMapping("saveMailList.do")
		public String mailSaveList(HttpServletResponse response){
			return "mail/saveMailList";
		}
		// 메일 한개 보기 컨트롤러   
		@RequestMapping("maildetailView.do")
		public String maildetailView(HttpServletResponse response){
			return "mail/mailDetailView";
		}
		// 휴지통 이동 컨트롤러   
		@RequestMapping("deleteMailList.do")
		public String deleteMailList(HttpServletResponse response){
			return "mail/deleteMailList";
		}
	
//		@RequestMapping("mailReply.do")
//		public ModelAndView mailReply(ModelAndView mv,
//								HttpServletRequest request,
//								@RequestParam(value="recipient") String recipient) {
//			
//			Mail ma = maService.replyMail(recipient);
//		      
//		      if(ma != null) {
//		    	  mv.addObject("ma",ma).setViewName("mail/replyMail");
//		        
//		      }else {
//	    	  mv.addObject("msg","답장하기 실패 ㅋㅋ ").setViewName("common/errorPage");
//			
//		      }
//		      
//		return mv;
//		}
}
