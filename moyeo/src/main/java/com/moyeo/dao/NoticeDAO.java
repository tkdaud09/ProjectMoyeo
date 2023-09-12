package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import com.moyeo.dto.Notice;

public interface NoticeDAO {
   //공지사항 등록
   int insertNotice(Notice notice);    
   
   /*공지사항 전제 리스트 조회
   List<Notice> selectNoticeList(); 
   */
   
   //공지사항 조회(상세 정보)
   Notice selectNoticeInfo(int noticeIdx); 
   
   //공지사항 수정
   int updateNotice(Notice notice);
   
   //공지사항 삭제
   int deleteNotice(int noticeIdx);
   
   //공지사항 조회수 
   void viewcntNotice(int noticeIdx);
   
   //전체 게시글 조회(페이징)
   int selectNoticeCount(String keyword, String type);
   
   //페이징된 게시글 리스트 조회
   List<Notice> selectNoticeList(Map<String, Object>map);

}