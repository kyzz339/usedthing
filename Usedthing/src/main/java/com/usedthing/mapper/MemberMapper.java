package com.usedthing.mapper;

import java.util.List;

import com.usedthing.DTO.MemberDTO;

public interface MemberMapper {
	void create(MemberDTO dto);
	
	MemberDTO read(String id);
	
	int update(MemberDTO dto);
	
	int delete(String id);
	
	MemberDTO login(MemberDTO dto);
	
	int idchk(String id);
	
	int nicknamechk(String nickname);
	
	List<MemberDTO> getlist();
	
	int delete_admin(int idx);
	
	int update_admin(int dix);
	
	String findpassword(String id);
}

