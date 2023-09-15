package com.moyeo.service;

import java.util.List;

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
	public List<PackHeart> getPackageHeartListById(String userinfoId) {
		return packageHeartDAO.selectPackageHeartById(userinfoId);
	}

	@Override
	public PackHeart getPackIdxWithId(int packIdx, String userinfoId) {
		return packageHeartDAO.selectPackIdxWithId(packIdx, userinfoId);
	}

	@Override
	public PackHeart getPackHeartIdxByPackIdx(int packIdx) {
		return packageHeartDAO.selectPackHeartIdxByPackIdx(packIdx);
	}
}
