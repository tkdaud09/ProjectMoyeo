package com.moyeo.dao;

import java.util.List;
import java.util.Map;

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
	public int loveCheck(Diy diy) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).loveCheck(diy);
	}

	@Override
	public int loveCancel(Diy diy) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).loveCancel(diy);
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
	public List<Diy> selectDiyList(Map<String, Object>map) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyList(map);
	}

	@Override
	public List<Diy> selectDiyListByTitle(String diyTitle) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyListByTitle(diyTitle);
	}

	@Override
	public int selectDiyListCount() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).selectDiyListCount();
	}

	@Override
	public Diy getUserinfoById(int diyIdx) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(DiyMapper.class).getUserinfoById(diyIdx);
	}


	// *** 내용으로도 검색하는거 만들기
	
	//userinfo-details
	@Override
	public int selectMyDiyCount(String accountId) {
		return sqlSession.getMapper(DiyMapper.class).selectMyDiyCount(accountId);
	}

	@Override
	public List<Diy> selectMyDiyList(Map<String, Object> map) {
		return sqlSession.getMapper(DiyMapper.class).selectMyDiyList(map);
	}

}
