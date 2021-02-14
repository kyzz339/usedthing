package com.usedthing.DTO;

import java.util.Date;

import lombok.Data;

@Data
public class MessageDTO {
	private int p_Idx;
	private int m_Idx;
	private String m_Sender;
	private String m_Deceiver;
	private Date m_Date;
	private String m_Title;
	private String m_Contents;
}
