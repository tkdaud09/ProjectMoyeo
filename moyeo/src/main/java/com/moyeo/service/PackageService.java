package com.moyeo.service;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Review;

public interface PackageService {
	
	//패키지 상품 정보
	Pack getPackageInfo(int packIdx); //패키지 상품 정보
	
	//패키지 제목으로 패키지 검색
	List<Pack> searchPackageByName(String packName);
	
	//패키지 전체 리스트 검색
	List<Pack> getPackage();
	
	//패키지 등록
	void addPackage(Pack pack);
	
	//패키지 변경
	void modifyPackage(Pack pack);
	
	//패키지 상태
	int getPackageStatus(int packIdx);
	
	//패키지 상태 변경 (status 0 : 활성화 1: 비활성화)
	void modifyPackageStatus(Pack pack);
	
	//패키지 삭제
	void deletePackage(int packIdx);
	
	/* 리뷰 */
	//최신 리뷰를 가져오는 메서드
	List<Review> getLatestReviews(int count);
	
	/* 관리자 */
	//관리자가 패키지 검색 시 사용
	Map<String, Object> getPackageList(int pageNum, int pageSize, String selectKeyword);
	
	////페이징된 패키지 리스트 조회 + 검색
	Map<String, Object> getPackageListUser(Map<String, Object> map);
	
	//진행중인 패키지 검색
	Map<String, Object> getContinuePackageList(int pageNum, int pageSize, String selectKeyword);
	
	//main페이지에서 마감임박 3개 출력
	List<Pack> getDeadlinePackage();
	
	//main페이지에서 BEST6 여행지를 출력
	List<Pack> getBestPackageByHeart();
	
	//패키지 스케쥴러 업데이트
	void updatePackStatus(Pack pack);

}	
