package com.usedthing.mapper;

import java.util.List;

import com.usedthing.DTO.M_productDTO;
import com.usedthing.DTO.MessageDTO;

public interface MessageMapper {
	
	public List<MessageDTO> getList(String nickname);
	
	public List<MessageDTO> getsendList(String nickname);
	
	public int insert(MessageDTO dto);
	
	public M_productDTO read(int m_Idx);
	
	public int delete(int m_Idx);
	
}
