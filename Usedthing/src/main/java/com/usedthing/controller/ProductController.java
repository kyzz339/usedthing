package com.usedthing.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usedthing.DTO.MemberDTO;
import com.usedthing.DTO.P_Criteria;
import com.usedthing.DTO.P_PageDTO;
import com.usedthing.DTO.ProductDTO;
import com.usedthing.service.MemberService;
import com.usedthing.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product/*")
public class ProductController {
	
	private final ProductService service;
	
	@GetMapping("/product")
	public String list(Model model,P_Criteria cri) {
		
		System.out.println("Product list....");
		
		model.addAttribute("product",service.p_getlist(cri));
		System.out.println("전체 데이터수 :"+service.getTotal(cri));
		model.addAttribute("pageMaker",new P_PageDTO(cri, service.getTotal(cri)));
		
		return"/product/product";
	}
	@GetMapping("/myproduct")
public String Mylist(Model model,P_Criteria cri,@SessionAttribute("member")MemberDTO dto) {
		
		System.out.println("MyProduct list....");
		cri.setNickname(dto.getNickname());
		System.out.println(cri);
		P_PageDTO pageDTO = new P_PageDTO(cri, service.getMytotal(cri));
		model.addAttribute("product",service.Mylist(cri));
		System.out.println("My전체 데이터수 :"+service.getMytotal(cri));
		System.out.println(pageDTO.getRealEnd());
		model.addAttribute("pageMaker",pageDTO);
		
		return"/product/myproduct";
	}
	@GetMapping("/createproduct")
	public String p_create() {
		
		
		return "/product/createproduct";
	}
	
	@PostMapping("/createproduct") //https://joalog.tistory.com/48 참고-파일업로드
	public String p_create(ProductDTO dto,MultipartFile file1,List<MultipartFile> files) {
		String filename ="";
		dto.setP_Thumnail(file1.getOriginalFilename());
		
		for(int a=0;a<files.size();a++) {
		filename += files.get(a).getOriginalFilename();
		if(a < files.size()-1) {
			filename += ",";
		}
		
		}
		dto.setP_Img(filename);
		
		String fileName1= file1.getOriginalFilename();
		String fileName2=dto.getP_Img();
		
		String uploadPath ="C:\\Users\\kyzz3\\git\\usedthing\\Usedthing\\src\\main\\webapp\\resources\\images";
		
		File target= new File(uploadPath,fileName1);
		
		
			if(! new File(uploadPath).exists())
			{
				new File(uploadPath).mkdirs();
			}
			
			try {
				FileCopyUtils.copy(file1.getBytes(),target);
				System.out.println("file1 :"+file1.getOriginalFilename());
				
				for(int a=0;a<files.size();a++) 
					{
						File target2 = new File(uploadPath,filename.split(",")[a]);
						
						FileCopyUtils.copy(files.get(a).getBytes(),target2);
						System.out.println("files :"+files.get(a).getOriginalFilename());
					}
				

			}catch(Exception e) {
				e.printStackTrace();
			}
		service.p_register(dto);

		return "redirect:/product/product";
	}
	
	@GetMapping("/productdetail")
	public String get(int p_Idx,@ModelAttribute("cri")P_Criteria cri,Model model) {
		
		model.addAttribute("product",service.p_get(p_Idx));
		
		List imglist = new ArrayList();
		String img = service.p_get(p_Idx).getP_Img();
		for(int a=0; a<=StringUtils.countOccurrencesOf(img, ",");a++) {
			imglist.add(a, img.split(",")[a]);
		}
		model.addAttribute("imglist",imglist);
		System.out.println(imglist);
		System.out.println(p_Idx+" productdetail Get.....");
		
		return "/product/productdetail";
	}
	
	@GetMapping("/changeonsale")
	public String changeonsale(int p_Idx,@ModelAttribute("cri")P_Criteria cri,Model model) {
		
		service.p_changeonsale(p_Idx);
		model.addAttribute("product",service.p_get(p_Idx));
		System.out.println("판매 완료 :"+p_Idx);
		
		return "/product/productdetail";
	}
	
	@GetMapping("/changeosoldout")
	public String changesoldout(int p_Idx,@ModelAttribute("cri")P_Criteria cri,Model model) {
		
		service.p_changesoldout(p_Idx);
		model.addAttribute("product",service.p_get(p_Idx));
		System.out.println("판매 수정 :"+p_Idx);
		
		return "/product/productdetail";
	}
	
	@GetMapping("/delete")
	public String delete(int p_Idx) {
		
		service.p_delete(p_Idx);
		
		return "redirect:/product/product";
	}
	
	@GetMapping("/modify") 
	public String p_modify(@RequestParam("p_Idx")int p_Idx,@ModelAttribute("cri")P_Criteria cri,Model model) {
		
		model.addAttribute("detail",service.p_get(p_Idx));
		String img = service.p_get(p_Idx).getP_Img();
		List imglist = new ArrayList();
		System.out.println("imgDB :"+img);
		for(int a=0; a<=StringUtils.countOccurrencesOf(img, ",");a++) { //파일 이름 분리
			imglist.add(a, img.split(",")[a]);
		}
		model.addAttribute("imglist",imglist);
		System.out.println(imglist);
		
		
		
		System.out.println("product modify..."+p_Idx);
		System.out.println("product modify.....Get");
		
		return "/product/modifyproduct";
	}
	
	@PostMapping("/modify")
	public String p_modify(ProductDTO dto,MultipartFile file1,List<MultipartFile> files,String originfiles,RedirectAttributes rttr,P_Criteria cri) {
		
		String filename ="";
		if(file1 != null) {
			dto.setP_Thumnail(file1.getOriginalFilename());
		}
		
		filename += originfiles;
		 
		if(files != null) {
			for(int a=0;a<files.size();a++) {
				filename += ","+files.get(a).getOriginalFilename();
			}
		}
		
		dto.setP_Img(filename);
		
		String fileName1= dto.getP_Thumnail();
		String fileName2=dto.getP_Img();
		
		System.out.println("file1 :"+fileName1);
		System.out.println("file2 :"+fileName2);
		
		String uploadPath ="C:\\Users\\kyzz3\\git\\usedthing\\Usedthing\\src\\main\\webapp\\resources\\images";
		
		File target= new File(uploadPath,fileName1);
		
		
		if(! new File(uploadPath).exists())
		{
			new File(uploadPath).mkdirs();
		}
		
		try {
			if(file1 != null) {
				FileCopyUtils.copy(file1.getBytes(),target);
				System.out.println("file1 :"+file1.getOriginalFilename());
				}else
			for(int a=0;a<files.size();a++) 
				{
					File target1 = new File(uploadPath,files.get(a).getOriginalFilename());
					FileCopyUtils.copy(files.get(a).getBytes(),target1);
					System.out.println("files :"+files.get(a).getOriginalFilename());
				}
			

		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("modify dto"+dto);
	service.p_modify(dto);

		System.out.println(dto);
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/product/product";
	}
	
}
