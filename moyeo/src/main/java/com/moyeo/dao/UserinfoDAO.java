package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Userinfo;

public interface UserinfoDAO {
   /*회원가입*/
   int insertUserinfo(Userinfo userinfo);//회원정보삽입(회원가입)
   int idCheck(String id);//아이디 중복검사
   int emailCheck(String email);//아이디 중복검사
   
   /*로그인*/
   Userinfo userinfoLogin(Userinfo userinfo);//로그인 
   int updateLogdate(String id);//로그인 시간 변경
   void updateUserToRest(String id);//휴면계정전환
   void updateUserStatus(Userinfo userinfo);//탈퇴회원 status 변경
   
   /*아이디 찾기*/
   Userinfo findUserByEmail(String email);
   
   /*마이페이지*/
   int updateUserinfo(Userinfo userinfo);//회원정보 변경
   int outUser(String id);//회원 탈퇴
   Userinfo selectUserinfoById(String id);//아이디로 유저 정보 검색
   int updatePw(Userinfo userinfo); //비밀번호 변경
   
   /*관리자*/
   int selectUserinfoCount();
   Userinfo selectUserinfo(String id);//조건에 따른 유저 정보 검색
   List<Userinfo> selectUserinfoList(Map<String, Object> map);//전체 유저 정보 검색
   Userinfo selectUserinfobyRegdate(String regdate);//가입일에 따른 유저 정보 검색
   int deleteUserinfo1(String id);
   int updateUserinfoByAdmin(Userinfo userinfo);
}