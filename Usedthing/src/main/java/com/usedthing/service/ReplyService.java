package com.usedthing.service;

import java.util.List;

import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.R_PageDTO;
import com.usedthing.DTO.ReplyDTO;

public interface ReplyService {
	
	public int register(ReplyDTO dto);
	
	public int modify(ReplyDTO dto);
	
	public int remove(int r_Idx);
	
	public List<ReplyDTO> getList(P_Criteria cri, int p_Idx);
	
	public R_PageDTO getListPage(P_Criteria cri, int p_Idx);
}
