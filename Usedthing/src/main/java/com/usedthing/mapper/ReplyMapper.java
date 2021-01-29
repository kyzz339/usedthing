package com.usedthing.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.ReplyDTO;

public interface ReplyMapper {
	public int insert(ReplyDTO dto);
	
	public ReplyDTO read(int p_Idx);
	
	public int delete(int p_Idx);
	
	public int update(ReplyDTO dto);
	
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") P_Criteria cri,@Param("p_Idx") int p_Idx);
	
	public int getCountreply(int p_Idx);
}
