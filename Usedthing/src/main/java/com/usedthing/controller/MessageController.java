package com.usedthing.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.usedthing.DTO.MemberDTO;
import com.usedthing.DTO.MessageDTO;
import com.usedthing.service.MessageService;

import lombok.AllArgsConstructor;
@Controller
@RequestMapping("/message/*")
@AllArgsConstructor
public class MessageController {

	private MessageService service;
	
	@GetMapping("/messagelist")
	public String getList(Model model,@SessionAttribute("member")MemberDTO dto) {
		System.out.println("아이디 :"+dto.getNickname());
		model.addAttribute("message",service.getList(dto.getNickname()));		
		
		return "/message/message";		
	}
	
	@GetMapping("/sendlist")
	public String sendgetList(Model model,@SessionAttribute("member")MemberDTO dto) {
		System.out.println("아이디 :"+dto.getNickname());
		model.addAttribute("message",service.getsendList(dto.getNickname()));		
		
		return "/message/sendmessage";		
	}
	
	@GetMapping("/createmessage")
	public String createMessage(MessageDTO dto,Model model) {
		
		model.addAttribute("message",dto);
		
		return "/message/createmessage";
	}
	@PostMapping("/createmessage")
	public String createMessage(MessageDTO dto) {
		System.out.println("쪽지 :"+dto);
		service.send(dto);
		
		return "redirect: /message/messagelist";
	}
	
	
	@GetMapping("/messageread")
	public String readMessage(int m_Idx,Model model) {
		System.out.println("join 결과:"+service.read(m_Idx));
		model.addAttribute("message",service.read(m_Idx));
		
		return "/message/read";
		
	}
	
	@GetMapping("/deletemessage")
	public String deleteMessage(int m_Idx) {
		
		int delete = service.delete(m_Idx);
		
		return "redirect: /message/messagelist";
		
	}
	
	
	@ResponseBody
	@PostMapping("/defaultsend")
	public int getMessage(MessageDTO dto)
	{
		int result = service.send(dto); 
		
		  return result;		
	}
	
}
