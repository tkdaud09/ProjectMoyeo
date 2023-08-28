package com.moyeo.mapper;

import com.moyeo.dto.Pack;

public interface PackageMapper {
	int insertPackage(Pack pack);//패키지 등록
	Pack selectPackInfo(int packIdx); //패키지 상품 정보 
	int updatePack(Pack pack); //패키지 수정
}
