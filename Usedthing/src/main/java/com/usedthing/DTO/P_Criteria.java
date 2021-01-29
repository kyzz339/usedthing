package com.usedthing.DTO;

import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class P_Criteria { //p.292 참고 -페이징,
	private int pageNum; //현재 페이지 번호
	private int amount;	 //한번에 표시되는 게시물 개수
	private int nowPageNum=(pageNum-1)*amount; //페이지 번호에 따른 데이터시작 하는 변수
	
	private String type;
	private String keyword;
	private String nickname;
	public P_Criteria() {
		this(1,9);
	}
	
	public P_Criteria(int pageNum,int amount){
		this.pageNum=pageNum;
		this.amount=amount;
		this.nowPageNum=(pageNum-1)*amount;
	}
	
	
}
