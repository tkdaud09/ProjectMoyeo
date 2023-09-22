package com.moyeo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.moyeo.dto.Qa;
import com.moyeo.dto.QaReply;
import com.moyeo.security.CustomUserDetails;
import com.moyeo.service.QaReplyService;
import com.moyeo.service.QaService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/qa")
public class QaController {
	private final WebApplicationContext context;

	@Autowired
	private QaService qaService;

	@Autowired
	private QaReplyService qaReplyService;

	// 1:1 문의 상세 페이지로 이동
	@GetMapping(value = "/detail/{qaIdx}")
	public String qaDetailGET(@PathVariable("qaIdx") int qaIdx, Model model, Authentication authentication) {
		CustomUserDetails userinfo = null;

		if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetails) {
			userinfo = (CustomUserDetails) authentication.getPrincipal();
		}

		Qa qa = qaService.getQaInfo(qaIdx);
		model.addAttribute("qa", qa);

		List<QaReply> reply = null;
		reply = qaReplyService.getQaReplyList(qaIdx);

		model.addAttribute("reply", reply);
		model.addAttribute("userinfo", userinfo);

		return "qa/qa_view";
	}

	// 1:1 문의 리스트 페이지로 이동
	/*
	 * @GetMapping(value = "/list") public String qaListGET(Model model) {
	 * model.addAttribute("qaList", qaService.getQaList()); System.out.println();
	 * return "qa/qa_list"; }
	 */

	// 1:1 문의 리스트 페이지로 이동 - 페이징 처리
	@GetMapping(value = "/list")
	public String qaListGET(@RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "10") int pageSize, @RequestParam(required = false) String searchKeyword,
			@RequestParam(required = false) String searchType, Model model) {
		Map<String, Object> resultMap = qaService.getQaList(pageNum, pageSize, searchKeyword, searchType);

		model.addAttribute("qaList", resultMap.get("qaList"));
		model.addAttribute("pager", resultMap.get("pager"));
		return "qa/qa_list";
	}

	/* 등록 */

	// 1:1 문의 작성 페이지로 이동
	@GetMapping(value = "/write")
	public String addQaGET(Authentication authentication, Model model) {

		CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();

		model.addAttribute("userinfo", userinfo);

		return "qa/qa_write";
	}

	// 1:1 문의 등록
	@PostMapping(value = "/addQa")
	public String addQaPOST(@ModelAttribute Qa qa, @RequestParam("qaImgFile1") MultipartFile qaImgFile1,
			@RequestParam("qaImgFile2") MultipartFile qaImgFile2, @RequestParam("qaImgFile3") MultipartFile qaImgFile3,
			Model model) throws IllegalStateException, IOException {

		// 전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

		// 서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
		String uploadImg1 = UUID.randomUUID().toString() + "-" + qaImgFile1.getOriginalFilename();
		qa.setQaImg1(uploadImg1);

		String uploadImg2 = UUID.randomUUID().toString() + "-" + qaImgFile2.getOriginalFilename();
		qa.setQaImg2(uploadImg2);

		String uploadImg3 = UUID.randomUUID().toString() + "-" + qaImgFile3.getOriginalFilename();
		qa.setQaImg3(uploadImg3);

		// 파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
		qaImgFile1.transferTo(new File(uploadDirectory, uploadImg1));
		qaImgFile2.transferTo(new File(uploadDirectory, uploadImg2));
		qaImgFile3.transferTo(new File(uploadDirectory, uploadImg3));

		// 테이블에 행 삽입
		qaService.addQa(qa);

		return "redirect:/qa/list/";
	}

	/* 수정 */

	// 1:1 문의 수정 페이지로 이동
	@GetMapping(value = "/modify/{qaIdx}")
	public String qaModifyGET(@PathVariable("qaIdx") int qaIdx, Model model,Authentication authentication) {
		
		CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
		
		Qa qa = qaService.getQaInfo(qaIdx);
		
		model.addAttribute("qa", qa);
		model.addAttribute("userinfo", userinfo);
		return "qa/qa_modify";
	}

	// 1:1 문의 수정 - POST

//	@PostMapping(value = "/modify/{qaIdx}") 
//	public String qaModifyPOST(@PathVariable("qaIdx") int qaIdx, @ModelAttribute Qa qa) {
//		qaService.modifyQa(qa); 
//		return "redirect:/qa/detail/{qaIdx}"; 
//	}

	// 1:1 문의 수정 - POST
	@PostMapping(value = "/modify/{qaIdx}")
	public String qaModifyPOST(@PathVariable("qaIdx") int qaIdx, @ModelAttribute Qa qa,
			@RequestParam("qaImgFile1") MultipartFile qaImgFile1, @RequestParam("qaImgFile2") MultipartFile qaImgFile2,
			@RequestParam("qaImgFile3") MultipartFile qaImgFile3, Model model, HttpSession session)
			throws IllegalStateException, IOException {

		String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

		// 기존 이미지 경로 가져오기
		Qa originalQa = qaService.getQaInfo(qaIdx);
		String originalImg1 = originalQa.getQaImg1();
		String originalImg2 = originalQa.getQaImg2();
		String originalImg3 = originalQa.getQaImg3();

		if (!qaImgFile1.isEmpty()) {
			qa.setQaImg1(UUID.randomUUID().toString() + "-" + qaImgFile1.getOriginalFilename());
			qaImgFile1.transferTo(new File(uploadDirectory, qa.getQaImg1()));
		} else {
			// 이미지를 수정하지 않은 경우 기존 이미지 경로 유지
			qa.setQaImg1(originalImg1);
		}

		if (!qaImgFile2.isEmpty()) {
			qa.setQaImg2(UUID.randomUUID().toString() + "-" + qaImgFile2.getOriginalFilename());
			qaImgFile2.transferTo(new File(uploadDirectory, qa.getQaImg2()));
		} else {

			qa.setQaImg2(originalImg2);
		}

		if (!qaImgFile3.isEmpty()) {
			qa.setQaImg3(UUID.randomUUID().toString() + "-" + qaImgFile3.getOriginalFilename());
			qaImgFile3.transferTo(new File(uploadDirectory, qa.getQaImg3()));
		} else {

			qa.setQaImg3(originalImg3);
		}

		// 테이블에 행 업데이트
		qaService.modifyQa(qa);

		return "redirect:/qa/detail/{qaIdx}";
	}

	/* 삭제 */

	@GetMapping("/delete/{qaIdx}")
	public String removeQaPOST(@PathVariable("qaIdx") int qaIdx) {
		qaService.removeQa(qaIdx);
		return "redirect:/qa/list";
	}
}