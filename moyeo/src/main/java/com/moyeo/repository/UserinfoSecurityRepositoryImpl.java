package com.moyeo.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.SecurityAuth;
import com.moyeo.dto.Userinfo;
import com.moyeo.mapper.UserinfoSecurityMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserinfoSecurityRepositoryImpl implements UserinfoSecurityRepository{
	private final SqlSession sqlSession;
	
	@Override
	public int insertUserinfoSecurity(Userinfo userinfo) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserinfoSecurityMapper.class).insertUserinfoSecurity(userinfo);
	}

	@Override
	public int insertSecurityAuth(SecurityAuth auth) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserinfoSecurityMapper.class).insertSecurityAuth(auth);
	}

	@Override
	public Userinfo selectUserinfoSecurityByUserid(String id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserinfoSecurityMapper.class).selectUserinfoSecurityByUserid(id);
	}

}
