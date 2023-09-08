package com.moyeo.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Userinfo;
import com.moyeo.service.PackageService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/package")
public class PackageController {

	private final WebApplicationContext context;

	@Autowired
	private PackageService packageService; // 패키지 등록 관련 service

	// 패키지 리스트 페이지 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String packageMainGET(Model model) {
		model.addAttribute("packList", packageService.getPackageList());
		System.out.println();
		return "package/mo_package";
	}

	// 패키지 상세 페이지 이동 - 패키지 상세 정보 select
	@RequestMapping(value = "/detail/{packIdx}", method = RequestMethod.GET) // Spring에서 사용자가 전송한 식별자 값을 변수로 인식하기 위해 템플릿
	// 변수{packIdx}작성
	public String packageDetailGET(@PathVariable("packIdx") int packIdx, Model model) {
		model.addAttribute("pack", packageService.selectPackInfo(packIdx));

		return "package/mo_package_animal";
	}
	
	/* 관리자 */
	// 패키지 등록 페이지 이동
	@RequestMapping(value = "/form", method = RequestMethod.GET)
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


	/* 패키지 상품 정보 수정 */
	@RequestMapping(value = "/packinfoModify", method = RequestMethod.POST)
	public String packinfoModify(Pack pack, RedirectAttributes rttr) {
		int result = packageService.updatePackage(pack);

		rttr.addFlashAttribute("modify_result", result);

		return "redirect:/package/";
	}

}