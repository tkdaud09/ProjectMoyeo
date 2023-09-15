package com.moyeo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequestMapping(value = "/")
@RequiredArgsConstructor
public class indexController {
	
	/*@RequestMapping(value = "/package", method = RequestMethod.GET)
	public String PackageList(Model model) {
		return "package/mo_package";
	}
	
	@RequestMapping(value = "/package/detail", method = RequestMethod.GET)
	public String PackageDetail(Model model) {
		return "package/mo_package_animal";
	}*/
	
	/*@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinDetail(Model model) {
		return "userinfo/join";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginDetail(Model model) {
		return "userinfo/login";
	}*/
	
	
	

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String EventList(Model model) {
		return "event/mo_event";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartList(Model model) {
		return "cart/mo_cart";
	}
	
	
	
	
	/*
	@RequestMapping(value = "/package/{packageNum}", method = RequestMethod.GET)
	public String Package_detail(Model model) {
		return "package/mo_package_animal";
	}
	 */
}