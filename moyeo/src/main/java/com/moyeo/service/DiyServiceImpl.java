package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.DiyDAO;
import com.moyeo.dto.Diy;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class DiyServiceImpl implements DiyService {
	
	private final DiyDAO diyDao;
	
	@Override
	public void insertDiy(Diy diy) {
		diyDao.insertDiy(diy);
	System.out.println("DiyServiceImple 클래스 오");
	}
	
	@Override
	public void updateDiy(Diy diy) {
		// TODO Auto-generated method stub
		diyDao.updateDiy(diy);
	}
	@Override
	public void deleteDiy(String diy) {
		// TODO Auto-generated method stub
		diyDao.deleteDiy(diy);
	}
	
	@Override
	public Diy getDiy(String diyTitle) {
		// TODO Auto-generated method stub
		Diy diy=diyDao.selectDiy(diyTitle);
		return diy;
	}
	
	@Override
	public List<Diy> getDiyList() {
		// TODO Auto-generated method stub
		return diyDao.selectDiyList();
	}
	
}