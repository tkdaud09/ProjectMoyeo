package com.moyeo.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.service.PackageService;
import com.moyeo.service.UserinfoService;

import lombok.RequiredArgsConstructor;

@Controller  
@RequestMapping(value = "/admin")
public class AdminController {
   
   @Autowired
   private WebApplicationContext context;
   
   @Autowired
   private UserinfoService userinfoservice;
   
   @Autowired
	private PackageService packageService; // 패키지 등록 관련 service
   
   //관리자 메인 페이지 이동
   @GetMapping(value = "/")
   public String adminmainGET() {
      return "admin/adminmain";
   }
   
   //고객센터 페이지 이동
   @GetMapping(value = "/center")
   public String centerGET() {
      return "admin/center";
   }
   
   //유저 리스트
   @GetMapping(value = "/userlist")
    public String userList(Model model) {
        List<Userinfo> userinfoList = userinfoservice.getUserinfoList();
        model.addAttribute("userinfoList", userinfoList);
        return "admin/userlist";
    }
   
   //유저 상세 정보
   @GetMapping(value = "/userinfo")
    public String getUserInfo(@RequestParam("id") String id, Model model) throws UserinfoNotFoundException {
        Userinfo userinfo = userinfoservice.getUserinfoById(id);
        model.addAttribute("userinfo", userinfo);
        return "admin/userinfo";
    }
   
   //패키지 리스트
   @GetMapping(value = "/packagelist")
   public String packList(Model model) {
       List<Pack> packList = packageService.getPackageList();
       model.addAttribute("packList", packList);
      return "admin/packagelist";
   }
   
   /* 관리자 */
	// 패키지 등록 페이지 이동
	@RequestMapping(value = "/packageForm", method = RequestMethod.GET)
	public String addPackageGET() {
		return "package/mo_package_form";
	}

	// 패키지 등록
	@RequestMapping(value = "/addPackage", method = RequestMethod.POST)
	public String addPackagePOST(@ModelAttribute Pack pack,
			@RequestParam("packPreviewImgFile") MultipartFile packPreviewImgFile,
			@RequestParam("packSlideImg1File") MultipartFile packSlideImg1File,
			@RequestParam("packSlideImg2File") MultipartFile packSlideImg2File,
			@RequestParam("packSlideImg3File") MultipartFile packSlideImg3File,
			@RequestParam("packContentImg1File") MultipartFile packContentImg1File,
			@RequestParam("packContentImg2File") MultipartFile packContentImg2File,
			@RequestParam("packContentImg3File") MultipartFile packContentImg3File,
			@RequestParam("packCalendarImgFile") MultipartFile packCalendarImgFile,
			Model model, HttpSession session) throws IllegalStateException, IOException {
		
		if(packPreviewImgFile.isEmpty() || packSlideImg1File.isEmpty() || packSlideImg2File.isEmpty() 
				|| packSlideImg3File.isEmpty() || packContentImg1File.isEmpty() || packContentImg2File.isEmpty()
				|| packContentImg2File.isEmpty() || packContentImg3File.isEmpty() || packCalendarImgFile.isEmpty()) {
			//이미지 파일이 업로드되지 않은 경우 처리
			model.addAttribute("message","파일이 업로드되지 않았습니다.");
			return "redirect:/package/";
		}
		
		//전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
		
		//서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
		String uploadPreview = UUID.randomUUID().toString()+"-"+packPreviewImgFile.getOriginalFilename();
		pack.setPackPreviewImg(uploadPreview);
		
		String uploadSlide1 = UUID.randomUUID().toString()+"-"+packSlideImg1File.getOriginalFilename();
		pack.setPackSlideImg1(uploadSlide1);
		
		String uploadSlide2 = UUID.randomUUID().toString()+"-"+packSlideImg2File.getOriginalFilename();
		pack.setPackSlideImg2(uploadSlide2);
		
		String uploadSlide3 = UUID.randomUUID().toString()+"-"+packSlideImg3File.getOriginalFilename();
		pack.setPackSlideImg3(uploadSlide3);
		
		String uploadContent1 = UUID.randomUUID().toString()+"-"+packContentImg1File.getOriginalFilename();
		pack.setPackContentImg1(uploadContent1);
		
		String uploadContent2 = UUID.randomUUID().toString()+"-"+packContentImg2File.getOriginalFilename();
		pack.setPackContentImg2(uploadContent2);
		
		String uploadContent3 = UUID.randomUUID().toString()+"-"+packContentImg3File.getOriginalFilename();
		pack.setPackContentImg3(uploadContent3);
		
		String uploadCalendar = UUID.randomUUID().toString()+"-"+packCalendarImgFile.getOriginalFilename();
		pack.setPackCalendarImg(uploadCalendar);
		
		//파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
		packPreviewImgFile.transferTo(new File(uploadDirectory,uploadPreview));
		packSlideImg1File.transferTo(new File(uploadDirectory,uploadSlide1));
		packSlideImg2File.transferTo(new File(uploadDirectory,uploadSlide2));
		packSlideImg3File.transferTo(new File(uploadDirectory,uploadSlide3));
		packContentImg1File.transferTo(new File(uploadDirectory,uploadContent1));
		packContentImg2File.transferTo(new File(uploadDirectory,uploadContent2));
		packContentImg3File.transferTo(new File(uploadDirectory,uploadContent3));
		packCalendarImgFile.transferTo(new File(uploadDirectory,uploadCalendar));
		
		//테이블에 행 삽입
		packageService.addPackage(pack);

		return "redirect:/package/";
	}
   
}