package com.moyeo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyeo.dto.Review;
import com.moyeo.service.ReviewService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService reviewService;

    // 글 목록 페이지를 보여주는 요청 처리 메서드
    @GetMapping("/list")
    public String reviewList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
        Map<String, Object> resultMap = reviewService.getReviewList(pageNum);
        model.addAttribute("reviewList", resultMap.get("reviewList"));
        model.addAttribute("pager", resultMap.get("pager"));
        return "review/review_list"; // 글 목록 페이지로 이동
    }

    // 글 작성 화면으로 이동
    @GetMapping("/write")
    public String showWriteForm(Model model) {
        return "review/write"; // 글 작성 화면으로 이동
    }

    // 글 작성 처리
    @PostMapping("/add")
    public String addReview(@ModelAttribute Review review) {
        reviewService.addReview(review);
        return "redirect:/review/list"; // 작성한 글 목록 페이지로 이동
    }

    // 글 상세 조회 페이지를 보여주는 요청 처리 메서드
    @GetMapping("/view/{reviewIdx}")
    public String reviewView(@PathVariable int reviewIdx, Model model) {
        Review review = reviewService.getReview(reviewIdx);
        model.addAttribute("review", review);
        return "review/view"; // 글 상세 조회 페이지로 이동
    }

    // 리뷰 수정 페이지 표시
    @GetMapping("/modify/{reviewIdx}")
    public String showModifyForm(@PathVariable int reviewIdx, Model model) {
        Review review = reviewService.getReview(reviewIdx);
        model.addAttribute("review", review);
        return "review/modify"; // 리뷰 수정 페이지로 이동
    }

    // 리뷰 수정 처리
    @PostMapping("/modify")
    public String modifyReview(@ModelAttribute Review review) {
        reviewService.modifyReview(review);
        return "redirect:/review/view/" + review.getReviewIdx(); // 수정된 리뷰 페이지로 이동
    }


    // 글 삭제 처리
    @DeleteMapping("/delete/{reviewIdx}")
    public String removeReview(@PathVariable int reviewIdx) {
        reviewService.removeReview(reviewIdx);
        return "redirect:/review/list";
    }
}
