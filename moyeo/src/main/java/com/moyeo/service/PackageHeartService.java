package com.moyeo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.PackHeart;

public interface PackageHeartService {
	void addPackageHeart(PackHeart packHeart);
	void removePackageHeart(PackHeart packHeart);
	
	List<PackHeart> getPackageHeartListById(String userinfoId);//찜 목록 확인
	PackHeart getPackIdxWithId(@Param("packIdx") int packIdx, @Param("userinfoId") String userinfoId);//이미 찜한 게시물인지 조회
	
	PackHeart getPackHeartIdxByPackIdx(int packIdx);//패키지 번호로 찜 정보 검색
}
