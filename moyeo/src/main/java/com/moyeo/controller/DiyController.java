package com.moyeo.controller;


import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.security.core.Authentication;
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
import com.moyeo.dto.DiyLove;
import com.moyeo.dto.Userinfo;
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
	public String diyList() {
		return "diy/diy";
	}
	// diy 자세히보기
	@GetMapping("/diy_detail/{diyIdx}")
	public String diyDetail(@PathVariable("diyIdx") Integer diyIdx, Model model
			, Authentication authentication) {
		
		CustomUserDetails userinfo = null;
		// 비로그인시 
		if (authentication == null) {
			Diy diy = diyService.getselectDiy(diyIdx);
			model.addAttribute("diyDetail", diy);
		} else {
			// CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
			userinfo = (CustomUserDetails) authentication.getPrincipal();
			
			DiyLove diyLove = new DiyLove();
			diyLove.setDiyIdx(diyIdx);
			diyLove.setUserinfoId(userinfo.getId());
			System.out.println("세션으로 전달받은 로그인 유저 정보 : " + userinfo);
		
		
		if(diyIdx == null) {
			return "redirect:/error"; 
		}
		
		Diy diy = diyService.getselectDiy(diyIdx);
		if (diy == null) {
			return "redirect:/error"; 
		}
		
		// 로그인한 유저인 경우 isLoggedin 변수를 true로 설정
		boolean isLoggedin = userinfo != null;
		
		// 로그인 한 유저가 좋아요 눌렀는지 확인
		DiyLove diyLoveStatus = diyLoveService.getDiyLoveStatusByIdByDiyIdx(diyIdx, userinfo != null ? userinfo.getId() : null);
		boolean isLoveAdded = diyLoveStatus != null;
		
		
		model.addAttribute("diyDetail", diy);
		model.addAttribute("diyLoveStatus", diyLoveStatus);
		System.out.println("diyLoveStatus : " + diyLoveStatus);
		model.addAttribute("isLoveAdded", isLoveAdded);
		model.addAttribute("isLoggedin", isLoggedin);
		model.addAttribute("userinfo", userinfo);
			
		}
		
		return "diy/diy_detail";
	}
	
	// diy 등록 페이지 요청
	@GetMapping("/diy_add")
	public String diyAdd(Model model
			, Authentication authentication) {
		CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
		model.addAttribute("userinfo", userinfo);
		return "diy/diy_add";
	}
	
	// diy 리스트 페이지 요청
	@GetMapping("/diy_list")
	public String selectDiyList(@RequestParam Map<String, Object> map
			, Model model
			, Authentication authentication) throws DiyNotFoundException {
		
		/*
		CustomUserDetails userinfo = null;
		// 비로그인시 
		if (authentication == null) {
			model.addAttribute("diyList", diyService.getDiyList(map));
			model.addAttribute("search", map);
			
		} else {
			// CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
			userinfo = (CustomUserDetails) authentication.getPrincipal();
			
			
			DiyLove diyLove = new DiyLove();
			// diyLove.setUserinfoId(userinfo.getId());
			
		
		// 로그인한 유저인 경우 isLoggedin 변수를 true로 설정
		boolean isLoggedin = userinfo != null;
		
		// 로그인 한 유저가 좋아요 눌렀는지 확인
		//List<DiyLove> diyLoveStatus = diyLoveService.getDiyLoveStatusByIdByDiyIdxList(diyIdx, userinfo != null ? userinfo.getId() : null);
		// boolean isLoveAdded = diyLoveStatus != null;
		
	
		List<DiyLove> diyLoveStatusList = new ArrayList<DiyLove>();
		List<Boolean> isLoveAddedList = new ArrayList<Boolean>();
		
		for (int idx  : diyIdx) {
			Diy diy = diyService.getselectDiy(idx);  //diy 정보 가져옴
			diyLove.setDiyIdx(diy.getDiyIdx());
			diyLove.setUserinfoId(userinfo.getId());
			
			DiyLove diyLoveStatus = (DiyLove) diyLoveService.getDiyLoveStatusByIdByDiyIdx(idx, userinfo.getId());
			
			diyLoveStatusList.add(diyLoveStatus);
			
			
			boolean isLoveAdded = diyLoveStatusList != null;
			
			isLoveAddedList.add(isLoveAdded);
		}
		
	   model.addAttribute("diyLoveStatus",diyLoveService.getDiyLoveListById(userinfo.getId()));
		model.addAttribute("diyList", diyService.getDiyList(map));
		model.addAttribute("search", map);
		
		//model.addAttribute("diyLoveStatus", diyLoveStatusList);
		//System.out.println("diyLoveStatus : " + diyLoveStatusList);
		//model.addAttribute("isLoveAdded", isLoveAddedList);
		//model.addAttribute("isLoggedin", isLoggedin);
		model.addAttribute("userinfo", userinfo);
			
		}
		
		*/
		
		CustomUserDetails userinfo = null;
		
		if (authentication == null) {
			model.addAttribute("diyList", diyService.getDiyList(map));
			model.addAttribute("search", map);
		} else {
			
			userinfo = (CustomUserDetails) authentication.getPrincipal();
			
			model.addAttribute("diyList", diyService.getDiyList(map));
			model.addAttribute("search", map);
			model.addAttribute("userinfo", userinfo);
			System.out.println("세션으로 전달받은 로그인 유저 정보 : " + userinfo);
			
			
		}
		return "diy/diy_list";
	}

	// diy 작성 
	// @Nullable
	@PostMapping("/diy_add")
	public String diyAdd(@ModelAttribute Diy diy, 
	   @RequestParam(value="diyThumbnailFile", required = false) MultipartFile diyThumbnailFile,
	   @RequestParam(value = "diyContent1ImgFile" ,required = false) MultipartFile diyContent1ImgFile,
	   @RequestParam(value = "diyContent2ImgFile" ,required = false) MultipartFile diyContent2ImgFile,
	   @RequestParam(value = "diyContent3ImgFile" ,required = false) MultipartFile diyContent3ImgFile,
	   @RequestParam(value = "diyContent4ImgFile" ,required = false) MultipartFile diyContent4ImgFile,
	   @RequestParam(value = "diyContent5ImgFile" ,required = false) MultipartFile diyContent5ImgFile,
	   @RequestParam(value = "diyContent6ImgFile" ,required = false) MultipartFile diyContent6ImgFile,
	   @RequestParam(value = "diyContent7ImgFile" ,required = false) MultipartFile diyContent7ImgFile,
	   Model model, Authentication authentication) throws IllegalStateException, IOException { 
		
		CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
	   
		
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
	   
	   String uploadDiyContent5 = UUID.randomUUID().toString()+"-"+diyContent4ImgFile.getOriginalFilename();
	   diy.setDiyContent4Img(uploadDiyContent5);
	   
	   String uploadDiyContent6 = UUID.randomUUID().toString()+"-"+diyContent4ImgFile.getOriginalFilename();
	   diy.setDiyContent4Img(uploadDiyContent6);
	   
	   String uploadDiyContent7 = UUID.randomUUID().toString()+"-"+diyContent4ImgFile.getOriginalFilename();
	   diy.setDiyContent4Img(uploadDiyContent7);
	   
	   //파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
	   diyThumbnailFile.transferTo(new File(uploadDirectory,uploadDiyThumbnail));
	   diyContent1ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent1));
	   diyContent2ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent2));
	   diyContent3ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent3));
	   diyContent4ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent4));
	   diyContent5ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent5));
	   diyContent6ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent6));
	   diyContent7ImgFile.transferTo(new File(uploadDirectory,uploadDiyContent7));
	   

	   
	   diy.setUserinfoId(userinfo.getId());
	   model.addAttribute("userinfo",userinfo);
		
	   //테이블에 행 삽입
	   diyService.insertDiy(diy);
		
	   
	   return "redirect:/diy/diy_list";
	}
	
	// diy 수정 페이지 
	@GetMapping("/diy_modify/{diyIdx}")
	public String diyModify(Model model,@PathVariable("diyIdx") int diyIdx) {
		
		model.addAttribute("diyModify", diyService.getselectDiy(diyIdx));
		
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
		diyLoveService.deleteAllByDiyIdx(diyIdx);
		
		return "redirect:/diy/diy_list";
	}
	//===============================================================================
	// 좋아요 체크
	@PostMapping("/loveCheck")
	public ResponseEntity<String> loveCheck(@RequestParam int diyIdx, @RequestParam String userinfoId) {
	System.out.println("좋아요 체크 함수 실행");
	
		try {
			
	         DiyLove diyLove = new DiyLove();
	         diyLove.setDiyIdx(diyIdx);
	         diyLove.setUserinfoId(userinfoId);
	         diyLoveService.addDiyLove(diyLove);
	         
	         Diy diy = new Diy();
	         diy.setDiyIdx(diyIdx);
	         diy.setUserinfoId(userinfoId);
	         diyService.loveCheck(diy);
	         
	         return ResponseEntity.ok("좋아요 추가 되었습니다.");
	      } catch (Exception e) {
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("좋아요 추가에 실패했습니다.");
	      }
	}
	
	// 좋아요 취소 
	@PostMapping("/loveCancel")
	public ResponseEntity<String> loveCancel(@RequestParam String userinfoId,
	         @RequestParam(name = "loveIdx") String loveIdxStr,
	         @RequestParam int diyIdx) {
		System.out.println("좋아요 취소 함수 실행");
		
		try {
	         int loveIdx = Integer.parseInt(loveIdxStr); // 문자열을 정수로 변환
	         DiyLove diyLove = new DiyLove();
	         diyLove.setUserinfoId(userinfoId);
	         diyLove.setLoveIdx(loveIdx);
	         diyLove.setDiyIdx(diyIdx);
	         diyLoveService.removeDiyLove(diyLove);
	         
	         
	         Diy diy = new Diy();
	         diy.setDiyIdx(diyIdx);
	         diy.setUserinfoId(userinfoId);
	         diy.setLoveCount(loveIdx);
	         diyService.loveCancel(diy);
	         
	         return ResponseEntity.ok("좋아요 삭제되었습니다.");
	      } catch (NumberFormatException e) {
	         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("잘못된 요청입니다. loveIdx를 정수로 변환할 수 없습니다.");
	      } catch (Exception e) {
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("좋아요 삭제에 실패했습니다.");
	      }
	   }
	}