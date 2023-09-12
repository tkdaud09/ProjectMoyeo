package com.moyeo.service;

import org.springframework.stereotype.Service;

import com.moyeo.dao.PackageHeartDAO;
import com.moyeo.dto.PackHeart;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PackageHeartServiceImpl implements PackageHeartService {
	private final PackageHeartDAO packageHeartDAO;

	@Override
	public void addPackageHeart(PackHeart packHeart) {
		packageHeartDAO.insertPackageHeart(packHeart);
	}

	@Override
	public void removePackageHeart(PackHeart packHeart) {
		packageHeartDAO.deletePackageHeart(packHeart);
	}

	@Override
	public PackHeart getPackageHeartById(String userinfoId) {
		return packageHeartDAO.selectPackageHeartById(userinfoId);
	}

	
}
