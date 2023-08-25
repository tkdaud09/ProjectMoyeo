package com.moyeo.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyeo.dto.Diy;
import com.moyeo.service.DiyService;

import lombok.RequiredArgsConstructor;



@Controller
// @Log4j : 
@RequestMapping(value = "/diy")
@RequiredArgsConstructor
public class DiyController {
	
	@Autowired
	private DiyService diyService;
	
	/*//diy 첫화면
	@RequestMapping(value = "/diy_main", method = RequestMethod.GET)
	public String DiyList(Model model) {
		return "diy/mo_diy";
	}
	*/
	
	// diy메인
		@GetMapping("/mo_diy")
		public void diyMain() {
			//return "diy/mo_diy";
		}
	
	// diy 등록 페이지 요청
	@GetMapping("/diy_add")
	public void diyAdd() {
		//return "diy/diy_add";
	}
	 
		
	// 글작성 + diy를 등록하면 diy 리스트 페이즈 요청
	// @Autowired(required = false)
	@PostMapping("/diy_add")
	public String diyAdd (Diy diy, Model model) throws Exception {
		
		diyService.insertDiy(diy);
		// model.addAttribute(null, model);
	
	
		return "redirect:/diy/diy_list";
	}
	
	@GetMapping("/diy_list")
	public void diyList() {
		// return "diy/diy_form";
	}
	 
	
	// diy 리스트 페이지..?
	@PostMapping(value = "/diy_list")
	public String diyList(Diy diy, Model model) throws Exception {
		
		model.addAttribute("diyList", diyService.getDiyList());
		System.out.println("@PostMapping(value = \"/diy_list\")");
		return "redirect:../";
	}
	

	
	/*
	// 파일 업로드 구현
	@PostMapping("/uploadFile")
	public String uploadFile(@RequestParam String uploaderName, 
			@RequestParam List<MultipartFile> uploadList, Model model) throws IOException{
		
	}
		// 사진..?
	*/
}









































