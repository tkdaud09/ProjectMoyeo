package com.moyeo.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.service.UserinfoService;

@Controller   
@RequestMapping(value = "/admin")
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(UserinfoController.class);
   
   @Autowired
   private UserinfoService userinfoservice;
   
   @GetMapping(value = "/")
   public String adminmainGET() {
      return "admin/adminmain";
   }
   
   @GetMapping(value = "userlist")
    public String userList(Model model) {
        List<Userinfo> userinfoList = userinfoservice.getUserinfoList();
        model.addAttribute("userinfoList", userinfoList);
        return "admin/userlist"; // admin/userlist.jsp를 호출
    }
   
   @GetMapping(value = "userinfo")
    public String getUserInfo(@RequestParam("id") String id, Model model) throws UserinfoNotFoundException {
        Userinfo userinfo = userinfoservice.getUserinfoById(id); // userinfoservice는 서비스 클래스의 인스턴스, id로 사용자 정보를 조회
        model.addAttribute("userinfo", userinfo); // 모델에 데이터를 추가
        return "admin/userinfo"; // admin/userinfo.jsp를 호출
    }
}
   