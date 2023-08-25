package com.moyeo.service;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Notice;
import com.moyeo.mapper.NoticeMapper;

public interface NoticeService {
	void addNotice(Notice notice);
	void modifyNotice(Notice notice);
	void removeNotice(int noticeIdx);
	
	Notice getNotice(int noticeIdx);
	Map<String, Object> getNoticeList(int pageNum);
	
	}
	
	/*
	
	@Override
    public List<Notice> selectNoticeList(String param) {  
		if (param == null) {	           
		return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(param);
		        } else {
		            return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(param);
		        }
		    }

	*/

