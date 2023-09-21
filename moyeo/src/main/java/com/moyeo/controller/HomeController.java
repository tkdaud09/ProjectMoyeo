package com.moyeo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Review;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.security.CustomUserDetails;
import com.moyeo.service.PackageService;
import com.moyeo.service.ReviewService;
import com.moyeo.service.UserinfoService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired  
    private ReviewService reviewService; //리뷰 등록 관련 service
    @Autowired
    private PackageService packageService; 
    @Autowired
    private UserinfoService userinfoService;
    

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Authentication authentication, Model model) throws UserinfoNotFoundException {
    	
    	/* 마지막 로그인 시간 업데이트 */
    	if (authentication != null) {
            CustomUserDetails userinfo = (CustomUserDetails) authentication.getPrincipal();
            userinfoService.updateUserLogindate(userinfo.getId());
        }
    	
        //main페이지에서 마감임박 3개 출력
        List<Pack> deadlinePackage = packageService.getDeadlinePackage();
        model.addAttribute("deadlinePackage",deadlinePackage);
      
        // 최신 리뷰 3개를 가져와서 메인 화면으로 전달
        List<Review> latestReviews = reviewService.getLatestReviews(3);
        model.addAttribute("latestReviews", latestReviews);

        return "index";
    }
    
    /* main 
   //main페이지에서 마감임박 3개 출력
   @GetMapping("/")
   public String mainDeadlinePack(Model model) {
      List<Pack> deadlinePackage = packageService.getDeadlinePackage();
      model.addAttribute("deadlinePackage",deadlinePackage);
      return "index";
   }*/
}