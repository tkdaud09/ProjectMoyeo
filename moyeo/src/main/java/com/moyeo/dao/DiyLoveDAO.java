package com.moyeo.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.DiyLove;

public interface DiyLoveDAO {
	int insertDiyLove(DiyLove diyLove);
	int deleteDiyLove(DiyLove diyLove);
	
	// 로그인 아이디로 좋아요 누른 목록 확인 
	List<DiyLove> selectDiyLoveListById(String userinfoId);
	
	// diyIdx, userinfoId 로 좋아요 상태 확인 
	DiyLove selectDiyLoveStatusByIdByDiyIdx(@Param("diyIdx") int diyIdx, @Param("userinfoId") String userinfoId);
	
	// 리스트 페이지에서의 좋아요 상태확인
	List<DiyLove> selectDiyLoveStatusByIdByDiyIdxList(@Param("diyIdx") int diyIdx, @Param("userinfoId") String userinfoId);
	
	// 게시물 삭제시 좋아요도 삭제 
	int deleteAllByDiyIdx(int diyIdx);
	
	DiyLove selectDiyLoveByIdx (int diyIdx);
	
	// List<DiyLove> selectloveStatusList(Map<String, Object>map);
}
