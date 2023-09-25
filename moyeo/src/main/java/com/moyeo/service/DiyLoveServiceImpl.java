package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.DiyLoveDAO;
import com.moyeo.dto.DiyLove;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DiyLoveServiceImpl implements DiyLoveService {

	private final DiyLoveDAO diyLoveDao;

	@Override
	public void addDiyLove(DiyLove diyLove) {
		diyLoveDao.insertDiyLove(diyLove);
	}

	@Override
	public void removeDiyLove(DiyLove diyLove) {
		diyLoveDao.deleteDiyLove(diyLove);
	}

	@Override
	public List<DiyLove> getDiyLoveListById(String userinfoId) {
		return diyLoveDao.selectDiyLoveListById(userinfoId);
	}

	@Override
	public DiyLove getDiyLoveStatusByIdByDiyIdx(int diyIdx, String userinfoId) {
		return diyLoveDao.selectDiyLoveStatusByIdByDiyIdx(diyIdx, userinfoId);
	}

	@Override
	public void deleteAllByDiyIdx(int diyIdx) {
		diyLoveDao.deleteAllByDiyIdx(diyIdx);
	}

	@Override
	public List<DiyLove> getDiyLoveStatusByIdByDiyIdxList(int diyIdx, String userinfoId) {
		// TODO Auto-generated method stub
		return diyLoveDao.selectDiyLoveStatusByIdByDiyIdxList(diyIdx, userinfoId);
	}

	@Override
	public DiyLove getDiyLoveByIdx(int diyIdx) {
		// TODO Auto-generated method stub
		return diyLoveDao.selectDiyLoveByIdx(diyIdx);
	}

	

}
