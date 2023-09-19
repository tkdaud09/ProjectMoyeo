package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Diy;

public interface DiyDAO {
	int insertDiy(Diy diy);  // Diy 글 작성
	int updateDiy(Diy diy);  // Diy 글 수정
	int loveCheck(Diy diy);  //  Diy 좋아요 체크
	int loveCancel(Diy diy);  // Diy 좋아요 취소 
	int deleteDiy(int diyIdx);  // Diy 글 삭제 
	
	// DIY detail 페이지 출력 
	Diy selectDiy(int diyIdx);
	
	// 전체 글 리스트, 페이징 + 검색 
	List<Diy> selectDiyList(Map<String, Object>map);
	
	// 전체 글 개수 
	int selectDiyListCount(Map<String, Object> map);
	
}
