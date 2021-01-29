package com.usedthing.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class R_PageDTO {
	private int replyCount;
	private List<ReplyDTO> list;
}
