package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Pack;
import com.moyeo.mapper.PackageMapper;


import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class PackageDAOImpl implements PackageDAO {
	private final SqlSession sqlSession;
	
	//패키지 등록
	@Override
	public int insertPackage(Pack pack) {
		return sqlSession.getMapper(PackageMapper.class).insertPackage(pack);
	}

	//패키지 상품 정보
	@Override
	public Pack selectPackInfo(int packIdx) {
		return sqlSession.getMapper(PackageMapper.class).selectPackInfo(packIdx);
	}

	//패키지 수정
	@Override
	public int updatePack(Pack pack) {
		return sqlSession.getMapper(PackageMapper.class).updatePack(pack);
	}
	
	/* 검색 */
	
	//패키지 리스트
	@Override
	public List<Pack> selectPackList() {
		return sqlSession.getMapper(PackageMapper.class).selectPackList();
	}
	
}
