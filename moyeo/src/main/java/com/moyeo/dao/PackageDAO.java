package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Pack;

public interface PackageDAO {
	
	//패키지 상품 정보
	Pack selectPackageInfo(int packIdx);
	
	//패키지 제목으로 패키지 검색
    List<Pack> selectPackageByName(String packName);
	
	//패키지 전체 리스트 검색
	List<Pack> selectPackage();
	
	//패키지 등록
	int insertPackage(Pack pack);
	
	//패키지 변경
	int updatePackage(Pack pack);
	
	//패키지 상태
	int getPackageStatus(int packIdx);
	
	//패키지 상태 변경 (status 0 : 활성화 1: 비활성화)
	int updatePackageStatus(Pack pack);
	
	//패키지 삭제
	int deletePackage(int packIdx);
	
	//전체 패키지 조회(페이징)
	int packageCount(String keyword);
	
	/* 관리자 */
	
	//관리자가 패키지 검색 시 사용
	List<Pack> selectPackageList(Map<String, Object> map);
	
	//페이징된 게시글 리스트 조회
	List<Pack> selectPackageListUser(Map<String, Object> map);
	
	//진행중인 패키지 검색
	List<Pack> selectContinuePackageList(Map<String, Object> map);
	
	//main페이지에서 마감임박 3개 출력하기 위한 메소드
	List<Pack> selectDeadlinePackage();
	
	//main페이지에서 BEST6 여행지를 출력하기 위한 메소드
	List<Pack> selectBestPackageByHeart();
	
	//갯수 반환
	int selectPackageCount(String selectKeyword);
	int selectContinuePackageCount(String selectKeyword);

}
