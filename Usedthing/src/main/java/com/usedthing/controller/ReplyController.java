package com.usedthing.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.R_PageDTO;
import com.usedthing.DTO.ReplyDTO;
import com.usedthing.service.ReplyService;

import lombok.AllArgsConstructor;

@RequestMapping("/reply/*")
@RestController
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	
	@PostMapping(value="/new",
			consumes="application/json", //Json 방식으로 처리->요청.
			produces= {MediaType.TEXT_PLAIN_VALUE}) //문자열을 반환하도록 처리(?)
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto){ 
		//@RequestBody을 적용해서 JSON데이터를 ReplyDTO타입으로 변환
		System.out.println("ReplyDTO :"+dto);
		int insertCount =service.register(dto);
		System.out.println("Reply INSERT COUNT :"+insertCount);
		return insertCount==1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		//https 요청을 하면 안되고, http 요청을 하면 됨.
	}
	
	@GetMapping(value="/pages/{p_Idx}/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<R_PageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("p_Idx")int p_Idx){
		System.out.println("GetList.....reply");
		P_Criteria cri =new P_Criteria(page,10);
		System.out.println(cri);
		return new ResponseEntity<>(service.getListPage(cri, p_Idx),HttpStatus.OK);
	}
	
	/*	페이징 없이.
	 * @GetMapping(value="/pages/{p_Idx}/{page}", produces= {
	 * MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	 * public ResponseEntity<List<ReplyDTO>> getList(
	 * 
	 * @PathVariable("page") int page,
	 * 
	 * @PathVariable("p_Idx")int p_Idx){ System.out.println("GetList.....reply");
	 * P_Criteria cri =new P_Criteria(page,10); System.out.println(cri); return new
	 * ResponseEntity<>(service.getList(cri, p_Idx),HttpStatus.OK); }
	 */

	@DeleteMapping(value="/{r_Idx}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("r_Idx") int r_Idx){
		System.out.println("remove :"+r_Idx);
		
		return service.remove(r_Idx) == 1 ? 
				new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},
			value="/{r_Idx}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyDTO dto,
										 @PathVariable("r_Idx") int r_Idx){
		dto.setR_Idx(r_Idx);
		
		System.out.println("p_Idx :"+r_Idx);
		System.out.println("modify reply"+dto);
		
		return service.modify(dto) ==1 
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
