package com.moyeo.mapper;

import com.moyeo.dto.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
    int insertNotice(Notice notice);
    int updateNotice(Notice notice);
    int deleteNotice(int noticeIdx);
    List<Notice> selectNoticeList(String param);
    int selectNoticeCount();
    List<Notice> selectNoticeList(Map<String,Object>map);

}
