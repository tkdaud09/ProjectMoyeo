package com.moyeo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.PackHeart;

public interface PackageHeartMapper {
	int insertPackageHeart(PackHeart packHeart);//삽입
	int deletePackageHeart(PackHeart packHeart);//
	
	List<PackHeart> selectPackageHeartById(String userinfoId);//찜 목록 확인
	PackHeart selectPackIdxWithId(@Param("packIdx") int packIdx, @Param("userinfoId") String userinfoId);//이미 찜한 게시물인지 조회
	
	PackHeart selectPackHeartIdxByPackIdx(int packIdx);//패키지 번호로 찜 정보 검색
}
