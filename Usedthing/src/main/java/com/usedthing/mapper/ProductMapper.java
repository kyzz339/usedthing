package com.usedthing.mapper;

import java.util.List;

import com.usedthing.DTO.MemberDTO;
import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.ProductDTO;

public interface ProductMapper {
	void create(ProductDTO dto);
	
	ProductDTO read(int idx);
	
	List<ProductDTO> getlist();
	
	List<ProductDTO> Paginglist(P_Criteria cri);
	
	List<ProductDTO> Mylist(P_Criteria cri);
	
	int update(ProductDTO dto);
	
	int delete(int idx);
	
	int changeonsale(int p_Idx);
	
	int changesoldout(int p_Idx);
	
	int getTotalCount(P_Criteria cri);
	
	int myTotalcount(P_Criteria cri);
}
