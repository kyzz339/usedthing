package com.usedthing.DTO;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	//상품게시판 인덱스
	int p_Idx;
	//상품게시판 제목
	String p_Title;
	//상품게시판 내용
	String p_Contents;
	//상품게시판 작성자
	String p_Writer;
	//상품게시판 조회수
	int p_ViewCount;
	//상품게시판 제품코드
	String p_Code;
	//상품게시판   썸네일이미지
	String p_Thumnail;
	//상품게시판 상세이미지
	String p_Img;
	//상품게시판 등록일
	Date p_Regdate;
	//상품게시판 수정일
	Date p_Updatedate;
	//상품게시판 판매방식
	String p_Sellingway;
	//상품게시판 판매가격
	int p_Price;
	//상품게시판 판매여부
	String p_Onsale;	
}
