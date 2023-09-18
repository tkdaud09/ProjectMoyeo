package com.moyeo.service;

import java.util.Map;
import com.moyeo.dto.Notice;

public interface NoticeService {
   //공지사항 등록
   void insertNotice(Notice notice);
   
   //공지사항 조회(상세 정보)
   Notice selectNoticeInfo(int noticeIdx);

   //공지사항 수정
   void updateNotice(Notice notice);

   //공지사항 삭제
   void deleteNotice(int noticeIdx);

   //공지사항 조회수
   void viewcntNotice(int noticeIdx);
   
   //페이징된 게시글 리스트 조회
   Map<String, Object> selectNoticeList(int pageNum, String keyword, String type);

	//count 관리자
	Map<String, Object> getNoticeList(int pageNum, int pageSize, String selectKeyword);
	
}