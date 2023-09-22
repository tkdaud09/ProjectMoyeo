package com.moyeo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.service.DiyService;
import com.moyeo.service.EventService;
import com.moyeo.service.NoticeService;
import com.moyeo.service.PackageHeartService;
import com.moyeo.service.PackageService;
import com.moyeo.service.QaService;
import com.moyeo.service.ReviewService;
import com.moyeo.service.UserinfoService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminRestController {
	private final UserinfoService userinfoService;
	private final PackageService packageService;
	private final QaService qaService;
	private final DiyService diyService;
	private final ReviewService reviewService;
	private final PackageHeartService packageHeartService;
	private final NoticeService noticeService;
	private final EventService eventService;
	
	@GetMapping("/userinfo-list")
	public Map<String, Object> getUserinfos(@RequestParam(defaultValue = "1") int pageNum, 
											@RequestParam(defaultValue = "20") int pageSize, 
											@RequestParam(defaultValue = "") String selectKeyword) {
		return userinfoService.getUserinfoList(pageNum, pageSize, selectKeyword);
	}
	
	@GetMapping("/userinfo-details")
	public Map<String, Object> getMyAccounts(@RequestParam String id,
											 @RequestParam int diyPageNum,
											 @RequestParam int qaPageNum,
											 @RequestParam int reviewPageNum,
											 @RequestParam int packageHeartPageNum) {
		
		Map<String, Object> myDiy;
		myDiy = diyService.getMyDiyList(diyPageNum, id);
		Map<String, Object> myQa;
		myQa = qaService.getMyQaList(qaPageNum, id);
		Map<String, Object> myReview;
		myReview = reviewService.getMyReviewList(reviewPageNum, id);
		Map<String, Object> myPackHeart;
		myPackHeart = packageHeartService.getMyPackageHeartList(packageHeartPageNum, id);
		Map<String, Object> myMap = new HashMap<String, Object>();
		myMap.put("myDiy", myDiy);
		myMap.put("myQa", myQa);
		myMap.put("myReview", myReview);
		myMap.put("myPackHeart", myPackHeart);
		return myMap;
	}
	
	@PutMapping("/userinfo-modify")
	public String modifyUserinfo(@RequestBody Userinfo userinfo) throws UserinfoNotFoundException {
		userinfo.setName(userinfo.getName());
		userinfo.setEmail(userinfo.getEmail());
		userinfo.setPhone(userinfo.getPhone());
		userinfo.setAddress(userinfo.getAddress());
		userinfo.setStatus(userinfo.getStatus());
		userinfoService.modifyUserinfoByAdmin(userinfo);
		return "success";
	}
	
	@PutMapping("/userinfo-remove")
	public String removeAccount(@RequestParam String id) throws UserinfoNotFoundException {
		userinfoService.removeUserinfo1(id);
		return "success";
	}
	

	@GetMapping("/package-list")
	public Map<String, Object> getPackages(@RequestParam(defaultValue = "1") int pageNum,
										   @RequestParam(defaultValue = "20") int pageSize,
										   @RequestParam(defaultValue = "") String selectKeyword) {
		return packageService.getPackageList(pageNum, pageSize, selectKeyword);
	}
	
	
	@GetMapping("/diy-list")
	public Map<String, Object> getDiys(@RequestParam(defaultValue = "1") int pageNum,
									   @RequestParam(defaultValue = "20") int pageSize,
									   @RequestParam(defaultValue = "") String selectKeyword) {
		return diyService.getDiyList(pageNum, pageSize, selectKeyword);
	}
	
	@GetMapping("/notice-list")
	public Map<String, Object> getNotices(@RequestParam(defaultValue = "1") int pageNum,
										  @RequestParam(defaultValue = "20") int pageSize,
										  @RequestParam(defaultValue = "") String selectKeyword) {
		return noticeService.getNoticeList(pageNum, pageSize, selectKeyword);
	}
	
	@GetMapping("/event-list")
	public Map<String, Object> getEvents(@RequestParam(defaultValue = "1") int pageNum,
										  @RequestParam(defaultValue = "20") int pageSize,
										  @RequestParam(defaultValue = "") String selectKeyword) {
		return eventService.getEventList1(pageNum, pageSize, selectKeyword);
	}
	
	@GetMapping("/qa-list")
	public Map<String, Object> getQas(@RequestParam(defaultValue = "1") int pageNum,
									  @RequestParam(defaultValue = "20") int pageSize,
									  @RequestParam(defaultValue = "") String selectKeyword) {
		return qaService.getQaList1(pageNum, pageSize, selectKeyword);
	}
}	
