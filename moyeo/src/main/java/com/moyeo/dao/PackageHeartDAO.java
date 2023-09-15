package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.PackHeart;

public interface PackageHeartDAO {
	int insertPackageHeart(PackHeart packHeart);
	int deletePackageHeart(PackHeart packHeart);
	
	List<PackHeart> selectPackageHeartById(String userinfoId);//찜 목록 확인
	PackHeart selectPackIdxWithId(@Param("packIdx") int packIdx, @Param("userinfoId") String userinfoId);//이미 찜한 게시물인지 조회
	
	PackHeart selectPackHeartIdxByPackIdx(int packIdx);//패키지 번호로 찜 정보 검색
	
	
	//userinfo-details
	int selectMyPackageHeartCount(String userinfoId);
	List<PackHeart> selectMyPackageHeartList(Map<String, Object> map);
}
