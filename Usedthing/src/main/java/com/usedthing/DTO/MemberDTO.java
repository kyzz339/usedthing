package com.usedthing.DTO;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int idx;
	private String id;
	private String password;
	private String nickname;
	private String postcode;
	private String address1;
	private String address2;
	private String address3;
	private Date regdate;
	private String report;
}
