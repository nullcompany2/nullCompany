package com.kh.nullcompany.mail.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.nullcompany.common.Pagination;
import com.kh.nullcompany.mail.model.service.MailService;
import com.kh.nullcompany.mail.model.vo.Mail;
import com.kh.nullcompany.mail.model.vo.MailListCount;
import com.kh.nullcompany.member.model.vo.Member;
import com.kh.nullcompany.personnelManagement.model.vo.Department;
import com.kh.nullcompany.schedule.model.service.ScheduleService;
import com.kh.nullcompany.schedule.model.vo.Calendar;
import com.kh.nullcompany.schedule.model.vo.Schedule;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.nullcompany.board.model.vo.PageInfo;

@SessionAttributes("loginUser")	
@Controller
public class MailController {

@Autowired
private MailService maService;
@Autowired
private ScheduleService sService;


		// 메인에서 그려주기 
		@RequestMapping("mailBox.do")
		public void mailBox(HttpServletResponse response, HttpSession session) 
				throws JsonIOException, IOException {
			
			response.setContentType("application/json; charset=utf-8");
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		
			MailListCount listCount = maService.getMailBoxCount(memId);
			
			System.out.println("가져온 리스트 : "+ listCount);
			
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(listCount,response.getWriter());
		}

		// 메일쓰기 
		@RequestMapping("mailWrite.do")
		public ModelAndView Schedulermain(ModelAndView mv,  HttpServletResponse response, HttpSession session) {
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();	
			
			// 조직도 모달을 위한 정보가져오기 
			// 총 부서 리스트
			ArrayList<Department> deptList = sService.deptList();
			// 총 사원 리스트
			ArrayList<Member> memList = sService.memList();
			
			mv.addObject("deptList", deptList);
			mv.addObject("memList", memList);
			
			mv.setViewName("mail/writeMail");
			return mv;
		}

		// 받은 메일함 리스트
		@RequestMapping("recieveMail.do")
		public ModelAndView reciveMailList(ModelAndView mv, HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		

			int listCount = maService.getReListCount(memId);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.selectMailReceiveList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/receiveMailList");
			
			return mv;
		}
		
		// 답장 - > 임시저장 클릭 // 임시저장 테이블에 인서트  
		@RequestMapping("gosaveMail.do")
		public ModelAndView mailgosave(ModelAndView mv, Mail ma,HttpServletRequest request,
				@RequestParam(value="uploadPhoto",required=false)MultipartFile file) {
			
			// 보낸이 받는이 주소가 아이디로 DB에 들어갈 수 있게 파싱 작업 
			if(ma.getRecipient().equals("없음")) {
				
				String [] senderArr = ma.getSender().split("<");
				String [] senderArr2 = senderArr[1].split(">");
				String [] senderArr3 = senderArr2[0].split("@");
				String [] senderArr4 = senderArr3[0].split(" ");
				
				ma.setRecipient("없음");
				ma.setSender(senderArr4[1]);
				
			} else {
			String [] recipientArr = ma.getRecipient().split("<");
			String [] recipientArr2 = recipientArr[1].split(">");
			String [] recipientArr3 = recipientArr2[0].split("@");
			String [] recipientArr4 = recipientArr3[0].split(" ");
			
			String [] senderArr = ma.getSender().split("<");
			String [] senderArr2 = senderArr[1].split(">");
			String [] senderArr3 = senderArr2[0].split("@");
			String [] senderArr4 = senderArr3[0].split(" ");
			
			ma.setRecipient(recipientArr4[1]);
			ma.setSender(senderArr4[1]);
			}
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
				mv.setViewName("common/errorPage");	
			}
			 return mv;
		}
		
		// 파일 저장 메소드 
		// 손봐야함 ...
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
		      return mailFile;

		   }	
		
   // 답장하기 - 보내기 
	@RequestMapping("sendMail.do")
	public ModelAndView sendMail(ModelAndView mv, Mail ma,HttpServletRequest request,
			@RequestParam(value="uploadPhoto",required=false)MultipartFile file) {
		if (ma.getRecipient().equals("없음 < 없음@nullcompany.com >")) {
			
			mv.setViewName("mail/failMail");	
			return mv;
			
		}else {
		String [] recipientArr = ma.getRecipient().split("<");
		String [] recipientArr2 = recipientArr[1].split(">");
		String [] recipientArr3 = recipientArr2[0].split("@");
		String [] recipientArr4 = recipientArr3[0].split(" ");
		
		String [] senderArr = ma.getSender().split("<");
		String [] senderArr2 = senderArr[1].split(">");
		String [] senderArr3 = senderArr2[0].split("@");
		String [] senderArr4 = senderArr3[0].split(" ");
		
		ma.setRecipient(recipientArr4[1]);
		ma.setSender(senderArr4[1]);
		String recipient = recipientArr4[1];
		
		if(!file.getOriginalFilename().equals("")) {
         String mailFile = saveMailFile(file,request);
         
         if(mailFile != null) { 
            ma.setmFileName(mailFile);
          }
		}
		
		int result = maService.sendMail(ma);
		
		
		if(result > 0 ) {
			Member m = maService.findIdName(recipient);
			mv.addObject("m", m);
			mv.setViewName("mail/sendMail");	
		}else {
			mv.addObject("msg", "인서트 실패~ ");
			mv.setViewName("common/errorPage");	
			
		}
		 return mv;
		}
	}
	
		
		// 보낸 메일함 리스트 컨트롤러  
		@RequestMapping("sendMailList.do")
		public ModelAndView sendMailList(ModelAndView mv, HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		

			int listCount = maService.getSendListCount(memId);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.selectMailSendList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/sendMailList");
			
			return mv;
		}
		
		// 임시보관함 리스트 가져오기   
		@RequestMapping("saveMailList.do")
		public ModelAndView mailSaveList(ModelAndView mv, HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		

			int listCount = maService.getSaveListCount(memId);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService. mailSaveList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/saveMailList");
			
			return mv;
		}
		
		// 받은  편지함 메일 한개 보기 컨트롤러   
		@RequestMapping("maildetailView.do")
		public ModelAndView mailDetailView(ModelAndView mv,int mailNo){
			
			System.out.println(mailNo);
			Mail ma = maService.mailDetailView(mailNo);
			
			mv.addObject("ma",ma);
			mv.setViewName("mail/mailDetailView");
			return mv;
		}
		
		// 휴지통 메일 한개 보기 
		@RequestMapping("delmaildetailView.do")
		public ModelAndView delMailDetailView(ModelAndView mv, int mailNo) {
			
			Mail ma = maService.delMailDetailView(mailNo);
			
			mv.addObject("ma",ma);
			mv.setViewName("mail/delMailDetailView");
			return mv;
		}
		
		// 보낸 편지함 메일 한개 보기 
		@RequestMapping("sendMaildetailView.do")
		public ModelAndView sendMailDetailView(ModelAndView mv,int mailNo){
			
			System.out.println(mailNo);
			Mail ma = maService.sendMailDetailView(mailNo);
			
			mv.addObject("ma",ma);
			mv.setViewName("mail/sendMailDetailView");
			
			return mv;
			
		}
		
		// 리스트 - 아이디 누르고 메일 쓰기 
		@RequestMapping("mailWriteId.do")
		public ModelAndView mailWriteId(ModelAndView mv,
				int memNo){
			
			Member m = maService.mailWriteId(memNo);
			System.out.println(m);
			System.out.println(memNo);
			
			mv.addObject("m",m);
			mv.setViewName("mail/mailWriteId");
			
			return mv;
			
	}
	
		// 임시 보관함 메일 한개 보기
		@RequestMapping("saveDetailView.do")
		public ModelAndView saveDetailView( ModelAndView mv, int mailNo) {
			System.out.println(mailNo);
			Mail ma = maService.saveDetailView(mailNo);
			System.out.println(ma);
			mv.addObject("ma",ma);
			mv.setViewName("mail/saveDetailView");

			return mv;
		}
		
		// 답장하기 
		@RequestMapping("mailReply.do")
		public ModelAndView mailReply(ModelAndView mv, int mailNo){

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

			int listCount = maService.getReListCount(memId);

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

			int listCount = maService.getReReListCount(memId);

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
		
			String memId = ((Member)session.getAttribute("loginUser")).getId();		

			int result = maService.allDelMail(memId);
			
			if(result > 0) {
				return "redirect:recieveMail.do";			
			}else {
				model.addAttribute("msg", "모든 컬럼 삭제 실패~");
				return "common/errorPage";
			}
		}
		
		// 휴지통 리스트 뽑기 
		@RequestMapping("binMailList.do")
		public ModelAndView RecieveMailbinList(ModelAndView mv, 
				HttpSession session,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) throws IOException {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();		

			int listCount = maService.getBinListCount(memId);

			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			
			ArrayList<Mail> list = maService.binMailList(pi,memId);
			
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("mail/deleteMailList");
			
		return mv;
			
		}
		
		@RequestMapping("allBinDelMail.do")
		public String allBinDelMail(Model model, HttpSession session) {
			
			String memId = ((Member)session.getAttribute("loginUser")).getId();
			
			int result = maService.allBinDelMail(memId);
			
			if(result > 0) {
				System.out.println("처리 완료 ");
				return "redirect:binMailList.do";	
			}else {
				model.addAttribute("msg", "모든 컬럼 진짜 삭제 실패~");
				return "common/errorPage";
			}
		}
		
		@RequestMapping("allRealDelMail.do")
		public String allRealDelMail(Model model, HttpSession session) {
			String memId = ((Member)session.getAttribute("loginUser")).getId();		

			int result = maService.allRealDelMail(memId);
			
			if(result > 0) {
				return "redirect:recieveMail.do";			
			}else {
				model.addAttribute("msg", "모든 컬럼 삭제 실패~");
				return "common/errorPage";
			}
		}
		
		@RequestMapping("deleteOneMail.do")
		public String deleteOneMail(Model model, int mailNo) {
			int result = maService.deleteOneMail(mailNo);
			
			if(result > 0) {
				return "redirect:recieveMail.do";			
			}else {
				model.addAttribute("msg", "컬럼하나 삭제 실패~!~");
				return "common/errorPage";
			}
		}
		
		// 보낸 메일함에서 개별 삭제 
		@RequestMapping("deleteOneMail_send.do")
		public String deleteOneMail_send(Model model, int mailNo) {
			int result = maService.deleteOneMail(mailNo);
			
			if(result > 0) {
				return "redirect:sendMailList.do";			
			}else {
				model.addAttribute("msg", "컬럼하나 삭제 실패~!~");
				return "common/errorPage";
			}
		}
			
		@RequestMapping("realDeleteOneMail.do")
		public String realDeleteOneMail(Model model, int mailNo) {
			int result = maService.realDeleteOneMail(mailNo);
			if(result > 0) {
				return "redirect:recieveMail.do";			
			}else {
				model.addAttribute("msg", "컬럼하나 삭제 실패~!~");
				return "common/errorPage";
			}
		}
		
		// 메일 쓰기 때 에이작스 메일 주소 자동완성 
		@RequestMapping("autoComplete.do")
		public void autoComplete(HttpServletResponse response, String text) throws JsonIOException, IOException {
			response.setContentType("application/json; charset=utf-8");
			System.out.println(text);
			
			ArrayList<Member> m = maService.autoComplete(text);
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(m,response.getWriter());
		}
		
		// 쓰레기통에서 복원하기 
		@RequestMapping("backMail.do")
		public String backMail(Model model, int mailNo) {
			
			System.out.println("쓰레기통 번호 : " + mailNo);
			int result = maService.backMail(mailNo);
			if(result > 0) {
				return "redirect:binMailList.do";			
			}else {
				model.addAttribute("msg", "컬럼하나 삭제 실패~!~");
				return "common/errorPage";
			}
		}
		
		
		
}

