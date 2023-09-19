package com.moyeo.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Review;
import com.moyeo.service.PackageService;
import com.moyeo.service.ReviewService;

import java.util.List;

@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired  
    private ReviewService reviewService; //리뷰 등록 관련 service
    @Autowired
    private PackageService packageService; 

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate);
        
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