package com.moyeo.service;

import java.util.Map;

import com.moyeo.dto.SecurityAuth;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.ExistsUserinfoException;
import com.moyeo.exception.LoginAuthFailException;
import com.moyeo.exception.UserinfoNotFoundException;

public interface UserinfoService {
	/*회원가입*/
	void registerUser(Userinfo userinfo) throws ExistsUserinfoException;//회원정보삽입(회원가입)
	int idCheck(String id) throws Exception;//아이디 중복 검사
	int emailCheck(String email) throws Exception;//아이디 중복 검사


	/*로그인*/
	Userinfo userLogin(Userinfo userinfo) throws LoginAuthFailException;//로그인
	void updateUserLogindate(String id);//마지막 로그인 시간
	void updateUserToRest(String id);//휴면회원 
	void updateUserStatus(Userinfo userinfo);//탈퇴회원 status 변경

	/*아이디 찾기*/
	Userinfo findUserByEmail(String email);

	/*마이페이지*/
	void modifyUserinfo(Userinfo userinfo) throws UserinfoNotFoundException;//회원정보변경
	void removeUserinfo(String id) throws UserinfoNotFoundException;//회원탈퇴
	Userinfo getUserinfoById(String id) throws UserinfoNotFoundException;//아이디로 유저 검색 
	int modifyPw(Userinfo userinfo) throws UserinfoNotFoundException; //비밀번호 변경
	void updatePasswordByEmail(String email, String encryptedPassword);//이메일로 아이디 찾기

	/*관리자*/
	Userinfo getUserinfo(String id) throws UserinfoNotFoundException;//아이디로 전달값을 제공받아 회원정보 받음
	Map<String, Object> getUserinfoList(int pageNum, int pageSize, String selectKeyword);//회원목록 출력
	Userinfo getUserinfoByRegdate(String regdate);//regdate로 유저정보 가져오기
	void removeUserinfo1(String id) throws UserinfoNotFoundException;
	void modifyUserinfoByAdmin(Userinfo userinfo) throws UserinfoNotFoundException;
	
	/*Auth*/
	void addSecurityAuth(SecurityAuth auth);
	SecurityAuth getSecurityAuthById(String id);

}