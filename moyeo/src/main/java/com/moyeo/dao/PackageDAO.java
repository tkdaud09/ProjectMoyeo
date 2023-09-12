package com.moyeo.dao;

import java.util.List;

import com.moyeo.dto.Pack;

public interface PackageDAO {
	/* 관리자 */
	int insertPackage(Pack pack);//패키지 등록
	int updatePack(Pack pack); //패키지 수정
	
	/* 검색 */
	List<Pack> selectPackList();//패키지 전체 리스트 검색
	Pack selectPackInfo(int packIdx); //패키지 상품 정보
}
