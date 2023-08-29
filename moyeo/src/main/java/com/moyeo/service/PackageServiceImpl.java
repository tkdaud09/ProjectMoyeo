package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.PackageDAO;
import com.moyeo.dto.Pack;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PackageServiceImpl implements PackageService {
	
	private final PackageDAO packageDAO;
	
	/* 관리자 */
	
	//패키지 등록 
	@Override
	public void addPackage(Pack pack) {
		packageDAO.insertPackage(pack);
	}

	//패키지 상품 정보 (상세페이지)
	@Override
	public Pack selectPackInfo(int packIdx) {
		return packageDAO.selectPackInfo(packIdx);
	}

	//패키지 수정
	@Override
	public int updatePackage(Pack pack) {
		return packageDAO.updatePack(pack);
	}
	
	/* 검색 */
		
	//전체 패키지 리스트
	@Override
	public List<Pack> getPackageList() {
		return packageDAO.selectPackList();
	}
}