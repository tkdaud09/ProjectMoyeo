package com.moyeo.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dao.DiyDAO;
import com.moyeo.dto.Diy;
import com.moyeo.exception.DiyNotFoundException;
import com.moyeo.util.Pager;

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
	public void loveCheck(Diy diy) {
		// TODO Auto-generated method stub
		diyDao.loveCheck(diy);
	}
	
	@Override
	public void loveCancel(Diy diy) {
		// TODO Auto-generated method stub
		diyDao.loveCancel(diy);
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
	public Map<String, Object> selectDiyList(int pageNum) {
		// TODO Auto-generated method stub
		int totalBoard=diyDao.selectDiyListCount();
		int pageSize= 6; //하나의 페이지에 출력될 게시글 개수 저장
		int blockSize=5; //하나의 블럭에 출력될 개수 저장
		
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap=new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		
		List<Diy> selectDiyList=diyDao.selectDiyList(pageMap);
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("diyList", selectDiyList);
		
		List<Diy> existDiy = diyDao.selectDiyList(resultMap);
	    if (existDiy == null) {
	        throw new DiyNotFoundException("존재하는 글이 없습니다");
	    }
	    
		return resultMap;
	}
	
	@Override
	public List<Diy> selectDiyListByTitle(String diyTitle) {
		// TODO Auto-generated method stub
		List<Diy> existDiy = diyDao.selectDiyListByTitle(diyTitle);
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
	public Diy getUserinfoById(int diyIdx) {
		// TODO Auto-generated method stub
		return diyDao.getUserinfoById(diyIdx);
	}

	// 지도 추가하기
	
	
	
	
	//userinfo-details
	@Override
	public Map<String, Object> getMyDiyList(int pageNum, String userinfoId) {
		int totalBoard = diyDao.selectMyDiyCount(userinfoId);
		int blockSize = 5;
		int pageSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("userinfoId", userinfoId);
		
		List<Diy> diyList = diyDao.selectMyDiyList(pageMap);
		
		Map<String, Object> diyMap = new HashMap<String, Object>();
		diyMap.put("diyList", diyList);
		diyMap.put("pager", pager);
		
		return diyMap;
	}
	
}