package com.moyeo.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Autowired
	private final WebApplicationContext context;
	@Autowired
	private final DiyService diyService;
	
	// diy 페이지 요청
	@GetMapping("/diy")
	public String diyList() {
		return "diy/diy";
	}
	// diy 자세히보기
	@GetMapping("/diy_detail/{diyIdx}")
	public String diyDetail(@PathVariable("diyIdx") int diyIdx, Model model) {
        
        //Diy diyDetail = diyService.selectDiy(diyIdx);
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
	public String selectDiyList(Model model) throws DiyNotFoundException {
		System.out.println(diyService.selectDiyList());
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
	
	/*@PostMapping("/diy_add")
	public String diyAdd (@ModelAttribute("diy") Diy diy, HttpSession session, Model model,
			@RequestParam("diyThumbnail") MultipartFile diyThumbnail,
	         @RequestParam("diyContent1Img") MultipartFile diyContent1Img, 
	         @RequestParam("diyContent2Img") MultipartFile diyContent2Img,
	         @RequestParam("diyContent3Img") MultipartFile diyContent3Img,
	         @RequestParam("diyContent4Img") MultipartFile diyContent4Img) throws Exception {
		if (diyThumbnail.isEmpty() || diyContent4Img.isEmpty() || diyContent2Img.isEmpty()
				|| diyContent3Img.isEmpty() || diyContent4Img.isEmpty()) {
			// 이미지 파일이 업로드되지 않은 경우 처리
			model.addAttribute("message", "파일이 업로드되지 않았습니다.");
			return "redirect:/diy_add/";
		}
		
	      //전달파일을 저장하기 위한 서버 디렉토리의시스템 경로 반환
	      String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
	      
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
	
		return "redirect:/diy/diy_list";
	}*/
	
	@PostMapping("/diy_add")
	public String diyAdd(@ModelAttribute Diy diy, 
	   @RequestParam("diyThumbnailFile") MultipartFile diyThumbnailFile,
	   @RequestParam("diyContent1ImgFile") MultipartFile diyContent1ImgFile,
	   @RequestParam("diyContent2ImgFile") MultipartFile diyContent2ImgFile,
	   @RequestParam("diyContent3ImgFile") MultipartFile diyContent3ImgFile,
	   @RequestParam("diyContent4ImgFile") MultipartFile diyContent4ImgFile,
	   Model model, HttpSession session) throws IllegalStateException, IOException { 

	   if(diyThumbnailFile.isEmpty() || diyContent1ImgFile.isEmpty() || diyContent2ImgFile.isEmpty() || diyContent3ImgFile.isEmpty() || diyContent4ImgFile.isEmpty()){
	      //이미지 파일이 업로드되지 않은 경우 처리
	      model.addAttribute("message","파일이 업로드되지 않았습니다.");
	      return "redirect:/diy_add/";
	   }

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
	   	   
	   Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
	   diy.setUserinfoId(userinfo.getId());
		
		
	   //테이블에 행 삽입
	   diyService.insertDiy(diy);
	   
	   return "redirect:/diy/diy_list";
	}
	
	//=================================================================================
	@GetMapping("/diy_modify/{diyIdx}")
	public String diyUpdate(HttpSession session, Diy diy, Model model,@PathVariable("diyIdx") int diyIdx, String userinfoId) {
		
		Userinfo loginId = (Userinfo)session.getAttribute("userinfo");
		model.addAttribute("loginId",loginId);
		Diy diyId = diyService.getUserinfoById(userinfoId);
		model.addAttribute("diy", diyId);
		
		model.addAttribute("diyModify", diyService.selectDiy(diyIdx));
		
		diyService.updateDiy(diy);
		return "redirect:/diy/diy_detail";
	}

	@GetMapping("/diy_delete")
	public String diyDelete(HttpSession session, int diyIdx, Model model, String userinfoId) {
		
		Userinfo loginId = (Userinfo)session.getAttribute("userinfo");
		model.addAttribute("loginId",loginId);
		Diy diyId = diyService.getUserinfoById(userinfoId);
		model.addAttribute("userinfoId", diyId);
		
		diyService.deleteDiy(diyIdx);
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









































