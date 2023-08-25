package com.moyeo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

import com.moyeo.service.ReviewService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/rest")
@RequiredArgsConstructor
public class ReviewRestController {
	
	/*
	private final ReviewService reviewService;

	 @GetMapping
    public Map<String, Object> getReview(@RequestParam(defaultValue = "1") int pageNum,
                                         @RequestParam(defaultValue = "10") int pageSize,
                                         @RequestParam(defaultValue = "") String selectKeyword) {
        return reviewService.getReviewList(pageNum);
    }
    */
}

    

