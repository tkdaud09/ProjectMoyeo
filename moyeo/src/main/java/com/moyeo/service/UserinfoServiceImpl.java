package com.moyeo.service;

import org.springframework.stereotype.Service;

import com.moyeo.dao.UserinfoDAO;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.UserinfoNotFoundException;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserinfoServiceImpl implements UserinfoService {
	private final UserinfoDAO userinfoDAO;

	/* 회원가입 */

	// 회원가입
	@Override
	public void registerUser(Userinfo userinfo) {
		userinfoDAO.insertUserinfo(userinfo);
	}

	// 아이디 검사
	@Override
	public int idCheck(String id) throws Exception {
		return userinfoDAO.idCheck(id);
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

	/* 마이페이지 */

	// 회원정보 변경
	@Override
	public void modifyUserinfo(Userinfo userinfo) {
		userinfoDAO.updateUserinfo(userinfo);
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

	// 비밀번호 변경
	@Override
	public int modifyPw(Userinfo userinfo) throws UserinfoNotFoundException {
		return userinfoDAO.updatePw(userinfo);
	}
}
