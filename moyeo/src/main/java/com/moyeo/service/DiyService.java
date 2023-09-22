package com.moyeo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dto.Diy;
import com.moyeo.dto.Qa;


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
	
	//userinfo-details
	Map<String, Object> getMyDiyList(int pageNum, String userinfoId);
	
	Map<String, Object> getDiyList(int pageNum, int pageSize, String searchKeyword);
	
	/*마이페이지*/
	List<Diy> getUserDiyListById(String userinfoId);//유저별 Qa 목록 조회 - 페이징 X
}	
