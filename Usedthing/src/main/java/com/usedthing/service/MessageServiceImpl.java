package com.usedthing.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.usedthing.DTO.M_productDTO;
import com.usedthing.DTO.MessageDTO;
import com.usedthing.mapper.MessageMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MessageServiceImpl implements MessageService{
	private MessageMapper mapper;
	@Override
	public int send(MessageDTO dto) {
		
		return mapper.insert(dto);
	};
	
	@Override
	public M_productDTO read(int m_Idx) {
		
		return mapper.read(m_Idx);
	};
	
	@Override
	public int delete(int m_Idx) {
		
		return mapper.delete(m_Idx);
		
	};
	
	@Override
	public List<MessageDTO> getList(String nickname){
		
		return mapper.getList(nickname);
		
	};
	@Override
	public List<MessageDTO> getsendList(String nickname){
		
		return mapper.getsendList(nickname);
	};
	@Override
	public List<MessageDTO> getsendListhead(String nickname){
		
		return mapper.getsendListhead(nickname);
	}
	
}
