package com.kh.nullcompany.mail.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
		// 이름 누르고 그 사람에게 메일 보내기 
		@RequestMapping("mailWriteId.do")
		public ModelAndView mailWriteId(ModelAndView mv,
										int senderNo, 
		@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage ) {
			
			
			System.out.println(senderNo);
			System.out.println("오냐 ...?");
			
			
			Member m = maService.mailWriteId(senderNo);
				mv.addObject("m",m);
				mv.addObject(currentPage);
				mv.setViewName("mail/mailWriteId");
		      	
			return mv;
		}
		
}
