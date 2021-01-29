package com.usedthing.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.R_PageDTO;
import com.usedthing.DTO.ReplyDTO;
import com.usedthing.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
		private ReplyMapper mapper;
		
		@Override
		public int register(ReplyDTO dto) {
			
			return mapper.insert(dto);
		}
		
		
		@Override
		public int modify(ReplyDTO dto) {
			
			return mapper.update(dto);
		}
		
		@Override
		public int remove(int r_Idx) {
			
			return mapper.delete(r_Idx);
		}
		
		@Override
		public List<ReplyDTO> getList(P_Criteria cri,int p_Idx){
	
			return mapper.getListWithPaging(cri, p_Idx);
		}
		
		@Override
		public R_PageDTO getListPage(P_Criteria cri,int p_Idx){
			
			return new R_PageDTO(mapper.getCountreply(p_Idx), mapper.getListWithPaging(cri, p_Idx));
		}
}
