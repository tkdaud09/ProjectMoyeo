package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Diy;

public interface DiyDAO {
	int insertDiy(Diy diy);
	int updateDiy(Diy diy);
	int loveCheck(Diy diy);
	int loveCancel(Diy diy);
	
	int deleteDiy(int diyIdx);
	
	// DIY 작성 primary key인 diy_idx 값을 받아와서 detail 페이지에출
	Diy selectDiy(int diyIdx);
	
	// 전체 글 검색
	List<Diy> selectDiyList(Map<String, Object>map);

	// 키워드로 글 검색 
	List<Diy> selectDiyListByTitle(String diyTitle);
	
	// *** 내용으로 검색도 추가하기
	
	// 글에 저장된 아이디를 출력해서 로그인한 사용자와 비교해 수정 권한을 준다.
	Diy getUserinfoById(int diyIdx);
	
	// 전체 글 개수 
	int selectDiyListCount();
	
	// *** 맵 추가하기

	// List<Diy> selectDiyList(Map<String, Object> map);
	
	//userinfo-details
	int selectMyDiyCount(String accountId);
	List<Diy> selectMyDiyList(Map<String, Object> map);
}
