package com.moyeo.service;

import com.moyeo.dto.Userinfo;
import com.moyeo.exception.ExistsUserinfoException;
import com.moyeo.exception.LoginAuthFailException;
import com.moyeo.exception.UserinfoNotFoundException;

public interface UserinfoService {
	/*회원가입*/
	void registerUser(Userinfo userinfo) throws ExistsUserinfoException;//회원정보삽입(회원가입)
	int idCheck(String id) throws Exception;//아이디 검사
	
	/*로그인*/
	Userinfo userLogin(Userinfo userinfo) throws LoginAuthFailException;//로그인
	void updateUserLogindate(String id);//마지막 로그인 시간
	
	/*아이디 찾기*/
	Userinfo findUserByEmail(String email);
	
	/*마이페이지*/
	void modifyUserinfo(Userinfo userinfo) throws UserinfoNotFoundException;//회원정보변경
	void removeUserinfo(String id) throws UserinfoNotFoundException;//회원탈퇴
	Userinfo getUserinfoById(String id) throws UserinfoNotFoundException;//아이디로 유저 검색 
}
