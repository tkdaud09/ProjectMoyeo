package com.moyeo.controller;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import com.moyeo.dto.Review;
import com.moyeo.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
	
	private final WebApplicationContext context; //파일 업로드
    private final ReviewService reviewService; //후기 관련 서비스
    
    // 리뷰 목록 조회 페이지로 이동
    @RequestMapping("/list")
	public String list(@RequestParam Map<String, Object> map, Model model) {
		 model.addAttribute("result", reviewService.getReviewList(map));
		 model.addAttribute("search", map);
		 return "review/review_list";
	}

    
 
	// 리뷰 작성 페이지로 이동(GET 요청)
    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String write(Model model) {
        List<String> packageTitles = reviewService.getAllPackageTitles(); //패키지 타이틀
        model.addAttribute("packageTitles", packageTitles);
        return "review/write";
    }
	

	// 리뷰 작성 처리(POST 요청)
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute Review review, @RequestParam("reviewImgFile") MultipartFile reviewImgFile, HttpServletRequest request) {
	    review.setReviewTitle(HtmlUtils.htmlEscape(review.getReviewTitle()));
	    review.setReviewContent(HtmlUtils.htmlEscape(review.getReviewContent()));
	    
	    // 전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
	    String uploadDirectory = request.getServletContext().getRealPath("/resources/assets/img/upload");
	
	    // 서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
	    String uploadReview = UUID.randomUUID().toString() + "-" + reviewImgFile.getOriginalFilename();
	    review.setReviewImg(uploadReview);
	
	    try {
	        // 파일 업로드 처리
	        reviewImgFile.transferTo(new File(uploadDirectory, uploadReview));
	    } catch (IOException e) {
	        // 파일 업로드 중 오류 처리
	        e.printStackTrace();
	        // 오류 처리 로직 추가
	        return "errorPage"; // 오류 페이지로 리다이렉트
	    }
	
	    reviewService.addReview(review);
	    return "redirect:/review/list";
	}
	

	
	
	/*
	// 리뷰 상세 보기 페이지로 이동 + 조회수
	@RequestMapping("/view")
	public String view(@RequestParam Map<String, Object> map, Model model) {
	    int reviewIdx = Integer.parseInt((String) map.get("reviewIdx"));

	    reviewService.viewcntReview(reviewIdx);

	    model.addAttribute("review", reviewService.getselectReviewByIdx(reviewIdx));
	    model.addAttribute("search", map);

	    return "review/view";
	}
    */
	
	
	
	// 리뷰 상세 보기 페이지로 이동 + 조회수
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(@RequestParam Map<String, Object> map, Model model) {
	    int reviewIdx = Integer.parseInt((String) map.get("reviewIdx"));

	    // 조회수 증가 메서드를 호출. 리뷰 조회수 증가
	    reviewService.viewcntReview(reviewIdx);

	    // 리뷰 정보
	    Review review = reviewService.getselectReviewByIdx(reviewIdx);
	    model.addAttribute("review", review);

	  /*  // 선택한 패키지 제목
	    String packTitle = review.getPackTitle();
	    model.addAttribute("packTitle", packTitle);*/

	    model.addAttribute("search", map);

	    return "review/view";
	}


	

	 
	// 리뷰 수정 페이지로 이동(GET 요청)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam Map<String, Object> map, Model model) {
	    int reviewIdx = Integer.parseInt((String) map.get("reviewIdx"));
	    model.addAttribute("review", reviewService.getselectReviewByIdx(reviewIdx));

	    // 패키지 타이틀 목록을 가져와서 모델에 추가
	    List<String> packageTitles = reviewService.getAllPackageTitles();
	    model.addAttribute("packageTitles", packageTitles);

	    model.addAttribute("search", map);
	    return "review/modify";
	}


	
	
	
	// 리뷰 수정 처리(POST 요청)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute Review review, @RequestParam("reviewImgFile") MultipartFile reviewImgFile,
	                    @RequestParam Map<String, Object> map) { 

	    review.setReviewTitle(HtmlUtils.htmlEscape(review.getReviewTitle()));
	    review.setReviewContent(HtmlUtils.htmlEscape(review.getReviewContent()));
	    
	    // 이미지 파일이 업로드되었는지 확인
	    if (!reviewImgFile.isEmpty()) {
	        // 파일이 업로드된 경우
	        String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
	        String uploadNotice = UUID.randomUUID().toString() + "-" + reviewImgFile.getOriginalFilename();
	        review.setReviewImg(uploadNotice);
	        try {
	            reviewImgFile.transferTo(new File(uploadDirectory, uploadNotice));
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 파일 업로드 중 오류 처리
	            return "errorPage"; // 오류 페이지로 리다이렉트
	        }
	    } else {
	        // 파일이 업로드되지 않은 경우, 기존 이미지 경로를 유지
	        review.setReviewImg(reviewService.getselectReviewByIdx(review.getReviewIdx()).getReviewImg());
	    }

	    reviewService.modifyReview(review);

	    String pageNum = (String) map.get("pageNum");
	    String column = (String) map.get("column");
	    String keyword = (String) map.get("keyword");
	    return "redirect:/review/view?reviewIdx=" + review.getReviewIdx() + "&pageNum=" + pageNum
	            + "&column=" + column + "&keyword=" + keyword;
	}

	
	
	
	
	
	
	// 리뷰 삭제 처리(GET 요청)
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam int idx, @RequestParam String writer) {
		reviewService.removeReview(idx);
		return "redirect:/review/list";
	}

    
}
