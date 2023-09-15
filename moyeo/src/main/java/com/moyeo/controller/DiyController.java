package com.moyeo.controller;


import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Nullable;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.moyeo.dto.Diy;
import com.moyeo.dto.DiyLove;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.DiyNotFoundException;
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
	public String diyList() {
		return "diy/diy";
	}
	// diy 자세히보기
	@GetMapping("/diy_detail/{diyIdx}")
	@ResponseBody
	@Nullable
	public String diyDetail(@PathVariable("diyIdx") int diyIdx,DiyLove diyLove, Model model, HttpSession session) {
		
		Userinfo userinfo = (Userinfo)session.getAttribute("userinfo");
		diyLove.setUserinfoId(userinfo.getId());
		// model.addAttribute("loginId",loginId);
		model.addAttribute("loveStatus",diyLoveService.loveStatus());
		
		Diy diyId = diyService.getUserinfoById(diyIdx);
		model.addAttribute("diyId", diyId);
        
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
	public String selectDiyList(@RequestParam(defaultValue = "1", value = "pager",required = false) int pageNum, Model model) throws DiyNotFoundException {
		Map<String, Object> resultMap = diyService.selectDiyList(pageNum);
		model.addAttribute("diyList", resultMap.get("diyList"));
		model.addAttribute("pager", resultMap.get("pager"));
		// model.addAttribute("diyCount", diyService.selectDiyListCount());
		return "diy/diy_list";
	}
	
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
	}
	*/

	@Nullable
	@PostMapping("/diy_add")
	public String diyAdd(@ModelAttribute Diy diy, 
	   @RequestParam("diyThumbnailFile") MultipartFile diyThumbnailFile,
	   @RequestParam("diyContent1ImgFile") MultipartFile diyContent1ImgFile,
	   @RequestParam("diyContent2ImgFile") MultipartFile diyContent2ImgFile,
	   @RequestParam("diyContent3ImgFile") MultipartFile diyContent3ImgFile,
	   @RequestParam("diyContent4ImgFile") MultipartFile diyContent4ImgFile,
	   Model model, HttpSession session) throws IllegalStateException, IOException { 

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
	public String diyModify(Model model,@PathVariable("diyIdx") int diyIdx) {
		
		model.addAttribute("diyModify", diyService.selectDiy(diyIdx));
		
		return "/diy/diy_modify";
	}
	
	@GetMapping("/diy_update")
	public String diyUpdate(Diy diy) {
		
		diyService.updateDiy(diy);
		
		return "redirect:/diy/diy_list";
	}

	@GetMapping("/diy_delete/{diyIdx}")
	public String diyDelete(@PathVariable("diyIdx") int diyIdx) {
		
		diyService.deleteDiy(diyIdx);
		
		return "redirect:/diy/diy_list";
	}
	//===============================================================================
	// 좋아요 체크 
	@RequestMapping(value = "/loveCheck.do")
	public String diyLove(@ModelAttribute DiyLove diyLove, @ModelAttribute Diy diy, HttpSession session) {
		
//		Userinfo userinfo=(Userinfo)session.getAttribute("userinfo");
//		diyLove.setUserinfoId(userinfo.getId());
		
		diyLoveService.insertDiyLove(diyLove);
		diyService.loveCheck(diy);
		return "diy/diy_list";
	}
	// 좋아요 취소 
	@RequestMapping(value = "/loveCancel.do")
	public String loveCancel(@ModelAttribute DiyLove diyLove, @ModelAttribute Diy diy) {
		
		diyLoveService.deleteDiyLove(diyLove);
		diyService.loveCancel(diy);
		
		return "diy/diy_list";
	}
	
}
