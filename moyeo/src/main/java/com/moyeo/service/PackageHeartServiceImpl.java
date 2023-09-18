package com.moyeo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dao.PackageHeartDAO;
import com.moyeo.dto.Pack;
import com.moyeo.dto.PackHeart;
import com.moyeo.util.Pager;

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
	
	//userinfo-details
	@Override
	public Map<String, Object> getMyPackageHeartList(int pageNum, String accountId) {
		int totalBoard = packageHeartDAO.selectMyPackageHeartCount(accountId);
		int blockSize = 5;
		int pageSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("accountId", accountId);
		
		List<PackHeart> packHeartList = packageHeartDAO.selectMyPackageHeartList(pageMap);
		
		Map<String, Object> packageHeartMap = new HashMap<String, Object>();
		packageHeartMap.put("packHeartList", packHeartList);
		packageHeartMap.put("pager", pager);
		
		return packageHeartMap;
	}
	
	@Override
	public List<Pack> getUserHeartListById(String userinfoId) {
		return packageHeartDAO.selectUserHeartListById(userinfoId);
	}

	@Override
	public void removeAllByPackIdx(int packIdx) {
		packageHeartDAO.deleteAllByPackIdx(packIdx);
	}
	
}
