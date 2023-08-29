package com.moyeo.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.moyeo.dto.Diy;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.DiyNotFoundException;
import com.moyeo.service.DiyService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/diy")
@RequiredArgsConstructor
public class DiyController {
	private final WebApplicationContext context;
	private final DiyService diyService;
	
	// diy 페이지 요청
	@GetMapping("/diy")
	public String diyList() {
		return "diy/diy";
	}
	// diy 자세히보기
	@PostMapping("/diy_detail")
	public String diyDetail(Model model,@RequestParam(name = "diyIdx", required = false) Integer diyIdx) {
		model.addAttribute("diyDetail", diyService.selectDiy(diyIdx));
		return "diy/diy_detail";
	}
	// diy 등록 페이지 요청
	@GetMapping("/diy_add")
	public String diyAdd() {
		return "diy/diy_add";
	}
	//================================================================
	
	// diy 리스트 페이지 요청
	@GetMapping("/diy_list")
	public String selectDiyList(Model model) {
		
		model.addAttribute("diyList", diyService.selectDiyList());
		return "diy/diy_list";
	}
	/*
	// 목록으로 이동
	@PostMapping("/diy_list")
	public String diyList(Model model) {
		// return "diy/diy_form";
		
		return "diy/diy_list";
	}
	*/
	//================================================================
	/*  add 
	@PostMapping("/diy_add")
	public String diyAdd (@RequestParam List<MultipartFile> uploadImgList, Diy diy, HttpSession session) throws Exception {
		
		List<String> imgIdxList = new ArrayList<String>();
		// model.addAttribute(null, model);
		
		for(MultipartFile multipartFile : uploadImgList) {
			if(!multipartFile.getContentType().equals("image/jpeg")) {
				return "사진 파일을 jpeg로 변경해주세요 ";  
			}
		
		String uploadPath = context.getServletContext().getRealPath("/WEB-INF/img");
		String imgIdx = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		File file = new File(uploadPath, imgIdx);
		
		multipartFile.transferTo(file);
		
		imgIdxList.add(imgIdx);
		
		}
		
		//========================================================================
		Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
		diy.setUserinfoId(userinfo.getId());
		diyService.insertDiy(diy);
	
		return "redirect:/diy//diy_detail";
	}
	*/
	//=================================================================================
	@PostMapping("/diy_add")
	public String diyAdd (@ModelAttribute("diy") Diy diy, HttpSession session, 
			@RequestParam("diyThumbnail") MultipartFile diyThumbnail,
	         @RequestParam("mainMultipartFile") MultipartFile diyContent1Img, 
	         @RequestParam("diyContent1Img") MultipartFile diyContent2Img,
	         @RequestParam("diyContent3Img") MultipartFile diyContent3Img,
	         @RequestParam("diyContent4Img") MultipartFile diyContent4Img) throws Exception {
		
	      //전달파일을 저장하기 위한 서버 디렉토리의시스템 경로 반환
	      String uploadDirectory = context.getServletContext().getRealPath("/assets/img/upload");
	      
	      //서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
	      String uploadDiyThumbnail=UUID.randomUUID().toString()+"-"+diyThumbnail.getOriginalFilename();
	      diy.setDiyThumbnail(uploadDiyThumbnail);
	      
	      String uploadDiyContent1Img=UUID.randomUUID().toString()+"-"+diyContent1Img.getOriginalFilename();
	      diy.setDiyContent1Img(uploadDiyContent1Img);
	      
	      String uploadDiyContent2Img=UUID.randomUUID().toString()+"-"+diyContent2Img.getOriginalFilename();
	      diy.setDiyContent2Img(uploadDiyContent2Img);
	      
	      String uploadDiyContent3Img=UUID.randomUUID().toString()+"-"+diyContent3Img.getOriginalFilename();
	      diy.setDiyContent3Img(uploadDiyContent3Img);
	      
	      String uploadDiyContent4Img=UUID.randomUUID().toString()+"-"+diyContent4Img.getOriginalFilename();
	      diy.setDiyContent4Img(uploadDiyContent4Img);
	      
	      
	      //파일 업로드 처리 - 복붙해서 넣어주는 게 아니라 서버에 넣어줌
	      diyThumbnail.transferTo(new File(uploadDirectory,uploadDiyThumbnail));
	      diyContent1Img.transferTo(new File(uploadDirectory,uploadDiyContent1Img));
	      diyContent2Img.transferTo(new File(uploadDirectory,uploadDiyContent2Img));
	      diyContent3Img.transferTo(new File(uploadDirectory,uploadDiyContent3Img));
	      diyContent4Img.transferTo(new File(uploadDirectory,uploadDiyContent4Img));
		
		//========================================================================
		Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
		diy.setUserinfoId(userinfo.getId());
		diyService.insertDiy(diy);
	
		return "redirect:/diy/diy_detail";
	}
	
	//=================================================================================
	@PostMapping("/diy_modify")
	public String diyUpdate(Diy diy, Model model) {
		diyService.updateDiy(diy);
		model.addAttribute("diy_detail", diy);
		return "redirect:/diy/diy_detail";
	}

	@PostMapping("/diy_delete")
	public String diyDelete(int diyIdx, Model model) throws DiyNotFoundException {
		diyService.deleteDiy(diyIdx);
		List<Diy> selectDiyList = diyService.selectDiyList();
		model.addAttribute("diy_List", selectDiyList);
		return "return:/diy/diy_list";
	}
	
	//============================================

	
	/*
	// 파일 업로드 구현
	@PostMapping("/uploadFile")
	public String uploadFile(@RequestParam String uploaderName, 
			@RequestParam List<MultipartFile> uploadList, Model model) throws IOException{
		
	}
		// 사진..?
	*/
}









































