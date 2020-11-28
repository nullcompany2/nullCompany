package com.kh.nullcompany.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.nullcompany.logo.model.service.LogoService;
import com.kh.nullcompany.logo.model.vo.Logo;
import com.kh.nullcompany.member.model.service.MemberService;
import com.kh.nullcompany.member.model.vo.Member;

@SessionAttributes({"loginUser","logo"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private LogoService lService;
	
	// 암호화 처리
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// login
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그아웃 컨트롤러 
	@RequestMapping("logout.do")
	public void logout(SessionStatus status,HttpServletResponse response ) throws IOException {
		status.setComplete();
		response.sendRedirect("index.jsp");
	}
	
	// 인덱스로 보내주는 컨트롤러 
	@RequestMapping("index.do")
	public void index(HttpServletResponse response) throws IOException {
		response.sendRedirect("index.jsp");
	}
	
	// 로그인 컨트롤
	@RequestMapping(value="login.do",method=RequestMethod.POST) 
	public String memberLogin(Member m,Model model) {          
		
		
		if(logger.isDebugEnabled()) { 
			logger.debug("Login : " + m);
		}
		
		// 로그인  처리
		Member loginUser = mService.loginMember(m);
		model.addAttribute("loginUser", loginUser);
		Logo l = lService.logoSelect();
		model.addAttribute("logo",l);
		System.out.println("로고 : " + l);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","로그인 실패");
			return"common/errorPage";
		}
	}
	
	// 회원 가입 창 
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}
	
	// 회원 가입 인서트 
	@RequestMapping("minsert.do")
	public String insertMember(Member m,Model model,
								@RequestParam("post") String post,
								@RequestParam("address1") String address1,
								@RequestParam("address2") String address2) {
		System.out.println(m);
		System.out.println(post+" "+address1+" "+address2);
		
		if(!post.equals("")) {
			m.setAddress(post+","+address1+","+address2);
		}
		
		System.out.println(bcryptPasswordEncoder.encode(m.getPwd()));
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
	
		int result = mService.insertMember(m);
		
		if(result > 0 ) {
			return "member/joinWelcome";			
		}else {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 내정보 보기 이동 컨트롤러   
			@RequestMapping("minfo.do")
			public String myInfoView(HttpServletResponse response){
				return "member/memberInfo";
			}
			
			
	// 내정보 수정 이동 컨트롤러   
			@RequestMapping("mupdate.do")
			public String updateMember(HttpServletResponse response){
			return "member/memberUpdateForm";
						}
			
	// 내정보 업데이트 컨트롤러 
			 @RequestMapping("mupdateGo.do")
			   public String insertMemberInfo(Member m,Model model, HttpServletRequest request,
			         @RequestParam(value="uploadPhoto",required=false)MultipartFile file,
			         @RequestParam("post") String post,
					 @RequestParam("address1") String addr1,
					 @RequestParam("address2") String addr2) {
			      
				  System.out.println("멤버 조회 : " +m );
				  System.out.println("file : " + file);
				 	if(!file.getOriginalFilename().equals("")) {

				 		// saveFile메소드 : 저장하고자하는 file과 request를 전달해서 서버에 업로드시키고 저장된 파일명을 반환해주는 메소드
			         String userPhoto = saveFile(file,request);
			         
			         if(userPhoto != null) { // 파일이 잘 저장된 경우
			            m.setPhoto(userPhoto);
			           
			         }
			 		 if(!post.equals("")) {
						m.setAddress(post+","+addr1+","+addr2);
			 		 }
				 	}
				 	 
			 		 int result = mService.insertInfoMember(m);
			      
			      if(result > 0) {
			    	  model.addAttribute("loginUser",m);
			         return "redirect:home.do";
			      }else {
			    	  model.addAttribute("msg","회원 정보 수정 실패!");
			         return "common/errorPage";
			      }
			   }
			
			   
			
			 public String saveFile(MultipartFile file, HttpServletRequest request) {
			     
			      String root = request.getSession().getServletContext().getRealPath("resources");
			      System.out.println(root);
			      
			      
			      //String savePath = root + "/muploadFiles"; 와 같음 
			      String savePath = root + File.separator +"/muploadFiles";
			      File folder = new File(savePath); // savePath의 폴더를 불러온다.
			      
			      if(!folder.exists()) {
			         // 폴더를 만들고 
			         folder.mkdirs();
			      }
			      
			      String photo = file.getOriginalFilename(); // test.png

			      String fileSavePath = folder + File.separator + photo;
			      
			      System.out.println(photo);
			      System.out.println(fileSavePath);
			      try {
			    	  file.transferTo(new File(fileSavePath));
			      }catch(Exception e) {
			    	  System.out.println("파일 전송 에러 : " + e.getMessage());
			      }
			      return "resources/muploadFiles/" + photo;

			   }			      
			 
	// 아이디 중복 체크 3글자 이상 부터 
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id){
	
	int result = mService.idCheck(id);
	
	
	if(result > 0) {
		return "fail";
	}else {
		return "ok";
	}
}
	// 이메일 중복 체크 10글자 부터 
	@ResponseBody
	@RequestMapping("emailCheck.do")
	public String emailCheck(String email){
	
	int result = mService.emailCheck(email);
	
	
	if(result > 0) {
		return "fail";
	}else {
		return "ok";
	}
}
	
	// 휴대폰 번호 중복 체크 
	@ResponseBody
	@RequestMapping("phoneCheck.do")
	
	public String phoneCheck(String phone) {
		int result = mService.phoneCheck(phone);
			
			if(result > 0) {
				return "fail";
			}else {
				return "ok";
			}
		}
	
}