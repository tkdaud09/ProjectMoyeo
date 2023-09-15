package com.moyeo.service;

import java.util.List; 
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dto.Diy;


@Service
public interface DiyService {
	// Diy 작성 
	void insertDiy(Diy diy);
	// Diy 수정
	void updateDiy(Diy diy);
	// Diy 좋아요 체크 
	void loveCheck(Diy diy);
	// Diy 좋아요 취소 
	void loveCancel(Diy diy);
	// Diy 글 삭제 
	void deleteDiy(int diyIdx);
	// DIY 작성 글 자세히보기 페이지 (diyDetail)
	Diy selectDiy(int diyIdx);
	
	// 전체 글 개수 
	int selectDiyListCount();
	
	// 페이징 처리 후 전체 글 검색 (diyList)
	Map<String, Object> selectDiyList(int pageNum);
		
	// DIY 제목으로 검색, 내용은 작성 칸이 나눠져있어서 어떻게 해야할까?
	List<Diy> selectDiyListByTitle(String diyTitle);
	
	// 글에 저장된 아이디를 가져와 수정 권한을 줌
	Diy getUserinfoById(int diyIdx);
	
	//*** 나중에 지도 추가하기
	
	//userinfo-details
	Map<String, Object> getMyDiyList(int pageNum, String userinfoId);
	
}
