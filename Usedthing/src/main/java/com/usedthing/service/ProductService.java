package com.usedthing.service;

import java.util.List;

import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.ProductDTO;

public interface ProductService {
	void p_register(ProductDTO dto);
	
	List<ProductDTO> p_getlist(P_Criteria cri);
	
	List<ProductDTO> Mylist(P_Criteria cri);
	
	ProductDTO p_get(int idx);
	
	int p_delete(int idx);
	
	int p_modify(ProductDTO dto);
	
	int p_changeonsale(int p_Idx);
	
	int p_changesoldout(int p_Idx);
	
	int getTotal(P_Criteria cri);
	
	int getMytotal(P_Criteria cri);
}
