package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Qa;

public interface QaDAO {
	/* 회원 */
	int insertQa(Qa qa);//1:1 문의 등록 
	int updateQa(Qa qa);//1:1 문의 수정
	int deleteQa(int qaIdx);//1:1 문의 삭제
	
	/*검색*/
	Qa selectQaInfo(int qaIdx);//1:1문의 상세페이지
	
	int selectQaCount(String searchKeyword, String searchType);//전체 레코드 수 검색
	//List<Qa> selectQaList();//1:1문의 전체 리스트 검색
	List<Qa> selectQaList(Map<String, Object> map);//1:1문의 전체 리스트 검색

	/* 관리자 */
	//int insertQaAnswer(Qa Qa);//1:1 문의 답변 등록 
	
	/*답변관련*/
	int updateQaReplyStatusToOne(int qaIdx);
	int updateQaReplyStatusToZero(int qaIdx);
	
	//userinfo-details
	int selectMyQaCount(String accountId);
	List<Qa> selectMyQaList(Map<String, Object> map);
	
	/*마이페이지*/
	List<Qa> selectUserQaListById(String userinfoId);//유저별 Qa 목록 조회 - 페이징 X
}
