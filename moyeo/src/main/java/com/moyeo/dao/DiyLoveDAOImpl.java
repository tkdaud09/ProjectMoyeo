package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.DiyLove;
import com.moyeo.mapper.DiyLoveMapper;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DiyLoveDAOImpl implements DiyLoveDAO {
	
	private final SqlSession sqlSession;
	
	@Override
	public int insertDiyLove(DiyLove diyLove) {
		return sqlSession.getMapper(DiyLoveMapper.class).insertDiyLove(diyLove);
	}
	
	@Override
	public int deleteDiyLove(DiyLove diyLove) {
		return sqlSession.getMapper(DiyLoveMapper.class).deleteDiyLove(diyLove);
	}

	@Override
	public List<DiyLove> selectDiyLoveListById(String userinfoId) {
		return sqlSession.getMapper(DiyLoveMapper.class).selectDiyLoveListById(userinfoId);
	}

	@Override
	public DiyLove selectDiyLoveStatusByIdByDiyIdx(int diyIdx, String userinfoId) {
		return sqlSession.getMapper(DiyLoveMapper.class).selectDiyLoveStatusByIdByDiyIdx(diyIdx, userinfoId);
	}

	@Override
	public int deleteAllByDiyIdx(int diyIdx) {
		return sqlSession.getMapper(DiyLoveMapper.class).deleteAllByDiyIdx(diyIdx);
	}

	@Override
	public List<DiyLove> selectDiyLoveStatusByIdByDiyIdxList(int diyIdx, String userinfoId) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyLoveMapper.class).selectDiyLoveStatusByIdByDiyIdxList(diyIdx, userinfoId);
	}

	@Override
	public DiyLove selectDiyLoveByIdx(int diyIdx) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyLoveMapper.class).selectDiyLoveByIdx(diyIdx);
	}


}
