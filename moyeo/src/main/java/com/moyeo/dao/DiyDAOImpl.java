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
		System.out.println("DiyDAOImple 클래스 오류");
		return sqlSession.getMapper(DiyMapper.class).insertDiy(diy);
	}

	@Override
	public int updateDiy(Diy diy) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).updateDiy(diy);
	}

	@Override
	public int deleteDiy(String diyIdx) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).deleteDiy(diyIdx);
	}
	
	@Override
	public Diy selectDiy(String diyTitle) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiy(diyTitle);
	}
	

	@Override
	public List<Diy> selectDiyList() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyList();
	}
	
	

}
