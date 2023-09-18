package com.moyeo.service;

import java.util.List;
import java.util.Map; 

import com.moyeo.dto.Qa;

public interface QaService {
	/*회원*/
	void addQa(Qa qa);//1:1 문의 등록
	void modifyQa(Qa qa);//1:1 문의 수정
	void removeQa(int qaIdx);//1:1 문의 삭제
	
	/*검색*/
	Qa getQaInfo(int qaIdx);//1:1 문의 상세
	//List<Qa> getQaList();//1:1 문의 전체 리스트
	Map<String, Object> getQaList(int pageNum, int pageSize, String searchKeyword, String searchType);//1:1 문의 전체 리스트
	
	/*관리자*/
	//void addQaAnswer(Qa qa);//1:1 문의 답변 등록
	
	/*답변관련*/
	void modifyReplyStatusToOne(int qaIdx);
	void modifyReplyStatusToZero(int qaIdx);
	
	//userinfo-details
	Map<String, Object> getMyQaList(int pageNum, String userinfoId);
	
	Map<String, Object> getQaList1(int pageNum, int pageSize, String selectKeyword);
	
	/*마이페이지*/
	List<Qa> getUserQaListById(String userinfoId);//유저별 Qa 목록 조회 - 페이징 X

}
