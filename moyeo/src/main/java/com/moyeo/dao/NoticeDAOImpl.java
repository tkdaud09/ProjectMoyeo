package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Notice;
import com.moyeo.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeDAOImpl implements NoticeDAO{
   private final SqlSession sqlSession;

   //공지사항 등록
   @Override
   public int insertNotice(Notice notice) {
      return sqlSession.getMapper(NoticeMapper.class).insertNotice(notice);
   }

   //공지사항 조회(상세 정보)
   @Override
   public Notice selectNoticeInfo(int noticeIdx) {
      return sqlSession.getMapper(NoticeMapper.class).selectNoticeInfo(noticeIdx);
   }
   
   //공지사항 수정
   @Override
   public int updateNotice(Notice notice) {
      return sqlSession.getMapper(NoticeMapper.class).updateNotice(notice);
   }
   
   //공지사항 삭제
   @Override
   public int deleteNotice(int noticeIdx) {
      return sqlSession.getMapper(NoticeMapper.class).deleteNotice(noticeIdx);
   }

   //공지사항 조회수
   @Override
   public void viewcntNotice(int noticeIdx) {
      sqlSession.getMapper(NoticeMapper.class).viewcntNotice(noticeIdx);
   }

   //전체 게시글 조회(페이징) + 검색
   @Override
   public int selectNoticeCount(String keyword, String type) {
      return sqlSession.getMapper(NoticeMapper.class).selectNoticeCount();
   }

   //페이징된 게시글 리스트 조회 + 검색
   @Override
   public List<Notice> selectNoticeList(Map<String, Object> map) {
	   return sqlSession.getMapper(NoticeMapper.class).selectNoticeList(map);
   }
   
}

   