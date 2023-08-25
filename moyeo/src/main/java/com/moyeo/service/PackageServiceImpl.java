package com.moyeo.service;

import org.springframework.stereotype.Service;

import com.moyeo.dao.PackageDAO;
import com.moyeo.dto.Pack;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

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
}
