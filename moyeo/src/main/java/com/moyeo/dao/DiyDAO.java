package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Diy;

public interface DiyDAO {
	int insertDiy(Diy diy);  // Diy 글 작성
	int updateDiy(Diy diy);  // Diy 글 수정
	int loveCheck(Diy diy);  //  Diy 좋아요 체크(count + 1)
	int loveCancel(Diy diy);  // Diy 좋아요 취소(count - 1)
	int deleteDiy(int diyIdx);  // Diy 글 삭제 
	
	// DIY detail 페이지 출력 
	Diy selectDiy(int diyIdx);
	
	// 전체 글 리스트, 페이징 + 검색 
	List<Diy> selectDiyList(Map<String, Object>map);
	
	// 전체 글 개수 
	int selectDiyListCount(Map<String, Object> map);
	
	//userinfo-details
	int selectMyDiyCount(String accountId);
	List<Diy> selectMyDiyList(Map<String, Object> map);

	//count 관리자
	int selectDiyCount1(String selectKeyword);
	List<Diy> selectDiyList1(Map<String, Object> map);
	
	/*마이페이지*/
	List<Diy> selectUserDiyListById(String userinfoId);//아이디로 유저 정보 검색 - 페이징X
	
}
