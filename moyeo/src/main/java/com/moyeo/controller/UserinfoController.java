package com.moyeo.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyeo.dto.Userinfo;
import com.moyeo.exception.LoginAuthFailException;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.service.MailSendService;
import com.moyeo.service.UserinfoService;

@Controller
@RequestMapping(value = "/user")
public class UserinfoController {
   private static final Logger logger = LoggerFactory.getLogger(UserinfoController.class);

   @Autowired
   private UserinfoService userinfoservice;

   @Autowired
   private MailSendService mailService;

   @Autowired
   private BCryptPasswordEncoder pwEncoder;

   // 회원가입 페이지 이동
   @RequestMapping(value = "/join", method = RequestMethod.GET)
   public String joinGET() {
      return "userinfo/join";
   }

   // 회원가입
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public String joinPOST(Userinfo userinfo) throws Exception {

      // 회원가입 서비스 실행
      // userinfoservice.registerUser(userinfo);

      String rawPw = ""; // 인코딩 전 비밀번호
      String encodePw = ""; // 인코딩 후 비밀번호

      rawPw = userinfo.getPw();
      encodePw = pwEncoder.encode(rawPw); // 인코딩
      userinfo.setPw(encodePw);

      userinfoservice.registerUser(userinfo);// 회원가입 쿼리 실행

      return "redirect:/"; // 메인 페이지

   }

   // 아이디 중복검사
   @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
   @ResponseBody
   public String memberIdChkPOST(String id) throws Exception {

      // logger.info("memberIdChk() 진입");
      int result = userinfoservice.idCheck(id);

      // logger.info("결과값 = " + result);

      if (result != 0) {
         return "fail"; // 중복 아이디가 존재
      } else {
         return "success"; // 중복 아이디 x
      }
   } // memberIdChkPOST() 종료
   
   // 이메일 중복검사
   @RequestMapping(value = "/memberEmailChk", method = RequestMethod.POST)
   @ResponseBody
   public String memberEmailChkPOST(String email) throws Exception {
       int result = userinfoservice.emailCheck(email);

       if (result != 0) {
           return "fail"; // 중복 이메일이 존재
       } else {
           return "success"; // 중복 이메일 x
       }
   }

   // 이메일 인증
   @GetMapping("/mailCheck")
   @ResponseBody
   public String mailCheck(String email) throws Exception {
      System.out.println("이메일 인증 요청이 들어옴!");
      System.out.println("이메일 인증 이메일 : " + email);
      return mailService.joinEmail(email);
   }

   /* 로그인 */

   // 로그인 페이지 이동
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String loginGET() {
      return "userinfo/login";
   }

   // 로그인
      @SuppressWarnings("unused")
      @RequestMapping(value = "/login", method = RequestMethod.POST)
      public String loginPOST(HttpServletRequest request, Userinfo userinfo, RedirectAttributes rttr) throws Exception {
          HttpSession session = request.getSession();
          String rawPw = "";
          String encodePw = "";

          Userinfo lto = userinfoservice.userLogin(userinfo);

          if (lto != null) { // 일치하는 아이디 존재

              if (lto.getBirth() != null) {
                  String birth = lto.getBirth().substring(0, 10);
                  lto.setBirth(birth);
              }

              rawPw = userinfo.getPw(); // 사용자가 제출한 비밀번호
              encodePw = lto.getPw(); // 데이터베이스에 저장한 인코딩된 비밀번호

              if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단

                  lto.setPw(""); // 인코딩된 비밀번호 정보 지움
                  session.setAttribute("userinfo", lto); // session에 사용자의 정보 저장

                  userinfoservice.updateUserLogindate(lto.getId()); // 마지막 로그인 날짜 업데이트

                  return "redirect:/"; // 메인페이지 이동

              } else {
                  rttr.addFlashAttribute("result", 0);
                  return "redirect:/user/login"; // 로그인 페이지 이동
              }

          } else { // 일치하는 아이디 미존재 (로그인 실패)
              rttr.addFlashAttribute("result", 0);
              return "redirect:/user/login"; // 로그인 페이지 이동
          }
      }

      // 로그아웃 후 로그인 페이지로 이동
      @RequestMapping(value = "/logout")
      public String logout(HttpSession session) {
         session.invalidate();

         return "redirect:/user/login";
      }

   /*
    * 메인페이지 이동
    * 
    * @RequestMapping(value = "/main", method = RequestMethod.GET) public String
    * mainGET() { return "userinfo/main"; }
    */

   /* 아이디 찾기 */

   // 아이디 찾기 메인으로 이동
   @RequestMapping(value = "/findId", method = RequestMethod.GET)
   public String findIdForm() {
      return "/userinfo/findId"; // ID 찾기 페이지로 이동
   }

   // 아이디 찾기
   @RequestMapping(value = "/findId", method = RequestMethod.POST)
   public String findId(@RequestParam("email") String email, Model model) {
      Userinfo userinfo = userinfoservice.findUserByEmail(email);

      if (userinfo != null) {
         model.addAttribute("foundId", userinfo.getId());
      } else {
         model.addAttribute("notFound", true);
      }
      return "/userinfo/findIdResult"; // ID 찾기 결과 페이지로 이동
   }
   
   /* 비밀번호 찾기 */
   
   //비밀번호 찾기 메인
   @RequestMapping(value = "/findPw", method = RequestMethod.GET)
    public String findPwForm() {
        return "/userinfo/findPw";
    }
   
   //비밀번호 찾기
   @RequestMapping(value = "/findPw", method = RequestMethod.POST)
   public String findPw(@RequestParam("email") String email, 
                        @RequestParam("id") String enteredUserId,
                        Model model,
                        HttpServletRequest request) {
       Userinfo userinfo = userinfoservice.findUserByEmail(email);

       if (userinfo != null) {
           // 아이디와 이메일이 일치하는지 검증
           if (enteredUserId.equals(userinfo.getId())) { // 입력한 아이디와 찾은 사용자의 아이디가 일치하는지 확인
               String newPassword = generateRandomPassword(); // 임시 비밀번호 생성
               mailService.sendPwEmail(email, newPassword); // MailSendService 이용해 이메일 전송

               String encryptedPassword = pwEncoder.encode(newPassword);

               // 비밀번호 변경
               userinfoservice.updatePasswordByEmail(email, encryptedPassword);

               // 아이디 찾기에서 찾았던 아이디를 가져와 모델에 저장
               model.addAttribute("foundUserinfoId", userinfo.getId());
               model.addAttribute("foundPw", newPassword);
               return "/userinfo/findPwResult"; // 비밀번호 찾기 결과 페이지로 이동
           } else {
               model.addAttribute("notFound", true);
               return "/userinfo/findPwResult"; // 비밀번호 찾기 결과 페이지로 이동
           }
       } else {
           model.addAttribute("notFound", true);
           return "/userinfo/findPwResult"; // 비밀번호 찾기 결과 페이지로 이동
       }
   }
    
    // 임시 비밀번호 생성 함수
    private String generateRandomPassword() {
        Random r = new Random();
        int passwordLength = 6;
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder newPassword = new StringBuilder();

        for (int i = 0; i < passwordLength; i++) {
            int index = r.nextInt(characters.length());
            newPassword.append(characters.charAt(index));
        }
        return newPassword.toString();
    }
    
    //사용자 정보, 마지막 로그인 시간 가져오기
   @RequestMapping(value = "/user", method = RequestMethod.GET)
   public String userGET(Model model, HttpSession session) {
      // 사용자 정보와 마지막 로그인 시간 가져오기
      Userinfo userinfo = (Userinfo) session.getAttribute("userinfo");

      if (userinfo == null) {
         // 로그인되지 않은 상태에서 main 페이지 접근 시 처리 (예: 로그인 페이지로 리디렉션)
         return "redirect:/user/login";
      }

      // 사용자 정보에서 마지막 로그인 시간 가져오기
      String lastLoginDate = userinfo.getLogdate(); // 사용자 정보의 마지막 로그인 시간 필드를 가져온다고 가정

      // 모델에 데이터 추가
      model.addAttribute("lastLoginDate", lastLoginDate);

      return "userinfo/user";
   }

   /* 마이페이지 */

   // 마이페이지 메인으로 이동
   @RequestMapping(value = "/mypage", method = RequestMethod.GET)
   public String mypageGET() {
      return "mypage/main";
   }

   // 정보 수정 페이지 - GET
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public String modifyGET() {

      return "mypage/modify";
   }

   // 정보 수정 페이지 - POST
   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public String modifyPOST(Userinfo userinfo) throws Exception {
      userinfoservice.modifyUserinfo(userinfo);

      return "redirect:/user/mypage";

   }

   // 회원정보 변경 확인 페이지 (비밀번호 확인) - GET
   @RequestMapping(value = "/pwCheck", method = RequestMethod.GET)
   public String pwCheckGET() {

      return "mypage/pwCheck";
   }

   // 회원정보 변경 확인 페이지 (비밀번호 확인) - POST
   @RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
   public String pwCheckPOST(HttpServletRequest request, Userinfo userinfo, RedirectAttributes rttr)
         throws LoginAuthFailException {
      HttpSession session = request.getSession();
      String rawPw = "";
      String encodePw = "";

      Userinfo lto = userinfoservice.userLogin(userinfo);

      String birth = lto.getBirth().substring(0, 10);
      lto.setBirth(birth);

      if (lto != null) {// 일치하는 아이디 존재

         rawPw = userinfo.getPw(); // 사용자가 제출한 비밀번호
         encodePw = lto.getPw(); // 데이터베이스에 저장한 인코딩된 비밀번호

         if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단

            lto.setPw(""); // 인코딩된 비밀번호 정보 지움
            session.setAttribute("userinfo", lto); // session에 사용자의 정보 저장

            userinfoservice.updateUserLogindate(lto.getId());// 마지막 로그인 날짜 업데이트

            return "redirect:/user/modify"; // 수정페이지 이동

         } else {
            rttr.addFlashAttribute("result", 0);
            return "redirect:/user/pwCheck"; // 비밀번호 확인 페이지 이동
         }

      } else { // 일치하는 아이디 미존재 (로그인 실패)
         rttr.addFlashAttribute("result", 0);
         return "redirect:/user/pwCheck"; // 비밀번호 확인 페이지 이동
      }
   }

   //비밀번호 변경 - GET
   @RequestMapping(value = "/modifypw", method = RequestMethod.GET)
   public String modifypwGET() {
      return "mypage/modify_pw";
   }

   //비밀번호 변경 - POST
   @RequestMapping(value = "/modifypw", method = RequestMethod.POST)
   public String modiftpwPOST(HttpSession session, Userinfo userinfo, @RequestParam String updatePw, Model model) throws Exception {

      String rawPw = "";
      String encodePw = "";

      //String newpw = request.getParameter("newpw");

      Userinfo lto = userinfoservice.userLogin(userinfo);

      if (lto != null) {

         rawPw = userinfo.getPw(); 
         encodePw = lto.getPw(); 

         if (pwEncoder.matches(rawPw, encodePw)) {
            lto.setPw(encodePw = pwEncoder.encode(updatePw));
            userinfoservice.modifyPw(lto);
            session.setAttribute("userinfo", lto);
            return "redirect:/user/mypage"; 

         } else {
            model.addAttribute("result", 0);
            return "mypage/modify_pw"; 
         }

      } else { 
         model.addAttribute("result", 0);
         return "mypage/modify_pw"; 
      }
   }

   // 회원 탈퇴 확인 페이지 (비밀번호 확인) - GET
   @RequestMapping(value = "/removePwCheck", method = RequestMethod.GET)
   public String removeUserinfoGET() {

      return "mypage/remove";
   }

   // 회원 탈퇴 확인 페이지 (비밀번호 확인) - POST
   @RequestMapping(value = "/removePwCheck", method = RequestMethod.POST)
   public String removeUserinfoPOST(HttpServletRequest request, Userinfo userinfo, RedirectAttributes rttr)
         throws LoginAuthFailException {
      HttpSession session = request.getSession();
      String rawPw = "";
      String encodePw = "";

      Userinfo lto = userinfoservice.userLogin(userinfo);

      if (lto != null) {// 일치하는 아이디 존재

         rawPw = userinfo.getPw(); // 사용자가 제출한 비밀번호
         encodePw = lto.getPw(); // 데이터베이스에 저장한 인코딩된 비밀번호

         if (true == pwEncoder.matches(rawPw, encodePw)) { // 비밀번호 일치여부 판단

            lto.setPw(""); // 인코딩된 비밀번호 정보 지움
            session.setAttribute("userinfo", lto); // session에 사용자의 정보 저장

            userinfoservice.updateUserLogindate(lto.getId());// 마지막 로그인 날짜 업데이트

            return "redirect:/"; // 메인페이지 이동

         } else {
            rttr.addFlashAttribute("result", 0);
            return "redirect:/user/remove"; // 비밀번호 확인 페이지 이동
         }

      } else { // 일치하는 아이디 미존재 (로그인 실패)
         rttr.addFlashAttribute("result", 0);
         return "redirect:/user/remove"; // 비밀번호 확인 페이지 이동
      }
   }

   // 회원정보 삭제
   @RequestMapping("/remove")
   public String remove(@RequestParam String id, HttpSession session) throws UserinfoNotFoundException {
      userinfoservice.removeUserinfo(id);

      return "redirect:/user/login";
   }
}