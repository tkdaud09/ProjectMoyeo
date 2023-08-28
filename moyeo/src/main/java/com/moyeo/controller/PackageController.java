package com.moyeo.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Userinfo;
import com.moyeo.service.PackageService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping(value = "/package")
public class PackageController {
    
   private final WebApplicationContext context;
   
   @Autowired
   private PackageService packageService; //패키지 등록 관련 service
    
   
   // 패키지 메인 페이지 이동
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String packageMainGET() {
      return "package/mo_package";
   }
   
   
   // 패키지 상세 페이지 이동 - 패키지 상세 정보 select
   @RequestMapping(value = "/detail/{packIdx}", method = RequestMethod.GET) //Spring에서 사용자가 전송한 식별자 값을 변수로 인식하기 위해 템플릿 변수{packIdx}작성
   public String packageDetailGET(@PathVariable("packIdx")int packIdx, Model model) {
      model.addAttribute("packageInfo", packageService.selectPackInfo(packIdx));
      
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
   public String addPackagePOST(@ModelAttribute("pack") Pack pack, @RequestParam("previewMultipartFile") MultipartFile previewMultipartFile,
         @RequestParam("mainMultipartFile") MultipartFile mainMultipartFile, @RequestParam("contentMultipartFile") MultipartFile contentMultipartFile,
         @RequestParam("calendarMultipartFile") MultipartFile calendarMultipartFile, Model model, HttpSession session) throws IllegalStateException, IOException {
      if(previewMultipartFile.isEmpty() || mainMultipartFile.isEmpty() || contentMultipartFile.isEmpty() || calendarMultipartFile.isEmpty()) {
         //이미지 파일이 업로드되지 않은 경우 처리
         model.addAttribute("message", "파일이 업로드되지 않았습니다.");
         return "redirect:/package/";
      }
      
      //전달파일을 저장하기 위한 서버 디렉토리의시스템 경로 반환
      String uploadDirectory = context.getServletContext().getRealPath("/assets/img/upload");
      
      //서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
      String uploadPreview=UUID.randomUUID().toString()+"-"+previewMultipartFile.getOriginalFilename();
      pack.setPackPreview(uploadPreview);
      String uploadMain=UUID.randomUUID().toString()+"-"+mainMultipartFile.getOriginalFilename();
      pack.setPackMain(uploadMain);
      String uploadContent=UUID.randomUUID().toString()+"-"+contentMultipartFile.getOriginalFilename();
      pack.setPackContent(uploadContent);
      String uploadCalendar=UUID.randomUUID().toString()+"-"+calendarMultipartFile.getOriginalFilename();
      pack.setPackCalendar(uploadCalendar);
      
      //파일 업로드 처리 - 복붙해서 넣어주는 게 아니라 서버에 넣어줌
      previewMultipartFile.transferTo(new File(uploadDirectory,uploadPreview));
      mainMultipartFile.transferTo(new File(uploadDirectory,uploadMain));
      contentMultipartFile.transferTo(new File(uploadDirectory,uploadContent));
      calendarMultipartFile.transferTo(new File(uploadDirectory,uploadCalendar));
      
      //세션
      //Userinfo userinfo = (Userinfo)session.getAttribute("userinfo");
      
      //테이블에 행 삽입
      packageService.addPackage(pack);
      
      return "redirect:/package/";
   }
   
   /* 패키지 상품 정보 수정 */
   @RequestMapping(value = "/packinfoModify", method = RequestMethod.POST)
   public String packinfoModify(Pack pack, RedirectAttributes rttr) {
      int result = packageService.updatePackage(pack);
      
      rttr.addFlashAttribute("modify_result", result);
      
      return "redirect:/package/";
   }
   

   
}