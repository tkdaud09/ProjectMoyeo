package com.moyeo.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.moyeo.dao.UserinfoDAO;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserinfoServiceImpl implements UserinfoService {
   private final UserinfoDAO userinfoDAO;
   private final BCryptPasswordEncoder pwEncoder;

   /* 회원가입 */

   // 회원가입
   @Override
   public void registerUser(Userinfo userinfo) {
	   String rawPw = userinfo.getPw(); // 사용자가 입력한 원래의 비밀번호
	   String encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
	   userinfo.setPw(encodePw); // 인코딩된 비밀번호를 설정

	   userinfoDAO.insertUserinfo(userinfo);
   }

   // 아이디 중복 검사
   @Override
   public int idCheck(String id) throws Exception {
      return userinfoDAO.idCheck(id);
   }
   
   // 이메일 중복 검사
   @Override
   public int emailCheck(String email) throws Exception {
      return userinfoDAO.emailCheck(email);
   }

   /* 로그인 */
   @Override
   public Userinfo userLogin(Userinfo userinfo) {
      return userinfoDAO.userinfoLogin(userinfo);
   }

   // 마지막 로그인 시간
   @Override
   public void updateUserLogindate(String id) {
      userinfoDAO.updateLogdate(id);
   }

   /* 아이디 찾기 */
   @Override
   public Userinfo findUserByEmail(String email) {
      return userinfoDAO.findUserByEmail(email);
   }
   
   /* 휴면회원 */
   @Override
   public void updateUserToRest(String id) {
       userinfoDAO.updateUserToRest(id);
   }
   
   /* 탈퇴회원 status 변경 */
   @Override
   public void updateUserStatus(Userinfo userinfo) {
       userinfoDAO.updateUserStatus(userinfo);
   }

   /* 마이페이지 */

   // 회원정보 변경
   @Override
   public void modifyUserinfo(Userinfo userinfo) {
      userinfoDAO.updateUserinfo(userinfo);
   }
   
   //비밀번호 변경
   @Override
   public int modifyPw(Userinfo userinfo) throws UserinfoNotFoundException {
      return userinfoDAO.updatePw(userinfo);
   }

   // 회원탈퇴
   @Override
   public void removeUserinfo(String id) {
      userinfoDAO.outUser(id);
   }

   // 아이디로 유저 정보 검색
   @Override
   public Userinfo getUserinfoById(String id) throws UserinfoNotFoundException {
      Userinfo userinfo = userinfoDAO.selectUserinfoById(id);
      // 검색된 회원정보가 없는 경우
      if (userinfo == null) {
         throw new UserinfoNotFoundException("아이디의 회원정보가 존재하지 않습니다.");
      }
      return userinfo;
   }

   //이메일로 newPassword 비밀번호 찾기 구현
   public void updatePasswordByEmail(String email, String newPassword) {
      Userinfo userinfo = userinfoDAO.findUserByEmail(email);
      if (userinfo != null) {
         userinfo.setPw(newPassword);
         userinfoDAO.updateUserinfo(userinfo);
      }
   }
   
   /* 관리자 */
   @Override
    public Userinfo getUserinfo(String id) {
        return userinfoDAO.selectUserinfo(id);
    }

   @Override
    public List<Userinfo> getUserinfoList() {
        return userinfoDAO.selectUserinfoList();
    }

   @Override
    public Userinfo getUserinfoByRegdate(String regdate) {
        return userinfoDAO.selectUserinfobyRegdate(regdate);
    }
}