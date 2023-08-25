package com.moyeo.controller;

import com.moyeo.dto.Notice;
import com.moyeo.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
/*
@Controller
@RequestMapping("/notice")
public class NoticeController {

    private final NoticeService noticeService;

    @Autowired
    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

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
}*/
