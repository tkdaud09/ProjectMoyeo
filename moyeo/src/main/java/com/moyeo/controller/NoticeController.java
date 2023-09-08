package com.moyeo.controller;

import com.moyeo.dto.Notice;
import com.moyeo.dto.Userinfo;
import com.moyeo.service.NoticeService;

import lombok.RequiredArgsConstructor;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequiredArgsConstructor
@Controller
@RequestMapping("/notice")
public class NoticeController {

   private final WebApplicationContext context; //파일 업로드

   @Autowired
    private final NoticeService noticeService; //공지사항 관련 service

   //공지사항 리스트 페이지로 이동
   @RequestMapping(value="/", method = RequestMethod.GET)
   public String noticeList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
      Map<String, Object> map=noticeService.selectNoticeList(pageNum);
      
      model.addAttribute("pager",map.get("pager"));
      model.addAttribute("noticeList",map.get("noticeList"));

      return "notice/list";  
   }
   
   //공지사항 조회 - 상세 정보 + 조회수
   @RequestMapping(value="/view/{noticeIdx}", method = RequestMethod.GET)
   public String noticeViewGet(@PathVariable("noticeIdx") int noticeIdx, Model model) {
      noticeService.viewcntNotice(noticeIdx);
      
      model.addAttribute("notice", noticeService.selectNoticeInfo(noticeIdx));
      
   
      return "notice/view";
   }
   
   //공지사항 등록 폼  - GET (기존에 "/create" 대신 "/write"로 바꿈)
   @RequestMapping(value = "/write", method = RequestMethod.GET)
   public String noticeWriteForm() {
      return "notice/write";
   }

   //공지사항 등록 - POST
   @RequestMapping(value="/addNotice", method = RequestMethod.POST)
   public String addNoticePost(@ModelAttribute Notice notice, 
         @RequestParam("noticeImgFile") MultipartFile noticeImgFile,
         Model model, HttpSession session) throws IllegalStateException, IOException {

      /*if(noticeImgFile.isEmpty()) {
         //이미지 파일이 업로드되지 않은 경우 처리
         model.addAttribute("message","파일이 업로드되지 않았습니다.");
         return "redirect:/notice/";
      }
*/
      //전달파일을 저장하기 위한 서버 디렉토리의 시스템 경로 반환
      String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");

      //서버 디렉토리에 업로드 처리되며 저장된 파일의 이름을 반환하여 Command 객체의 필드값 변경
      String uploadNotice = UUID.randomUUID().toString()+"-"+noticeImgFile.getOriginalFilename();
      notice.setNoticeImg(uploadNotice);

      //파일 업로드 처리 - 복붙해서 넣어주는게 아니라 서버에 넣어줌
      noticeImgFile.transferTo(new File(uploadDirectory,uploadNotice));

      noticeService.insertNotice(notice);

      return "redirect:/notice/";
   }
   
   //공지사항 수정 - GET 방식
   @RequestMapping(value="/modify/{noticeIdx}", method = RequestMethod.GET)
   public String updateNoticeGET(@PathVariable("noticeIdx") int noticeIdx, Model model) {
      model.addAttribute("notice", noticeService.selectNoticeInfo(noticeIdx));

      return "notice/modify";
   }


   //공지사항 수정 - POST 방식
   //수정될 내용의 데이터를 가져오기 위해 Notice 클래스를 파라미터로 부여, 수정기능 실행 후 리다이렉트 방식으로 리스트 페이지 이동시 데이터 전송하가 위해 RedirectAttributes객체를 피라미터로 부여
   @RequestMapping(value="/modify", method = RequestMethod.POST)
   public String updateNoticePOST(@ModelAttribute Notice notice, 
           @RequestParam("noticeImgFile") MultipartFile noticeImgFile,
           Model model, HttpSession session, RedirectAttributes rttr) throws IllegalStateException, IOException {

       // 이미지 파일이 업로드되었는지 확인
       if (!noticeImgFile.isEmpty()) {
           // 파일이 업로드된 경우
           String uploadDirectory = context.getServletContext().getRealPath("/resources/assets/img/upload");
           String uploadNotice = UUID.randomUUID().toString() + "-" + noticeImgFile.getOriginalFilename();
           notice.setNoticeImg(uploadNotice);
           noticeImgFile.transferTo(new File(uploadDirectory, uploadNotice));
       } else {
           // 파일이 업로드되지 않은 경우, 기존 이미지 경로를 유지
           notice.setNoticeImg(noticeService.selectNoticeInfo(notice.getNoticeIdx()).getNoticeImg());
       }

       noticeService.updateNotice(notice);
       
       return "redirect:/notice/"; // 공지사항 상세 페이지로 리다이렉트 이동
   }

   
   // 공지사항 삭제 
   @RequestMapping(value = "/delete/{noticeIdx}", method = RequestMethod.GET)
   public String deleteNotice(@PathVariable int noticeIdx) {
       noticeService.deleteNotice(noticeIdx);
       return "redirect:/notice/";
   }



   /*
    // 공지사항 목록 조회 페이지로 이동
    @GetMapping("/list")
    public String getNoticeList(Model model) {
        // 공지사항 목록을 가져와 모델에 추가
        model.addAttribute("noticeList", noticeService.getNoticeList(1)); // 페이지 번호를 원하는대로 변경하세요
        return "notice/list"; // "resources/templates/notice" 폴더 안에 "list.html" 템플릿 파일이 있어야 합니다.
    }

    // 공지사항 상세 조회 페이지로 이동
    @GetMapping("/view/{noticeIdx}")
    public String viewNotice(@PathVariable int noticeIdx, Model model) {
        // 인덱스로 공지사항 정보를 가져와 모델에 추가
        Notice notice = noticeService.getNotice(noticeIdx);
        model.addAttribute("notice", notice);
        return "notice/view"; // "resources/templates/notice" 폴더 안에 "view.html" 템플릿 파일이 있어야 합니다.
    }

    // 공지사항 생성 페이지로 이동
    @GetMapping("/create")
    public String createNoticeForm() {
        return "notice/create"; // "resources/templates/notice" 폴더 안에 "create.html" 템플릿 파일이 있어야 합니다.
    }

    // 공지사항 생성 처리
    @PostMapping("/create")
    public String createNotice(Notice notice, RedirectAttributes redirectAttributes) {
        // 새로운 공지사항 생성
        noticeService.addNotice(notice);
        redirectAttributes.addFlashAttribute("message", "공지사항이 성공적으로 생성되었습니다!");
        return "redirect:/notice/list"; // 공지사항 목록 페이지로 리다이렉트
    }

    // 공지사항 수정 페이지로 이동
    @GetMapping("/edit/{noticeIdx}")
    public String editNoticeForm(@PathVariable int noticeIdx, Model model) {
        // 인덱스로 공지사항 정보를 가져와 모델에 추가
        Notice notice = noticeService.getNotice(noticeIdx);
        model.addAttribute("notice", notice);
        return "notice/edit"; // "resources/templates/notice" 폴더 안에 "edit.html" 템플릿 파일이 있어야 합니다.
    }

    // 공지사항 수정 처리
    @PostMapping("/edit")
    public String editNotice(Notice notice, RedirectAttributes redirectAttributes) {
        // 공지사항 수정
        noticeService.modifyNotice(notice);
        redirectAttributes.addFlashAttribute("message", "공지사항이 성공적으로 수정되었습니다!");
        return "redirect:/notice/list"; // 공지사항 목록 페이지로 리다이렉트
    }

    // 공지사항 삭제 처리
    @GetMapping("/delete/{noticeIdx}")
    public String deleteNotice(@PathVariable int noticeIdx, RedirectAttributes redirectAttributes) {
        // 공지사항 삭제
        noticeService.removeNotice(noticeIdx);
        redirectAttributes.addFlashAttribute("message", "공지사항이 성공적으로 삭제되었습니다!");
        return "redirect:/notice/list"; // 공지사항 목록 페이지로 리다이렉트
    }
*/
}