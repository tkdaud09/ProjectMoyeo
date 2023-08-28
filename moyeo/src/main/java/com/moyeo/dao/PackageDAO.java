package com.moyeo.dao;

import com.moyeo.dto.Pack;

public interface PackageDAO {
	/* 관리자 */
	int insertPackage(Pack pack);//패키지 등록
	Pack selectPackInfo(int packIdx); //패키지 상품 정보
	int updatePack(Pack pack); //패키지 수정
}
