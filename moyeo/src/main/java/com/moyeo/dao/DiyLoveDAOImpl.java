package com.moyeo.dao;

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
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyLoveMapper.class).insertDiyLove(diyLove);
	}

	@Override
	public int deleteDiyLove(DiyLove diyLove) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyLoveMapper.class).deleteDiyLove(diyLove);
	}

	@Override
	public DiyLove loveStatus() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyLoveMapper.class).loveStatus();
	}
	
	

}
