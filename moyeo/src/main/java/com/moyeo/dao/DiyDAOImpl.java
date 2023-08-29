package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Diy;
import com.moyeo.mapper.DiyMapper;

import lombok.RequiredArgsConstructor;



@Repository
@RequiredArgsConstructor
public class DiyDAOImpl implements DiyDAO {
	
	private final SqlSession sqlSession;

	@Override
	public int insertDiy(Diy diy) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).insertDiy(diy);
	}

	@Override
	public int updateDiy(Diy diy) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).updateDiy(diy);
	}

	@Override
	public int deleteDiy(int diyIdx) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).deleteDiy(diyIdx);
	}

	@Override
	public Diy selectDiy(int diyIdx) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiy(diyIdx);
	}

	@Override
	public List<Diy> selectDiyList() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyList();
	}

	@Override
	public List<Diy> selectDiyList(String diyTitle) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyList(diyTitle);
	}

	@Override
	public int selectDiyListCount() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyListCount();
	}


	// *** 내용으로도 검색하는거 만들기
	

}
