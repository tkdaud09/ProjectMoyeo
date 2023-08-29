package com.moyeo.service;

import java.util.List;

import com.moyeo.dto.Pack;

public interface PackageService {
	/* 관리자 */
	void addPackage(Pack pack); //패키지 등록
	Pack selectPackInfo(int packIdx); //패키지 상품 정보
	int updatePackage(Pack pack); //패키지 수정
	
	/* 검색 */
	List<Pack> getPackageList();//패키지 전체 리스트
}	
