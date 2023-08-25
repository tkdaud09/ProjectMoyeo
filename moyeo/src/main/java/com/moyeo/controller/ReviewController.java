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

	/*
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String ReviewList(Model model) {
		return "review/review_list";
	}
	*/
	
	
	
	
	    // 글 목록 페이지를 보여주는 요청 처리 메서드
		/*
		@RequestMapping(value = "/review", method = RequestMethod.GET)
	    public String reviewList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
	        Map<String, Object> resultMap = reviewService.getReviewList(pageNum);
	        model.addAttribute("reviewList", resultMap.get("reviewList"));
	        model.addAttribute("pager", resultMap.get("pager"));
	        return "review/review_list"; // 글 목록 페이지로 이동
	    }
	    */
	
	
	
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
	    public String reviewList() {
	        return "review/review_list"; // 글 목록 페이지로 이동
	    }
		
		
		//바꿨어오!
	
		/*
		@RequestMapping(value = "/list", method = RequestMethod.GET)
	    public String reviewList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
			return "review/review_list"; // 글 목록 페이지로 이동
	    }
	    */
		
		
		
		/*
		@RequestMapping("/list")
		public String list(Model model) {
			model.addAttribute("reviewList", reviewService.getReview());
			return "review/review_list"; // 글 목록 페이지로 이동
		*/
	

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
	    @RequestMapping(value = "/view/{reviewNum}", method = RequestMethod.GET)
	    public String reviewView(@PathVariable int reviewNum, Model model) {
	        Review review = reviewService.getReview(reviewNum);
	        model.addAttribute("review", review);
	        return "review/view"; // 글 상세 조회 페이지로 이동
	    }

	    // 글 수정 화면을 보여주는 요청 처리 메서드
	    @RequestMapping(value = "/modify/{reviewNum}", method = RequestMethod.GET)
	    public String showModifyForm(@PathVariable int reviewNum, Model model) {
	        Review review = reviewService.getReview(reviewNum);
	        model.addAttribute("review", review);
	        return "review/modify"; // 글 수정 화면으로 이동
	    }

	    // 글 수정 처리
	    @RequestMapping(value = "/modify", method = RequestMethod.POST)
	    public String modifyReview(Review review) {
	        reviewService.modifyReview(review);
	        return "redirect:/review/view/" + review.getReviewNum(); // 수정한 글 상세 조회 페이지로 이동
	    }

	    // 글 삭제 처리
	    @RequestMapping(value = "/remove/{reviewNum}", method = RequestMethod.GET)
	    public String removeReview(@PathVariable int reviewNum) {
	        reviewService.removeReview(reviewNum);
	        return "redirect:/review/review_list"; // 글 목록 페이지로 이동
	    }
	
	

	

	
	 
	 
	    
	    

	/*
	//페이지 번호를 전달받아 게시글 목록 검색
	@GetMapping("/review_list")
	public Map<String, Object> reviewList(@RequestParam(defaultValue = "1") int pageNum){
		return reviewService.getReviewList(pageNum);
	}
	
	
	//게시글을 전달받아 삽입
	@PostMapping("/review_add")
	public String reviewAdd(@RequestBody Review review){
		review.setReviewContent(HtmlUtils.htmlEscape(review.getReviewContent()));
		reviewService.addReview(review);
		return "success"; 
	}
	
	//글번호를 전달받아 review 테이블에 저장된 해당 글번호를 검색
	@GetMapping("/review_view/{reviewIdx}")
	public Review reviewView(@PathVariable int reviewIdx) {
		return reviewService.getReview(reviewIdx);
	}
	
	//게시글을 전달받아 변경
	@PutMapping("/board_modify/{reviewIdx}")
	public String reviewModify(@RequestBody Review review) {
		review.setReviewContent(HtmlUtils.htmlEscape(review.getReviewContent()));
		review.setReviewTitle(HtmlUtils.htmlEscape(review.getReviewTitle()));
		reviewService.modifyReview(review);
		return "success";
	}
	
	
	//글 번호를 전달받아 삭제
	@DeleteMapping("/review_remove/{idx}")
	public String reviewRemove(@PathVariable int reviewIdx) {
		reviewService.removeReview(reviewIdx);
		return "redirect:/review/review_list";
	}
	

	*/
	
	
	
}

    

