package com.moyeo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.moyeo.exception.BadRequestException;
import com.moyeo.exception.ExistsUserinfoException;
import com.moyeo.exception.LoginAuthFailException;
import com.moyeo.exception.UserinfoNotFoundException;


@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(value = BadRequestException.class)	
	public String badRequestExceptionHander() {
		return "userinfo/user_error";
	}
	
	@ExceptionHandler(value = ExistsUserinfoException.class)	
	public String existsUserinfoExceptionHander(ExistsUserinfoException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("userinfo", exception.getUserinfo());
		return "userinfo/user_write";
	}
	
	@ExceptionHandler(value = LoginAuthFailException.class)
	public String loginAuthFailExceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("userid", exception.getUserid());
		return "userinfo/user_login";
	}
	
	@ExceptionHandler(value = UserinfoNotFoundException.class)
	public String userinfoNotFoundExceptionHandler() {
		return "userinfo/user_error";
	}
}
