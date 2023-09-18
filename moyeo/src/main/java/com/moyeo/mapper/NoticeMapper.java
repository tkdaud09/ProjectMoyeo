package com.moyeo.mapper;

import com.moyeo.dto.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
   //공지사항 등록
   int insertNotice(Notice notice); 
   
   //공지사항 조회(상세 정보)
   Notice selectNoticeInfo(int noticeIdx);
   
   //공지사항 수정
   int updateNotice(Notice notice);
   
   //공지사항 삭제
   int deleteNotice(int noticeIdx);
   
   //공지사항 조회수
   int viewcntNotice(int noticeIdx);
   
   //전체 게시글 조회(페이징)
   int selectNoticeCount();
   
   //페이징된 게시글 리스트 조회
   List<Notice> selectNoticeList(Map<String, Object> map);
   
   //count 관리자
   List<Notice> selectNoticeList1(Map<String, Object> map);
   int selectNoticeCount1(String selectKeyword);
}