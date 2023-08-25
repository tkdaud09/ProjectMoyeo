package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Notice;
import com.moyeo.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

/*
@Repository
@RequiredArgsConstructor
public class NoticeDAOImpl implements NoticeDAO{
	private final SqlSession sqlSession;
		
	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.getMapper(NoticeMapper.class).insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return sqlSession.getMapper(NoticeMapper.class).updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeIdx) {
		return sqlSession.getMapper(NoticeMapper.class).deleteNotice(noticeIdx);
	}
	
	@Override
    public List<Notice> selectNoticeList(String param) {  
		if (param == null) {	           
		return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(param);
		        } else {
		            return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(param);
		        }
		    }

	@Override
	public int selectNoticeCount() {
		return sqlSession.getMapper(NoticeMapper.class).selectNoticeCount();
	}

	@Override
	public List<Notice> selectNoticeList(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(map);
	}
}*/

	
