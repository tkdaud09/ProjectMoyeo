package com.moyeo.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moyeo.service.UserinfoService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminRestController {
	private final UserinfoService userinfoService;
	
	
	@GetMapping("userinfo-list")
	public Map<String, Object> getUserinfos(@RequestParam(defaultValue = "1") int pageNum, 
											@RequestParam(defaultValue = "20") int pageSize, 
											@RequestParam(defaultValue = "") String selectKeyword) {
		return userinfoService.getUserinfoList(pageNum, pageSize, selectKeyword);
	}
	
	
	/*
	@GetMapping("/account_details")
	public Map<String, Object> getMyAccounts(@RequestParam String id, @RequestParam int questionPageNum,
			@RequestParam int donationPageNum, @RequestParam int wishPageNum) {
		Map<String, Object> myWish;
		myWish = wishService.getMyWishList(wishPageNum, id);
		Map<String, Object> myQuestion;
		myQuestion = questionService.getMyQuestionList(questionPageNum, id);
		Map<String, Object> myDonation;
		myDonation = donationService.getMyDonationList(donationPageNum, id);
		Map<String, Object> myMap = new HashMap<String, Object>();
		myMap.put("myWish", myWish);
		myMap.put("myQuestion", myQuestion);
		myMap.put("myDonation", myDonation);
		return myMap;
	}
	*/
	
}	
