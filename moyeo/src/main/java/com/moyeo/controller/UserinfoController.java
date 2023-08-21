package com.moyeo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import xyz.itwill.dto.Userinfo;
import xyz.itwill.service.UserinfoService;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserinfoController {

	@Autowired
	private UserinfoService userinfoService;
		
	//회원가입
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Userinfo userinfo) {
		userinfoService.addUserinfo(userinfo);
		return "redirect:/user/join"; 
	}
	
	//아이디 중복검사
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(String id) {
		int result=userinfoService.idCheck(id);
		return result;
	}

	
	//로그인-GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
	}
	
	//로그인-POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Userinfo userinfo) {		
		return "redirect:/user/login";
	}
	
	//로그아웃-GET
	@RequestMapping(value ="/logout", method = RequestMethod.GET)
	public void logout() {
	}
	
	//로그아웃-POST
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String logout(Userinfo userinfo, HttpSession session) {
		return "user/logout";
	}
	
	//마지막 로그인 변경
	@RequestMapping(value = "/lastlogindate", method = RequestMethod.GET)
	public String updateUserLogindate(@RequestParam String id) {
		userinfoService.updateUserLogindate(id);
		return "redirect:/user/profile";
	}
}
