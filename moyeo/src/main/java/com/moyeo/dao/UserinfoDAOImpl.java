package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Userinfo;
import com.moyeo.mapper.UserinfoMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserinfoDAOImpl implements UserinfoDAO {
        private final SqlSession sqlSession;

		@Override
		public int insertUserinfo(Userinfo userinfo) {
            return sqlSession.getMapper(UserinfoMapper.class).insertUserinfo(userinfo);
		}

		@Override
		public int updateUserinfo(Userinfo userinfo) {
            return sqlSession.getMapper(UserinfoMapper.class).updateUserinfo(userinfo);
		}

		@Override
		public int deleteUserinfo(String id) {
            return sqlSession.getMapper(UserinfoMapper.class).deleteUserinfo(id);
		}

		@Override
		public Userinfo selectUserinfo(String id) {
            return sqlSession.getMapper(UserinfoMapper.class).selectUserinfo(id);
		}

		@Override
		public List<Userinfo> selectUserinfoList() {
            return sqlSession.getMapper(UserinfoMapper.class).selectUserinfoList();
		}

        
}