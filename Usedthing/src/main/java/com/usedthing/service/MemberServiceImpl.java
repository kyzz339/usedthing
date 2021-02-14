package com.usedthing.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.usedthing.DTO.MemberDTO;
import com.usedthing.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
 
@Service
@RequiredArgsConstructor
@ToString
public class MemberServiceImpl implements MemberService {
	 
	private final MemberMapper mapper;
	@Override
	public void register(MemberDTO dto) {
		
		System.out.println("member register");
		mapper.create(dto);
		
	};
	@Override
	public MemberDTO get(String id) {
		System.out.println("member get");
		
		return mapper.read(id);
	};
	@Override  
	public int modify(MemberDTO dto) {
		  System.out.println("member modify");
		  
		  return mapper.update(dto);
		  
	  };
	  @Override
	  public int remove(String id) {
		  System.out.println("member remove");
		  
		  return mapper.delete(id);
	  };
	  @Override
	public MemberDTO login(MemberDTO dto) {
		
		return mapper.login(dto);
	}
	  @Override
	public int idcheck(String id) {
		
		return mapper.idchk(id);
	}
	  @Override
	public int nicknamecheck(String nickname) {
		return mapper.nicknamechk(nickname);
	}
	  @Override
	public List<MemberDTO> getList(){
		
		  return mapper.getlist();
	}
	  
	 @Override
	 public int remove_admin(int idx) {
		 
		 System.out.println("remove_admin ->idx" +idx );
		 
		 return mapper.delete_admin(idx);
	 }
	 @Override
	 public int update_admin(int idx) {
		 System.out.println("update_admin ->idx"+idx);
		 
		 return mapper.update_admin(idx);
	 }
	 
	 @Override
	 public int update_user(int idx) {
		 
		 System.out.println("update_user -> idx :"+idx);
		 
		 return mapper.update_user(idx);
		 
	 }
	 
	 @Override
	 public String findpassword(String id) {
		 System.out.println("find password");
		 
		 return mapper.findpassword(id);
	 }
	 
}
