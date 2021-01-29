package com.usedthing.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.fabric.xmlrpc.base.Member;
import com.usedthing.DTO.MemberDTO;
import com.usedthing.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/*")
public class Membercontroller {
	
	private final MemberService service;
	private final JavaMailSender mailSender;
	
	@PostMapping("/login")
	public String login(MemberDTO dto,HttpServletRequest req) {
		System.out.println("loginID:"+dto.getId());
		
		HttpSession session =req.getSession();
		
		MemberDTO login=service.login(dto);
		
		if(login==null)
		{
			session.setAttribute("member",null);
			
			System.out.println("로그인실패 :"+login);
			return "redirect:/member/login";
		}
		else
		{
			session.setAttribute("member", login);
			System.out.println("닉네임 :"+login.getNickname());
			return "redirect: /product/product";
		}
		
		
		}
	@GetMapping("/login")
	public String login() {
			System.out.println("get...login");
			return "member/login";
		}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("get....logout");
		
		session.invalidate();
		
			return "redirect: /product/product";
	}
		
	@GetMapping("/createmember")
	public String createmember() {
			
			return "/member/createmember";
		}
	
	@PostMapping("/createmember")
	public String insertmember(MemberDTO dto){
	  System.out.println("MemberDTO :"+dto);
	  dto.setIdx(0);
	   
	  if(service.idcheck(dto.getId())>0) {
		  return "/member/createmember";
	  }
	  
	  service.register(dto);
	  
	  return "redirect:/member/login"; 
	  
	}
	  @GetMapping("/modify") 
	  public String modify(Model model,HttpSession session) {
		  MemberDTO check =(MemberDTO)session.getAttribute("member");
		  System.out.println(check);
		  String id=check.getId();
		  System.out.println("userInfo ID: :"+id);
		  model.addAttribute("member",service.get(id));
	  return "/member/modify"; 
	  }
	  
	  @PostMapping("/modify")
	  public String modify(MemberDTO dto) {
		  System.out.println("수정할 ID : "+dto.getId());
		  int count= service.modify(dto);
		  
		  return "redirect:/product/product";
	  }
	  
	  @GetMapping("/memberadmin")
	  public String memberadmin(Model model) {
		  
		  model.addAttribute("allmember", service.getList());
		  
		  return "/member/memberadmin";
	  }
	 
	 @PostMapping("/remove")
	 public String delete(@RequestParam("id") String id,HttpSession session) {
		 
		 System.out.println(id+"회원 탈퇴");
		 session.invalidate();
		 
		 int count=service.remove(id);
		 
		 
		 return "/product/product";
	 }
	 
	 @GetMapping("/remove_admin")
	 public String delete_admin(int idx) {
		 
		 service.remove_admin(idx);
		 
		 return"redirect: /member/memberadmin";
	 }
	 
	 @GetMapping("/update_admin")
	 public String update_admin(int idx) {
		 
		 service.update_admin(idx);
		 
		 return "redirect: /member/memberadmin";
	 }
	 
	 @GetMapping("/findpass")
	 public String findpass(String id) {
		 System.out.println("get...findpass");
		 return "/member/findpassword";
	 }
	 
	 @ResponseBody
	 @PostMapping("/Idchk")
	 public int idchk(String id) {
		 
		 int result = service.idcheck(id);
		 
		return  result ;
	 }
	 
	 @ResponseBody
	 @PostMapping("/Nicknamechk")
	 public int nicknamechk(String nickname) {
		 
		 int result = service.nicknamecheck(nickname);
		 
		return  result ;
	 }
	 
	 @PostMapping("/findpassword")
	 public String Emailsend(String id) {
		 String password = service.findpassword(id);
		 
		 System.out.println("이메일 주소 :"+id);
		 System.out.println("전송할 비밀번호 :"+password);
		 
		 String setFrom = "kyzz339@naver.com";
		 String toMail = id;
		 String title = "홈페이지 비밀번호 이메일 입니다.";
		 String content = "비밀번호는 "+password+" 입니다";
		 
		 try { 
			  MimeMessage message = mailSender.createMimeMessage(); 
			  MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			  helper.setFrom(setFrom);
			  helper.setTo(toMail);
			  helper.setSubject(title);
			  helper.setText(content,true);
			  mailSender.send(message);
			  }
			  catch(Exception e) {
			  e.printStackTrace(); }
		 
		 return "redirect:/member/login";
	 }
	 
	 @ResponseBody
	 @GetMapping("/Emailcheck")
	 public String emailcheck(String email) {
		 
		 System.out.println("이메일 데이터 전송 확인");
		 System.out.println("이메일 주소 :"+email);
		 
		 Random random = new Random();
		 int checknum = random.nextInt(888888)+111111;
		 System.out.println("인증 번호"+checknum);
		 
		 String setFrom = "kyzz339@naver.com";
		 String toMail = email;
		 String title = "회원가입 인증 이메일 입니다.";
		 String content = "홈페이지 인증번호는 "+checknum+" 입니다";
		 
		
		
		  try {
		  MimeMessage message = mailSender.createMimeMessage();
		  MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
		  helper.setFrom(setFrom); 
		  helper.setTo(toMail); 
		  helper.setSubject(title);
		  helper.setText(content,true); 
		  mailSender.send(message);
		  }
		  catch(Exception e){
		  e.printStackTrace(); 
		  }

		 String num = Integer.toString(checknum);
		 
		 return num;
	 }
	 
}
