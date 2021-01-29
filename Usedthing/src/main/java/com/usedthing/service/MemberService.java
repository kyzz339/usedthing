package com.usedthing.service;


import java.util.List;

import com.usedthing.DTO.MemberDTO;


public interface MemberService {
	
	  void register(MemberDTO dto);
	
	  public MemberDTO get(String id);
	  
	  int modify(MemberDTO dto);
	  
	  int remove(String id);
	  
	  MemberDTO login(MemberDTO dto);
	  
	  int idcheck(String id);
	  
	  int nicknamecheck(String nickname);
	  
	  List<MemberDTO> getList();
	  
	  int remove_admin(int idx);
	  
	  int update_admin(int idx);
	  
	  String findpassword(String id);
	  
	 
}
