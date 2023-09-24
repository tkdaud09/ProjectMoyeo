package com.moyeo.controller;


import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.moyeo.dto.Diy;
import com.moyeo.dto.DiyLove;
import com.moyeo.exception.DiyNotFoundException;
import com.moyeo.security.CustomUserDetails;
import com.moyeo.service.DiyLoveService;
import com.moyeo.service.DiyService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/diy")
@RequiredArgsConstructor
public class DiyController {
	@Autowired
	private final WebApplicationContext context;
	@Autowired
	private final DiyService diyService;
	@Autowired
	private final DiyLoveService diyLoveService;
	
	// diy 페이지 요청
	@GetMapping("/diy")
	public String diyList(Model model, Authentication authentication) {
		CustomUserDetails userinfo = null;
		if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
	         userinfo = (CustomUserDetails) authentication.getPrincipal();
	      }
		
		model.addAttribute("userinfo", userinfo);
		return "diy/diy";
	}
	// diy 자세히보기
	@GetMapping("/diy_detail/{diyIdx}")
	public String diyDetail(@PathVariable("diyIdx") int diyIdx, Model model) {
		model.addAttribute("diyDetail", diyService.selectDiy(diyIdx));
		return "diy/diy_detail";
	}
	
	// diy 등록 페이지 요청
	@GetMapping("/diy_add")
	public String diyAdd() {
		return "diy/diy_add";
	}
	
	// diy 리스트 페이지 요청
	@GetMapping("/diy_list")
	public String selectDiyList(@RequestParam Map<String, Object> map, Model model) throws DiyNotFoundException {
		
		model.addAttribute("diyList", diyService.getDiyList(map));
		model.addAttribute("search", map);
	    // model.addAttribute("loveStatus",diyLoveService.loveStatusList());

		return "diy/diy_list";
	}

	// diy 작성 
	//@Nullable
	//@InitBinder
	@PostMapping("/diy_add")
	public String diyAdd(@ModelAttribute Diy diy, 
	   @RequestParam(value="diyThumbnailFile", required = false) MultipartFile diyThumbnailFile,
	   @RequestParam(value = "diyContent1ImgFile" ,required = false) MultipartFile diyContent1ImgFile,
	   @RequestParam(value = "diyContent2ImgFile" ,required = false) MultipartFile diyContent2ImgFile,
	   @RequestParam(value = "diyContent3ImgFile" ,required = false) MultipartFile diyContent3ImgFile,
	   @RequestParam(value = "diyContent4ImgFile" ,required = false) MultipartFile diyContent4ImgFile,
	   Model model,Authentication authentication) throws IllegalStateException, IOException { 
		
	   //전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
	   String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
	      
	   //서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
	   String uploadDiyThumbnail = UUID.randomUUID().toString()+"-"+diyThumbnailFile.getOriginalFilename();
	   diy.setDiyThumbnail(uploadDiyThumbnail);
	   
	   String uploadDiyContent1 = UUID.randomUUID().toString()+"-"+diyContent1ImgFile.getOriginalFilename();
	   diy.setDiyContent1Img(uploadDiyContent1);
	   
	   String uploadDiyContent2 = UUID.randomUUID().toString()+"-"+diyContent2ImgFile.getOriginalFilename();
	   diy.setDiyContent2Img(uploadDiyContent2);
	   
	   String uploadDiyContent3 = UUID.randomUUID().toString()+"-"+diyContent3ImgFile.getOriginalFilename();
	   diy.setDiyContent3Img(uploadDiyContent3);
	   
	   String uploadDiyContent4 = UUID.randomUUID().toString()+"-"+diyContent4ImgFile.getOriginalFilename();
	   diy.setDiyContent4Img(uploadDiyContent4);
	   
	   //파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
	   diyThumbnailFile.transferTo(new File(uploadDirectory,uploadDiyThumbnail));
	   diyContent1ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent1));
	   diyContent2ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent2));
	   diyContent3ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent3));
	   diyContent4ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent4));
	   	   
	   CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
	   diy.setUserinfoId(userinfo.getId());
		
	   //테이블에 행 삽입
	   diyService.insertDiy(diy);
	   
	   return "redirect:/diy/diy_list";
	}
	
	//=============================================================================
	/*
	@InitBinder
	//@ExceptionHandler
	@PostMapping("/diy_add")
	public String diyAdd(@ModelAttribute Diy diy, 
	   Model model, HttpSession session) throws IllegalStateException, IOException { 
	   MultipartFile diyThumbnailFile = diy.getDiyThumbnail();
	   MultipartFile diyContent1ImgFile = diy.getDiyContent1Img();
	   MultipartFile diyContent2ImgFile = diy.getDiyContent2Img();
	   MultipartFile diyContent3ImgFile = diy.getDiyContent3Img();
	   MultipartFile diyContent4ImgFile = diy.getDiyContent4Img();
	   //전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
	   String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
	      
	   //서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
	   String uploadDiyThumbnail = UUID.randomUUID().toString()+"-"+diyThumbnailFile.getOriginalFilename();
	   diy.setDiyThumbnail(diyThumbnailFile);
	   
	   String uploadDiyContent1 = UUID.randomUUID().toString()+"-"+diyContent1ImgFile.getOriginalFilename();
	   diy.setDiyContent1Img(diyContent1ImgFile);
	   
	   String uploadDiyContent2 = UUID.randomUUID().toString()+"-"+diyContent2ImgFile.getOriginalFilename();
	   diy.setDiyContent2Img(diyContent2ImgFile);
	   
	   String uploadDiyContent3 = UUID.randomUUID().toString()+"-"+diyContent3ImgFile.getOriginalFilename();
	   diy.setDiyContent3Img(diyContent3ImgFile);
	   
	   String uploadDiyContent4 = UUID.randomUUID().toString()+"-"+diyContent4ImgFile.getOriginalFilename();
	   diy.setDiyContent4Img(diyContent4ImgFile);
	   
	   //파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
	   diyThumbnailFile.transferTo(new File(uploadDirectory,uploadDiyThumbnail));
	   diyContent1ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent1));
	   diyContent2ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent2));
	   diyContent3ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent3));
	   diyContent4ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent4));
	   	   
	   Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
	   diy.setUserinfoId(userinfo.getId());
		
		
	   //테이블에 행 삽입
	   diyService.insertDiy(diy);
	   
	   return "redirect:/diy/diy_list";
	}
	*/
	//=================================================================================
	
	// diy 수정 페이지 
	@GetMapping("/diy_modify/{diyIdx}")
	public String diyModify(Model model,@PathVariable("diyIdx") int diyIdx) {
		
		model.addAttribute("diyModify", diyService.selectDiy(diyIdx));
		
		return "/diy/diy_modify";
	}
	
	// diy 수정 요청  
	@GetMapping("/diy_update")
	public String diyUpdate(Diy diy) {
		
		diyService.updateDiy(diy);
		
		return "redirect:/diy/diy_list";
	}

	// diy 삭제 요청 
	@GetMapping("/diy_delete/{diyIdx}")
	public String diyDelete(@PathVariable("diyIdx") int diyIdx) {
		
		diyService.deleteDiy(diyIdx);
		
		return "redirect:/diy/diy_list";
	}
	//===============================================================================
	// 좋아요 체크 
	@ResponseBody
	@RequestMapping(value = "/loveCheck.do")
	public String diyLove(@ModelAttribute DiyLove diyLove, @ModelAttribute Diy diy) {

		diyLoveService.insertDiyLove(diyLove);
		diyService.loveCheck(diy);
		return "";
	}
	// 좋아요 취소 
	@ResponseBody
	@RequestMapping(value = "/loveCancel.do")
	public String loveCancel(@ModelAttribute DiyLove diyLove, @ModelAttribute Diy diy) {
		
		diyLoveService.deleteDiyLove(diyLove);
		diyService.loveCancel(diy);
		
		return "";
	}
	
}