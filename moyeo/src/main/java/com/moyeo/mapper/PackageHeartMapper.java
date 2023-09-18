package com.moyeo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moyeo.dto.Pack;
import com.moyeo.dto.PackHeart;

public interface PackageHeartMapper {
	int insertPackageHeart(PackHeart packHeart);//삽입
	int deletePackageHeart(PackHeart packHeart);//삭제
	
	List<PackHeart> selectPackageHeartById(String userinfoId);//찜 목록 확인
	PackHeart selectPackIdxWithId(@Param("packIdx") int packIdx, @Param("userinfoId") String userinfoId);//이미 찜한 게시물인지 조회
	
	PackHeart selectPackHeartIdxByPackIdx(int packIdx);//패키지 번호로 찜 정보 검색
	
	int deleteAllByPackIdx(int packIdx);//게시물 삭제시 하트 전체 삭제
	
	//userinfo-details
	int selectMyPackageHeartCount(String userinfoId);
	List<PackHeart> selectMyPackageHeartList(Map<String, Object> map);
	
	/* 마이페이지 */
	List<Pack> selectUserHeartListById(String userinfoId);//유저 아이디별 패키지 찜 목록 검색
	
}
