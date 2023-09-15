package com.moyeo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dao.PackageDAO;
import com.moyeo.dao.ReviewDAO;
import com.moyeo.dto.Pack;
import com.moyeo.dto.Review;
import com.moyeo.util.Pager;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PackageServiceImpl implements PackageService {
	private final PackageDAO packageDAO;
	private final ReviewDAO reviewDAO;
	
	//패키지 상품 정보
	@Override
	public Pack getPackageInfo(int packIdx) {
		return packageDAO.selectPackageInfo(packIdx);
	}
	
	//패키지 제목으로 패키지 검색
	@Override
	public List<Pack> searchPackageByName(String packName) {
		return packageDAO.selectPackageByName(packName);
	}
	
	//패키지 전체 리스트 검색
	@Override
	public List<Pack> getPackage() {
		return packageDAO.selectPackage();
	}
	
	//패키지 등록
	@Override
	public void addPackage(Pack pack) {
		packageDAO.insertPackage(pack);
	}
	
	//패키지 수정
	@Override
	public void modifyPackage(Pack pack) {
		packageDAO.updatePackage(pack);
	}
	
	//패키지 상태
	@Override
	public int getPackageStatus(int packIdx) {
		return packageDAO.getPackageStatus(packIdx);
	}
	
	//패키지 상태 변경
	@Override
	public void modifyPackageStatus(Pack pack) {
		packageDAO.updatePackageStatus(pack);
	}
	
	//패키지 삭제
	@Override
	public void deletePackage(int packIdx) {
		packageDAO.deletePackage(packIdx);
	}
	
	/* 리뷰 */
	//최신 리뷰를 가져오는 메서드
	@Override
	public List<Review> getLatestReviews(int count) {
		return reviewDAO.selectLatestReviews(count);
	}
	
	/* 관리자 */
	//관리자가 패키지 검색 시 사용
	public Map<String, Object> getPackageList(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = packageDAO.selectPackageCount(selectKeyword);
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);
		
		List<Pack> packageList = packageDAO.selectPackageList(pageMap);
		
		Map<String, Object> packageMap = new HashMap<String, Object>();
		packageMap.put("packageList", packageList);
		packageMap.put("pager", pager);
		
		return packageMap;
	}
	
	//전체 패키지 리스트 조회 + 페이징
	@Override
	public Map<String, Object> getPackageListUser(int pageNum, String keyword) {
		int totalPack=packageDAO.packageCount(keyword);
		int pageSize=3;
		int blockSize=5;
		
		Pager pager=new Pager(pageNum, totalPack, pageSize, blockSize);
		
		Map<String, Object> pageMap=new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("keyword", keyword);
		
		List<Pack> packList=packageDAO.selectPackageListUser(pageMap);
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("packList", packList);
		
		return resultMap;
	}
	
	//진행중인 패키지 검색
	@Override
	public Map<String, Object> getContinuePackageList(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = packageDAO.selectContinuePackageCount(selectKeyword);
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);
		
		List<Pack> packageList = packageDAO.selectContinuePackageList(pageMap);
		
		Map<String, Object> packageMap = new HashMap<String, Object>();
		packageMap.put("packageList", packageList);
		packageMap.put("pager", pager);
		
		return packageMap;
	}
	
	//main페이지에서 마감임박 3개 출력
	@Override
	public List<Pack> getDeadlinePackage() {
		return packageDAO.selectDeadlinePackage();
	}
	
	//main페이지에서 BEST6 여행지를 출력
	@Override
	public List<Pack> getBestPackageByHeart() {
		return packageDAO.selectBestPackageByHeart();
	}

}