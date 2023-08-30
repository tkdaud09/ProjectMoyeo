package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.DiyDAO;
import com.moyeo.dto.Diy;
import com.moyeo.exception.DiyNotFoundException;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class DiyServiceImpl implements DiyService {
	
	private final DiyDAO diyDao;
	
	@Override
	public void insertDiy(Diy diy) {
		// TODO Auto-generated method stub
		diyDao.insertDiy(diy);
	}

	@Override
	public void updateDiy(Diy diy) {
		// TODO Auto-generated method stub
		diyDao.updateDiy(diy);
	}
	
	@Override
	public void deleteDiy(int diyIdx) {
		// TODO Auto-generated method stub
		Diy existDiy = diyDao.selectDiy(diyIdx);
	    if (existDiy == null) {
	        throw new DiyNotFoundException("작성한 글을 찾을 수 없습니다");
	    }
		diyDao.deleteDiy(diyIdx);
	}

	@Override
	public Diy selectDiy(int diyIdx) {
		// TODO Auto-generated method stub
		return diyDao.selectDiy(diyIdx);
	}

	@Override
	public List<Diy> selectDiyList() {
		// TODO Auto-generated method stub
		List<Diy> existDiy = diyDao.selectDiyList();
	    if (existDiy == null) {
	        throw new DiyNotFoundException("존재하는 글이 없습니다");
	    }
		return diyDao.selectDiyList();
	}

	@Override
	public List<Diy> selectDiyList(String diyTitle) {
		// TODO Auto-generated method stub
		List<Diy> existDiy = diyDao.selectDiyList(diyTitle);
	    if (existDiy == null) {
	        throw new DiyNotFoundException("해당 제목의 글이 없습니다");
	    }
		return existDiy;
	}

	@Override
	public int selectDiyListCount() {
		// TODO Auto-generated method stub
		return diyDao.selectDiyListCount();
	}

	@Override
	public Diy getUserinfoById(String userinfoId) {
		// TODO Auto-generated method stub
		return diyDao.getUserinfoById(userinfoId);
	}
	
	
	// 지도 추가하기
	

	
}