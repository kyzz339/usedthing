package com.usedthing.service;

import java.util.List;

import com.usedthing.DTO.M_productDTO;
import com.usedthing.DTO.MessageDTO;

public interface MessageService {
	
	public int send(MessageDTO dto);
	
	public M_productDTO read(int m_Idx);
	
	
	public int delete(int m_Idx);
	
	public List<MessageDTO> getList(String nickname);
	
	public List<MessageDTO> getsendList(String nickname);
	
	public List<MessageDTO> getsendListhead(String nickname);
}
