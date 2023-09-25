package com.moyeo.mapper;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Diy;

public interface DiyMapper {
	
	int insertDiy(Diy diy);
	int updateDiy(Diy diy);
	int loveCheck(Diy diy);
	int loveCancel(Diy diy);
	int deleteDiy(int diyIdx);
	
	// DIY 작성 디테일 페이지
	Diy selectDiy(int diyIdx);
	
	// 글에 저장된 아이디를 출력해서 로그인한 사용자와 비교해 수정 권한을 준다.
	Diy getUserinfoById(int diyIdx);
	
	// 전체 글 검색
	List<Diy> selectDiyList(Map<String, Object> map);
	
	// 전체 글 개수 
	int selectDiyListCount(Map<String, Object> map);
	
	// *** 맵 추가하기
	
	//userinfo-details
	int selectMyDiyCount(String accountId);
	List<Diy> selectMyDiyList(Map<String, Object> map);

	//count 관리자
	int selectDiyCount1(String selectKeyword);
	List<Diy> selectDiyList1(Map<String, Object> map);
	
	/*마이페이지*/
	List<Diy> selectUserDiyListById(String userinfoId);//아이디로 유저 정보 검색 - 페이징X

}
