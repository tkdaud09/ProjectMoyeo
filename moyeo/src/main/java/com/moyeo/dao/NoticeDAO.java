package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Notice;

public interface NoticeDAO {
	int insertNotice(Notice notice);
    int updateNotice(Notice notice);
    int deleteNotice(int noticeIdx);
    List<Notice> selectNotice(String param);
    int selectNoticeCount();
    List<Notice> selectNoticeList(Map<String,Object>map);
}
