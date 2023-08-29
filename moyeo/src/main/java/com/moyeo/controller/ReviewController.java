package com.moyeo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moyeo.dto.Review;
import com.moyeo.service.ReviewService;

import lombok.RequiredArgsConstructor;

import org.springframework.ui.Model;

@Controller
@RequestMapping(value = "/review")
@RequiredArgsConstructor
public class ReviewController {
	private final ReviewService reviewService;


	
	    // 글 목록 페이지를 보여주는 요청 처리 메서드
	 	@RequestMapping(value = "/list", method = RequestMethod.GET)
	    public String reviewList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
	 		Map<String, Object> resultMap = reviewService.getReviewList(pageNum);
	        model.addAttribute("reviewList", resultMap.get("reviewList"));
	        model.addAttribute("pager", resultMap.get("pager"));
	        return "review/review_list"; // 글 목록 페이지로 이동
	    }
	
	

	 	
	 	
	/*
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
	    public String reviewList() {
	        return "review/review_list"; // 글 목록 페이지로 이동
	    }
		*/
		
		//바꿨어오!
	
	

	    // 글 작성 화면으로 이동
		@RequestMapping(value = "/write", method = RequestMethod.GET)
	    public String showWriteForm(Model model) {
	        return "review/write"; // 글 작성 화면으로 이동
	    }

	    // 글 작성 처리
		@RequestMapping(value = "/add", method = RequestMethod.POST)
	    public String addReview(Review review) {
	        reviewService.addReview(review);
	        return "redirect:/review/list"; // 작성한 글 목록 페이지로 이동
	    }

	    // 글 상세 조회 페이지를 보여주는 요청 처리 메서드
	    @RequestMapping(value = "/view/{reviewIdx}", method = RequestMethod.GET)
	    public String reviewView(@PathVariable int reviewIdx, Model model) {
	        Review review = reviewService.getReview(reviewIdx);
	        model.addAttribute("review", review);
	       // model.addAttribute("reviewRegdate", review.getReviewRegdate());
	        return "review/view"; // 글 상세 조회 페이지로 이동
	    }
	    

	    

	    // 글 수정 화면을 보여주는 요청 처리 메서드
	    @RequestMapping(value = "/modify/{reviewIdx}", method = RequestMethod.GET)
	    public String showModifyForm(@PathVariable int reviewIdx, Model model) {
	        Review review = reviewService.getReview(reviewIdx);
	        model.addAttribute("review", review);
	        return "review/modify"; // 글 수정 화면으로 이동
	    }

	    // 글 수정 처리
	    @RequestMapping(value = "/modify", method = RequestMethod.POST)
	    public String modifyReview(Review review) {
	        reviewService.modifyReview(review);
	        return "redirect:/review/view/" + review.getReviewIdx(); // 수정한 글 상세 조회 페이지로 이동
	    }

	    
	    
	    // 글 삭제 처리
	    
	    /* @RequestMapping(value = "/remove/{reviewIdx}", method = RequestMethod.GET)
	    public String removeReview(@PathVariable int reviewIdx) {
	        reviewService.removeReview(reviewIdx);
	        return "redirect:/review/list"; 
	    }
	    */
	    
	    
	    @RequestMapping(value = "/delete/{reviewIdx}", method = RequestMethod.DELETE)
        public String removeReview(@PathVariable int reviewIdx) {
            reviewService.removeReview(reviewIdx);
            return "redirect:/review/list";
        }

	    
	    
	    
	  

	    
	 
	

	
	 
	 
	    
	
	
	
}

    

