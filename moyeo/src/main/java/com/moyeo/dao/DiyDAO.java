package com.moyeo.dao;

import java.util.List;

import com.moyeo.dto.Diy;

public interface DiyDAO {
	int insertDiy(Diy diy);
	int updateDiy(Diy diy);
	
	int deleteDiy(int diyIdx);
	
	// DIY 작성 primary key인 diy_idx 값을 받아와서 detail 페이지에출
	Diy selectDiy(int diyIdx);
	
	// 전체 글 검색
	List<Diy> selectDiyList();
	
	// 제목으로 글 검
	List<Diy> selectDiyList(String diyTitle);
	
	// *** 내용으로 검색도 추가하기
	
	// 글에 저장된 아이디를 출력해서 로그인한 사용자와 비교해 수정 권한을 준다.
	Diy getUserinfoById(String userinfoId);
	
	// 전체 글 개수 
	int selectDiyListCount();
	
	// *** 맵 추가하기
	
	// String userinfo, Userinfo userinfo
	
	// String id => 아이디 컬럼 하나만 가져와서 다른 테이블 아이디 where로 사용할수있게하고
	// 				User user로 다 가져오면모든걸 쓸수있음..?

	// List<Diy> selectDiyList(Map<String, Object> map);
}
