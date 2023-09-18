package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Pack;
import com.moyeo.dto.Review;
import com.moyeo.mapper.PackageMapper;
import com.moyeo.mapper.ReviewMapper;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class PackageDAOImpl implements PackageDAO {
	private final SqlSession sqlSession;
	
	//패키지 상품 정보
	@Override
	public Pack selectPackageInfo(int packIdx) {
		return sqlSession.getMapper(PackageMapper.class).selectPackageInfo(packIdx);
	}
	
	//패키지 제목으로 패키지 검색
	@Override
	public List<Pack> selectPackageByName(String packName) {
		return sqlSession.getMapper(PackageMapper.class).selectPackageByName(packName);
	}
	
	//패키지 전체 리스트 검색
	@Override
	public List<Pack> selectPackage() {
		return sqlSession.getMapper(PackageMapper.class).selectPackage();
	}
	
	//패키지 등록
	@Override
	public int insertPackage(Pack pack) {
		return sqlSession.getMapper(PackageMapper.class).insertPackage(pack);
	}
	
	//패키지 변경
	@Override
	public int updatePackage(Pack pack) {
		return sqlSession.getMapper(PackageMapper.class).updatePackage(pack);
	}
	
	//패키지 상태
	@Override
	public int getPackageStatus(int packIdx) {
		return sqlSession.getMapper(PackageMapper.class).getPackageStatus(packIdx);
	}
	
	//패키지 상태 변경 (status 0 : 활성화 1: 비활성화)
	@Override
	public int updatePackageStatus(Pack pack) {
		return sqlSession.getMapper(PackageMapper.class).updatePackageStatus(pack);
	}
	
	//패키지 삭제
	@Override
	public int deletePackage(int packIdx) {
		return sqlSession.getMapper(PackageMapper.class).deletePackage(packIdx);
	}
	
	//전체 패키지 조회(페이징)
	@Override
	public int packageCount(Map<String, Object> map) {
		return sqlSession.getMapper(PackageMapper.class).packageCount(map);
	}
	
	/* 리뷰 */
	//최신 리뷰를 가져오는 메서드
	@Override
	public List<Review> selectLatestReviews(int count) {
		return sqlSession.getMapper(ReviewMapper.class).selectLatestReviews(count);
	}
	
	/* 관리자 */
	//패키지 검색
	@Override
	public List<Pack> selectPackageList(Map<String, Object> map) {
		return sqlSession.getMapper(PackageMapper.class).selectPackageList(map);
	}
	
	//진행중인 패키지 검색
	@Override
	public List<Pack> selectContinuePackageList(Map<String, Object> map) {
		return sqlSession.getMapper(PackageMapper.class).selectContinuePackageList(map);
	}
	
	//페이징된 게시글 리스트 조회
	@Override
	public List<Pack> selectPackageListUser(Map<String, Object> map) {
		return sqlSession.getMapper(PackageMapper.class).selectPackageListUser(map);
	}
	
	//main페이지에서 마감임박 3개 출력
	@Override
	public List<Pack> selectDeadlinePackage() {
		return sqlSession.getMapper(PackageMapper.class).selectDeadlinePackage();

	}
	
	//main페이지에서 BEST6 여행지를 출력
	@Override
	public List<Pack> selectBestPackageByHeart() {
		return sqlSession.getMapper(PackageMapper.class).selectBestPackageByHeart();
	}
	
	//갯수 반환
	@Override
	public int selectPackageCount(String selectKeyword) {
		return sqlSession.getMapper(PackageMapper.class).selectPackageCount(selectKeyword);
	}

	@Override
	public int selectContinuePackageCount(String selectKeyword) {
		return sqlSession.getMapper(PackageMapper.class).selectContinuePackageCount(selectKeyword);
	}

}
