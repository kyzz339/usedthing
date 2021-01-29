package com.usedthing.DTO;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	private int p_Idx;	//부모(product Idx) 
	private int r_Idx;	//댓글 자체에 Idx
	private String r_Contents;
	private String r_Writer;
	
	private Date r_Regdate;
	private Date r_Updatedate;
}
