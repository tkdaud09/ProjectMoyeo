package com.moyeo.controller;


import java.io.File;   
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.service.PackageService;
import com.moyeo.service.UserinfoService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/admin")
public class AdminController {

   private final WebApplicationContext context;
   private final UserinfoService userinfoservice;
   private final PackageService packageService;

   // 관리자 권한 정보 확인 
   @GetMapping(value = "/main")
   public String adminpage(HttpSession session) {
       Userinfo userinfo = (Userinfo) session.getAttribute("userinfo");
       Integer status = null;
       if (userinfo != null) {
           status = userinfo.getStatus();
       }
       
       System.out.println("Admin Page Accessed. Status: " + status);

       if (status != null && status == 9) {
           return "admin/adminmain";
       } else {
           return "redirect:/";
       }
   }

   //고객센터 페이지 이동
   @GetMapping(value = "/center")
   public String centerGET() {
      return "admin/center";
   }
   
   //회원 디테일 페이지
   @RequestMapping(value = "/userinfo-detail", method = RequestMethod.GET)
   public String getUserinfoDetail(@RequestParam String id, Model model, HttpSession session) throws UserinfoNotFoundException {
      model.addAttribute("userinfo", userinfoservice.getUserinfo(id));
      return "admin/detail/userinfo-detail";
   }
   
   /*
   //유저 리스트
   @GetMapping(value = "/userlist")
   public String userList(Model model) {
      List<Userinfo> userinfoList = userinfoservice.getUserinfoList();
      model.addAttribute("userinfoList", userinfoList);
      return "admin/userlist";
   }
	*/

   //유저 상세 정보
   @GetMapping(value = "/userinfo")
   public String getUserInfo(@RequestParam("id") String id, Model model) throws UserinfoNotFoundException {
      Userinfo userinfo = userinfoservice.getUserinfoById(id);
      model.addAttribute("userinfo", userinfo);
      return "admin/userinfo";
   }
   
   /* 패키지 */
   // 패키지 등록 페이지 이동
   @RequestMapping(value = "/packageForm", method = RequestMethod.GET)
   public String addPackageGET() {
      return "package/mo_package_form";
   }

   // 패키지 등록
   @RequestMapping(value = "/addPackage", method = RequestMethod.POST)
   public String addPackagePOST(@ModelAttribute Pack pack,
         @RequestParam("packPreviewImgFile") MultipartFile packPreviewImgFile,
         @RequestParam("packSlideImg1File") MultipartFile packSlideImg1File,
         @RequestParam("packSlideImg2File") MultipartFile packSlideImg2File,
         @RequestParam("packSlideImg3File") MultipartFile packSlideImg3File,
         @RequestParam("packContentImg1File") MultipartFile packContentImg1File,
         @RequestParam("packContentImg2File") MultipartFile packContentImg2File,
         @RequestParam("packContentImg3File") MultipartFile packContentImg3File,
         @RequestParam("packCalendarImgFile") MultipartFile packCalendarImgFile,
         Model model, HttpSession session) throws IllegalStateException, IOException {

      if(packPreviewImgFile.isEmpty() || packSlideImg1File.isEmpty() || packSlideImg2File.isEmpty() 
            || packSlideImg3File.isEmpty() || packContentImg1File.isEmpty() || packContentImg2File.isEmpty()
            || packContentImg2File.isEmpty() || packContentImg3File.isEmpty() || packCalendarImgFile.isEmpty()) {
         //이미지 파일이 업로드되지 않은 경우 처리
         model.addAttribute("message","파일이 업로드되지 않았습니다.");
         return "redirect:/package/";
      }

      //전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
      String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

      //서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
      String uploadPreview = UUID.randomUUID().toString()+"-"+packPreviewImgFile.getOriginalFilename();
      pack.setPackPreviewImg(uploadPreview);

      String uploadSlide1 = UUID.randomUUID().toString()+"-"+packSlideImg1File.getOriginalFilename();
      pack.setPackSlideImg1(uploadSlide1);

      String uploadSlide2 = UUID.randomUUID().toString()+"-"+packSlideImg2File.getOriginalFilename();
      pack.setPackSlideImg2(uploadSlide2);

      String uploadSlide3 = UUID.randomUUID().toString()+"-"+packSlideImg3File.getOriginalFilename();
      pack.setPackSlideImg3(uploadSlide3);

      String uploadContent1 = UUID.randomUUID().toString()+"-"+packContentImg1File.getOriginalFilename();
      pack.setPackContentImg1(uploadContent1);

      String uploadContent2 = UUID.randomUUID().toString()+"-"+packContentImg2File.getOriginalFilename();
      pack.setPackContentImg2(uploadContent2);

      String uploadContent3 = UUID.randomUUID().toString()+"-"+packContentImg3File.getOriginalFilename();
      pack.setPackContentImg3(uploadContent3);

      String uploadCalendar = UUID.randomUUID().toString()+"-"+packCalendarImgFile.getOriginalFilename();
      pack.setPackCalendarImg(uploadCalendar); 

      //파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
      packPreviewImgFile.transferTo(new File(uploadDirectory,uploadPreview));
      packSlideImg1File.transferTo(new File(uploadDirectory,uploadSlide1));
      packSlideImg2File.transferTo(new File(uploadDirectory,uploadSlide2));
      packSlideImg3File.transferTo(new File(uploadDirectory,uploadSlide3));
      packContentImg1File.transferTo(new File(uploadDirectory,uploadContent1));
      packContentImg2File.transferTo(new File(uploadDirectory,uploadContent2));
      packContentImg3File.transferTo(new File(uploadDirectory,uploadContent3));
      packCalendarImgFile.transferTo(new File(uploadDirectory,uploadCalendar));

      //테이블에 행 삽입
      packageService.addPackage(pack);

      return "redirect:/package/";
   }
   
   
   /* 패키지 수정 */
   @GetMapping(value = "/packageModify/{packIdx}")
   public String packageModifyGET(@PathVariable("packIdx") int packIdx, Model model) {
	   
	   Pack pack = packageService.getPackageInfo(packIdx);
	   model.addAttribute("pack", pack);
	   
	   return "package/package_modify";
   }
   
   @PostMapping(value ="/packageModify/{packIdx}")
   public String packageModifyPOST(@PathVariable("packIdx") int packIdx,
		   						   @ModelAttribute Pack pack,
								   @RequestParam("packPreviewImgFile") MultipartFile packPreviewImgFile,
							       @RequestParam("packSlideImg1File") MultipartFile packSlideImg1File,
							       @RequestParam("packSlideImg2File") MultipartFile packSlideImg2File,
							       @RequestParam("packSlideImg3File") MultipartFile packSlideImg3File,
							       @RequestParam("packContentImg1File") MultipartFile packContentImg1File,
							       @RequestParam("packContentImg2File") MultipartFile packContentImg2File,
							       @RequestParam("packContentImg3File") MultipartFile packContentImg3File,
							       @RequestParam("packCalendarImgFile") MultipartFile packCalendarImgFile,
							       Model model, HttpSession session) throws IllegalStateException, IOException {
	   
	   String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
	   
	   //기존 이미지 경로 가져오기
	   Pack originalPack = packageService.getPackageInfo(packIdx);
	   String originalPreviewImg = originalPack.getPackPreviewImg();
	   String originalSlideImg1 = originalPack.getPackSlideImg1();
	   String originalSlideImg2 = originalPack.getPackSlideImg2();
	   String originalSlideImg3 = originalPack.getPackSlideImg3();
	   String originalContentImg1 = originalPack.getPackContentImg1();
	   String originalContentImg2 = originalPack.getPackContentImg2();
	   String originalContentImg3 = originalPack.getPackContentImg3();
	   String originalCalendarImg = originalPack.getPackCalendarImg();
	   
	   if(!packPreviewImgFile.isEmpty()) {
		   pack.setPackPreviewImg(UUID.randomUUID().toString() + "-" + packPreviewImgFile.getOriginalFilename());
		   packPreviewImgFile.transferTo(new File(uploadDirectory, pack.getPackPreviewImg()));
	   } else {
		   pack.setPackPreviewImg(originalPreviewImg);//기존 경로 유지
	   }
	   
	   if(!packSlideImg1File.isEmpty()) {
		   pack.setPackSlideImg1(UUID.randomUUID().toString() + "-" + packSlideImg1File.getOriginalFilename());
		   packSlideImg1File.transferTo(new File(uploadDirectory, pack.getPackSlideImg1()));
	   } else {
		   pack.setPackSlideImg1(originalSlideImg1);
	   }
	   
	   if(!packSlideImg2File.isEmpty()) {
		   pack.setPackSlideImg2(UUID.randomUUID().toString() + "-" + packSlideImg2File.getOriginalFilename());
		   packSlideImg2File.transferTo(new File(uploadDirectory, pack.getPackSlideImg2()));
	   } else {
		   pack.setPackSlideImg2(originalSlideImg2);
	   }
	   
	   if(!packSlideImg3File.isEmpty()) {
		   pack.setPackSlideImg3(UUID.randomUUID().toString() + "-" + packSlideImg3File.getOriginalFilename());
		   packSlideImg3File.transferTo(new File(uploadDirectory, pack.getPackSlideImg3()));
	   } else {
		   pack.setPackSlideImg3(originalSlideImg3);
	   }
	   
	   if(!packContentImg1File.isEmpty()) {
		   pack.setPackContentImg1(UUID.randomUUID().toString() + "-" + packContentImg1File.getOriginalFilename());
		   packContentImg1File.transferTo(new File(uploadDirectory, pack.getPackContentImg1()));
	   } else {
		   pack.setPackContentImg1(originalContentImg1);
	   }
	   
	   if(!packContentImg2File.isEmpty()) {
		   pack.setPackContentImg2(UUID.randomUUID().toString() + "-" + packContentImg2File.getOriginalFilename());
		   packContentImg2File.transferTo(new File(uploadDirectory, pack.getPackContentImg2()));
	   } else {
		   pack.setPackContentImg2(originalContentImg2);
	   }
	   
	   if(!packContentImg3File.isEmpty()) {
		   pack.setPackContentImg3(UUID.randomUUID().toString() + "-" + packContentImg3File.getOriginalFilename());
		   packContentImg3File.transferTo(new File(uploadDirectory, pack.getPackContentImg3()));
	   } else {
		   pack.setPackContentImg3(originalContentImg3);
	   }
	   
	   if(!packCalendarImgFile.isEmpty()) {
		   pack.setPackCalendarImg(UUID.randomUUID().toString() + "-" + packCalendarImgFile.getOriginalFilename());
		   packCalendarImgFile.transferTo(new File(uploadDirectory, pack.getPackCalendarImg()));
	   } else {
		   pack.setPackCalendarImg(originalCalendarImg);
	   }
	   
	   //업데이트
	   packageService.modifyPackage(pack);
	   
	   return "redirect:/package/detail/{packIdx}";
   }
   
   /* 패키지 삭제 */
   @RequestMapping(value = "/delete/{packIdx}", method = RequestMethod.GET)
	public String remove(@PathVariable int packIdx) {
		packageService.deletePackage(packIdx);
		return "admin/packagelist";
	}
   
   /* 패키지 상태 변경 */
   @RequestMapping(value = "/state/{packIdx}", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> changePackageStatus(@PathVariable("packIdx") int packIdx, @RequestParam("state") int state) {
       Map<String, Object> response = new HashMap<>(); // 응답을 위한 맵 객체 생성
         
       try {
           // 서버에서 현재 패키지 상태를 가져옴
           int currentStatus = packageService.getPackageStatus(packIdx); // 패키지 상태 조회
           System.out.println("currentStatus = " + currentStatus); // 현재 패키지 상태를 출력
         
           // 현재 상태와 요청된 상태가 다를 경우에만 업데이트 수행
           if (currentStatus != state) { // 현재 상태와 요청된 상태 비교
               System.out.println("state = " + state); // 요청된 새로운 패키지 상태를 출력
               
               Pack pack = new Pack();
               pack.setPackIdx(packIdx); // 패키지 인덱스 설정
               pack.setPackStatus(state); // 패키지 상태 설정
               packageService.modifyPackageStatus(pack); // 패키지 상태 업데이트 서비스 호출
           }
           
           response.put("success", true); // 성공 여부를 응답 맵에 추가
           response.put("message", "성공"); // 성공 메시지를 응답 맵에 추가
       } catch (Exception e) { // 예외 처리
           response.put("success", false); // 실패 여부를 응답 맵에 추가
           response.put("message", "실패"); // 실패 메시지를 응답 맵에 추가
       }
       
       return response; // 응답 맵 반환
   }

}