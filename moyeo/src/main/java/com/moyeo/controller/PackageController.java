package com.moyeo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyeo.dto.Pack;
import com.moyeo.service.PackageService;

@Controller
@RequestMapping(value = "/package")
public class PackageController {
	 
	@Autowired
	private PackageService packageService;
	
	// 패키지 메인 페이지 이동
	@RequestMapping(value = "/mo_package", method = RequestMethod.GET)
	public String packageMainGET() {
		return "package/mo_package";
	}
	
	// 패키지 상세 페이지 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String packageDetailGET() {
		return "package/mo_package_animal";
	}
	
	// 패키지 등록 페이지 이동
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String addPackageGET() {
		return "package/mo_package_form";
	}
	
	
	/* 관리자 */
	
	// 패키지 등록 
	@RequestMapping(value = "/addPackage", method = RequestMethod.POST)
	public String addPackagePOST(Pack pack, RedirectAttributes rttr) {
		packageService.addPackage(pack);
		
		rttr.addAttribute("add_result", pack.getPackName());
		
		return "redirect:/package/mo_package";
	}
	
}
