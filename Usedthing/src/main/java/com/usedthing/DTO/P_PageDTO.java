package com.usedthing.DTO;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class P_PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev,next;
	private int realEnd;
	private int total;
	private P_Criteria cri;
	
	public P_PageDTO(P_Criteria cri,int total) {
		this.cri=cri;
		this.total=total;
		
		//한묶음당(ex. 1~10, 11~20 )끝번호 지정->10,20
		this.endPage=(int) (Math.ceil((cri.getPageNum())/9.0))*10;
		
		//한묶음당 앞번호 지정 ->1,11
		this.startPage=this.endPage-9;
		
		//총 데이터수의 맨끝 페이지번호
		this.realEnd =(int) (Math.ceil((total*1.0)/cri.getAmount()));
		
		if(realEnd <this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage >1;
		
		this.next=this.endPage <realEnd;
		 
	}
	
	
	
}
