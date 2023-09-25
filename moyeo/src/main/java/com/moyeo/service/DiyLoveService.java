package com.moyeo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.DiyLove;

public interface DiyLoveService {
	void addDiyLove(DiyLove diyLove);
	void removeDiyLove(DiyLove diyLove);
	
	// 로그인 아이디로 좋아요 누른 목록 확인 
	List<DiyLove> getDiyLoveListById(String userinfoId);
	
	// diyIdx, userinfoId 로 좋아요 상태 확인 
	DiyLove getDiyLoveStatusByIdByDiyIdx(@Param("diyIdx") int diyIdx, @Param("userinfoId") String userinfoId);
	
	// 리스트 페이지에서의 좋아요 상태확인
	List<DiyLove> getDiyLoveStatusByIdByDiyIdxList(@Param("diyIdx") int diyIdx, @Param("userinfoId") String userinfoId);
	
	// 게시물 삭제시 좋아요도 삭제 
	void deleteAllByDiyIdx(int diyIdx);
	
	DiyLove getDiyLoveByIdx (int diyIdx);
	
	// 좋아요 상태 목록
	// List<DiyLove> loveStatusList(Map<String, Object> map);
	// Map<String, Object> getloveStatusList(Map<String, Object> map);
}
