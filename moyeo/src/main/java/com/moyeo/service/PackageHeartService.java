package com.moyeo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.Pack;
import com.moyeo.dto.PackHeart;

public interface PackageHeartService {
	void addPackageHeart(PackHeart packHeart);
	void removePackageHeart(PackHeart packHeart);
	
	List<PackHeart> getPackageHeartListById(String userinfoId);//찜 목록 확인
	PackHeart getPackIdxWithId(@Param("packIdx") int packIdx, @Param("userinfoId") String userinfoId);//이미 찜한 게시물인지 조회
	
	PackHeart getPackHeartIdxByPackIdx(int packIdx);//패키지 번호로 찜 정보 검색
	
	void removeAllByPackIdx(int packIdx);//게시물 삭제시 하트 전체 삭제
	
	//userinfo-details
	Map<String, Object> getMyPackageHeartList(int pageNum, String accountId);
	
	/* 마이페이지 */
	List<Pack> getUserHeartListById(String userinfoId);//유저 아이디별 패키지 찜 목록 검색 
}
