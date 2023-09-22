package com.moyeo.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;
import com.moyeo.mapper.UserinfoSecurityMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserinfoSecurityRepositoryImpl implements UserinfoSecurityRepository{
	private final SqlSession sqlSession;
	
	@Override
	public int insertUserinfoSecurity(UserinfoSecurity userinfo) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserinfoSecurityMapper.class).insertUserinfoSecurity(userinfo);
	}

	@Override
	public int insertUserinfoSecurityAuth(UserinfoSecurityAuth auth) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserinfoSecurityMapper.class).insertUserinfoSecurityAuth(auth);
	}

	@Override
	public UserinfoSecurity selectUserinfoSecurityByUserid(String id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserinfoSecurityMapper.class).selectUserinfoSecurityByUserid(id);
	}

}
