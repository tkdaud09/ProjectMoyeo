package com.moyeo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.moyeo.dao.UserinfoDAO;
import com.moyeo.dto.Userinfo;
import com.moyeo.exception.LoginAuthFailException;
import com.moyeo.exception.UserinfoNotFoundException;
import com.moyeo.util.Pager;

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
	//회원 정보 조회 기능
	@Override
	public Userinfo getUserinfo(String id) throws UserinfoNotFoundException {
		Userinfo userinfo = userinfoDAO.selectUserinfo(id);
		if (userinfo == null) {
			throw new UserinfoNotFoundException("아이디의 회원 정보가 존재하지 않습니다.");
		}
		return userinfo;
	}

	//회원 리스트 조회 기능
	@Override
	public Map<String, Object> getUserinfoList(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = userinfoDAO.selectUserinfoCount();
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);

		List<Userinfo> userinfoList = userinfoDAO.selectUserinfoList(pageMap);

		Map<String, Object> userinfoMap = new HashMap<String, Object>();
		userinfoMap.put("userinfoList", userinfoList);
		userinfoMap.put("pager", pager);

		return userinfoMap;
	}
	
	//Regdate로 유저 검색
	@Override
	public Userinfo getUserinfoByRegdate(String regdate) {
		return userinfoDAO.selectUserinfobyRegdate(regdate);
	}

	@Override
	public void removeUserinfo1(String id) throws UserinfoNotFoundException {
		if (userinfoDAO.selectUserinfo(id) == null) {
			throw new UserinfoNotFoundException("아이디의 회원 정보가 존재하지 않습니다.");
		}
			userinfoDAO.deleteUserinfo1(id);
		}
		
}