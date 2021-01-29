package com.usedthing.controller;



import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		
		return "redirect: /product/product";
	}
	
	@GetMapping("/exUpload")
	public String upload()
	{
		
		return "/test/fileuploadjsp";
	}
	
	@PostMapping("/exUpload")
	public String home(MultipartFile file) {
		
		String fileName =file.getOriginalFilename();
		String uploadPath ="/C:/Users/kyzz3/eclipse-workspace/Usedthing/src/main/webapp/resources/images";
		
		File target= new File(uploadPath,fileName);
		
		if(! new File(uploadPath).exists())
		{
			new File(uploadPath).mkdirs();
		}
		try {
			FileCopyUtils.copy(file.getBytes(),target);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("file upload");
		System.out.println("filename :"+file.getOriginalFilename());
		System.out.println("filesize :"+file.getSize());
		
		return"/product/product";
	}
	
}