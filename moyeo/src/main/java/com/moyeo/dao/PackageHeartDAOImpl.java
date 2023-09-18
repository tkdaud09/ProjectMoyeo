package com.moyeo.dao;

import java.util.List; 
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Pack;
import com.moyeo.dto.PackHeart;
import com.moyeo.mapper.PackageHeartMapper;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class PackageHeartDAOImpl implements PackageHeartDAO {
	
	private final SqlSession sqlSession;
	
	@Override
	public int insertPackageHeart(PackHeart packHeart) {
		return sqlSession.getMapper(PackageHeartMapper.class).insertPackageHeart(packHeart);
	}

	@Override
	public int deletePackageHeart(PackHeart packHeart) {
		return sqlSession.getMapper(PackageHeartMapper.class).deletePackageHeart(packHeart);
	}

	@Override
	public List<PackHeart> selectPackageHeartById(String userinfoId) {
		return sqlSession.getMapper(PackageHeartMapper.class).selectPackageHeartById(userinfoId);
	}

	@Override
	public PackHeart selectPackIdxWithId(int packIdx, String userinfoId) {
		return sqlSession.getMapper(PackageHeartMapper.class).selectPackIdxWithId(packIdx, userinfoId);
	}

	@Override
	public PackHeart selectPackHeartIdxByPackIdx(int packIdx) {
		return sqlSession.getMapper(PackageHeartMapper.class).selectPackHeartIdxByPackIdx(packIdx);
	}		

	@Override
	public int selectMyPackageHeartCount(String userinfoId) {
		return sqlSession.getMapper(PackageHeartMapper.class).selectMyPackageHeartCount(userinfoId);
	}

	@Override
	public List<PackHeart> selectMyPackageHeartList(Map<String, Object> map) {
		return sqlSession.getMapper(PackageHeartMapper.class).selectMyPackageHeartList(map);
	}

	@Override
	public List<Pack> selectUserHeartListById(String userinfoId) {
		return sqlSession.getMapper(PackageHeartMapper.class).selectUserHeartListById(userinfoId);
	}
	
	@Override
	public int deleteAllByPackIdx(int packIdx) {
		return sqlSession.getMapper(PackageHeartMapper.class).deleteAllByPackIdx(packIdx);
	}
		
}
