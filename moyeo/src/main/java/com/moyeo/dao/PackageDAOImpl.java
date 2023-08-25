package com.moyeo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Pack;
import com.moyeo.mapper.PackageMapper;


import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class PackageDAOImpl implements PackageDAO {
	private final SqlSession sqlSession;
	
	@Override
	public int insertPackage(Pack pack) {
		return sqlSession.getMapper(PackageMapper.class).insertPackage(pack);
	}
	
}
