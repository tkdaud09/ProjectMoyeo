package com.moyeo.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dto.Diy;


@Service
public interface DiyService {
	
	void insertDiy(Diy diy);  // Diy 작성 
	void updateDiy(Diy diy);  // Diy 수정
	void loveCheck(Diy diy);  // Diy 좋아요 체크 
	void loveCancel(Diy diy);  // Diy 좋아요 취소
	void deleteDiy(int diyIdx);  // Diy 글 삭제
	
	// DIY 작성 글 자세히보기 페이지 (diyDetail)
	Diy selectDiy(int diyIdx);
	
	// 페이징 처리 후 전체 글 검색 (diyList)
	Map<String, Object> getDiyList(Map<String, Object> map);
		
	//*** 나중에 지도 추가하기
}
