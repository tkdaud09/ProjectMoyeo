package com.moyeo.service;

import org.springframework.stereotype.Service;

import com.moyeo.dao.DiyLoveDAO;
import com.moyeo.dto.DiyLove;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DiyLoveServiceImpl implements DiyLoveService {

	private final DiyLoveDAO diyLoveDao;
	
	@Override
	public void insertDiyLove(DiyLove diyLove) {
		// TODO Auto-generated method stub
		diyLoveDao.insertDiyLove(diyLove);
	}

	@Override
	public void deleteDiyLove(DiyLove diyLove) {
		// TODO Auto-generated method stub
		diyLoveDao.deleteDiyLove(diyLove);
	}

	@Override
	public DiyLove loveStatus() {
		// TODO Auto-generated method stub
		return diyLoveDao.loveStatus();
	}

}
