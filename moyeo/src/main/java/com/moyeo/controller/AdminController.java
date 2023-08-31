package com.moyeo.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.service.PackageService;
import com.moyeo.service.UserinfoService;

@Controller   
@RequestMapping(value = "/admin")
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(UserinfoController.class);
   
   @Autowired
   private UserinfoService userinfoservice;
   
   @Autowired
   private PackageService packservice;
   
   @GetMapping(value = "/")
   public String adminmainGET() {
      return "admin/adminmain";
   }
   
   @GetMapping(value = "/center")
   public String centerGET() {
      return "admin/center";
   }
   
   @GetMapping(value = "/userlist")
    public String userList(Model model) {
        List<Userinfo> userinfoList = userinfoservice.getUserinfoList();
        model.addAttribute("userinfoList", userinfoList);
        return "admin/userlist"; // admin/userlist.jsp를 호출
    }
   
   @GetMapping(value = "/userinfo")
    public String getUserInfo(@RequestParam("id") String id, Model model) throws UserinfoNotFoundException {
        Userinfo userinfo = userinfoservice.getUserinfoById(id); // userinfoservice는 서비스 클래스의 인스턴스, id로 사용자 정보를 조회
        model.addAttribute("userinfo", userinfo); // 모델에 데이터를 추가
        return "admin/userinfo"; // admin/userinfo.jsp를 호출
    }
   
   //패키지 목록 출력
   @GetMapping(value = "/packagelist")
   public String packList(Model model) {
       List<Pack> packList = packservice.getPackageList();
       model.addAttribute("packList", packList);
      return "admin/packagelist"; // admin 폴더 내의 packagelist.jsp 파일명
   }
   
   //패키지 등록 버튼
   @GetMapping(value = "/packageregist")
   public String packageregistGET(Model model) {
      model.addAttribute("pack", new Pack()); // 빈 Pack 객체를 모델에 추가하여 폼에 바인딩
      return "admin/packageregist"; // admin 폴더 내의 packageregist.jsp 파일명
   }
   
   @PostMapping(value = "/packageregist")
   public String packageregistPOST(@ModelAttribute("pack") Pack pack) {
      packservice.addPackage(pack); // 서비스를 통해 패키지 등록 수행
      return "redirect:/admin/packagelist"; // 패키지 등록 후 패키지 목록 페이지로 리다이렉트
   }
}