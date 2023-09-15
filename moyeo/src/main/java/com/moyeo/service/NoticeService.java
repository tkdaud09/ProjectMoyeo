package com.moyeo.service;

import java.util.Map;
import com.moyeo.dto.Notice;

public interface NoticeService {
   //공지사항 등록
   void insertNotice(Notice notice);
   
   /*공지사항 리스트 조회
   List<Notice> selectNoticeList();
   */
   
   //공지사항 조회(상세 정보)
   Notice selectNoticeInfo(int noticeIdx);

   //공지사항 수정
   void updateNotice(Notice notice);

   //공지사항 삭제
   void deleteNotice(int noticeIdx);

   //공지사항 조회수
   void viewcntNotice(int noticeIdx);
   
   //전체 게시글 조회(페이징)
   
   
   //페이징된 게시글 리스트 조회
   Map<String, Object> selectNoticeList(int noticeIdx);
}
   /*
   void modifyNotice(Notice notice);
   void removeNotice(int noticeIdx);
   
   Notice getNotice(int noticeIdx);
   Map<String, Object> getNoticeList(int pageNum);
   
   }
   
   
   @Override
    public List<Notice> selectNoticeList(String param) {  
      if (param == null) {              
      return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(param);
              } else {
                  return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(param);
              }
          }

   */
