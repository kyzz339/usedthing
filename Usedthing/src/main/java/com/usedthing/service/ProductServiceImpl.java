package com.usedthing.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.ProductDTO;
import com.usedthing.mapper.ProductMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
@Service
@RequiredArgsConstructor
@ToString
public class ProductServiceImpl implements ProductService{
	
	private final ProductMapper mapper;
	
	@Override
	public void p_register(ProductDTO dto) {
		System.out.println("product...reguster");
		
		mapper.create(dto);
	}
	
	@Override
	public List<ProductDTO> p_getlist(P_Criteria cri){
		//왜 필드에서 하면 안됨..???이해안됨 -NowPageNum값 설정
		cri.setNowPageNum((cri.getPageNum()-1)*cri.getAmount());
		System.out.println("get list with P_Criteria"+cri);
		//return mapper.getlist(); 페이징 없는 리스트
		return mapper.Paginglist(cri);
	}
	
	@Override
	public List<ProductDTO> Mylist(P_Criteria cri){
		cri.setNowPageNum((cri.getPageNum()-1)*cri.getAmount());
		return mapper.Mylist(cri);
	}
	
	@Override
	public ProductDTO p_get(int idx) {
		
		return mapper.read(idx);
	}
	@Override
	public int p_delete(int idx) {
		
		
		return mapper.delete(idx);
	}
	
	@Override 
	public int p_modify(ProductDTO dto) {
		
		return mapper.update(dto);
	}
	
	@Override
	public int p_changeonsale(int p_Idx) {
		
		return mapper.changeonsale(p_Idx);
	}
	
	@Override
	public int p_changesoldout(int p_Idx) {
		
		return mapper.changesoldout(p_Idx);
	}
	
	@Override
	public int getTotal(P_Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public int getMytotal(P_Criteria cri) {
		return mapper.myTotalcount(cri);
	}
	
}
