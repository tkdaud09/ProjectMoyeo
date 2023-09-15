package com.moyeo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moyeo.dao.NoticeDAO;
import com.moyeo.dao.PackageDAO;
import com.moyeo.dao.ReviewDAO;
import com.moyeo.dto.Notice;
import com.moyeo.util.Pager;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
   private final NoticeDAO noticeDAO;

   //공지사항 등록
   @Override
   public void insertNotice(Notice notice) {
      noticeDAO.insertNotice(notice);
   }

   /*공지사항 리스트 조회
   @Override
   public List<Notice> selectNoticeList() {
      return noticeDAO.selectNoticeList();
   }
   */
   
   //공지사항 조회(상세정보)
   @Override
   public Notice selectNoticeInfo(int noticeIdx) {
      return noticeDAO.selectNoticeInfo(noticeIdx);
   }

   //공지사항 수정
   @Override
   public void updateNotice(Notice notice) {
      noticeDAO.updateNotice(notice);
   }
   
   //공지사항 삭제
   @Override
   public void deleteNotice(int noticeIdx) {
      noticeDAO.deleteNotice(noticeIdx);
   }

   //공지사항 조회수
   @Override
   public void viewcntNotice(int noticeIdx) {
      noticeDAO.viewcntNotice(noticeIdx);
      
   }

   //공지사항 리스트 조회 + 페이징
   //매개변수로 요청페이지 번호를 전달받아 게시글 목록이 저장된 객체와 페이지 번호 관련 객체를 Map 객체의 엔트리로 추가하여 반환하는 메소드
   @Override
   public Map<String, Object> selectNoticeList(int noticeIdx) {
      int totalNotice=noticeDAO.noticeCount();
      int pageSize= 10; //하나의 페이지에 출력될 게시글 개수 저장
      int blockSize=5;//하나의 블럭에 출력될 개수 저장
      
      Pager pager = new Pager(noticeIdx, totalNotice, pageSize, blockSize);
      
      Map<String, Object> pageMap=new HashMap<String, Object>();
      pageMap.put("startRow", pager.getStartRow());
      pageMap.put("endRow", pager.getEndRow());
      List<Notice> noticeList=noticeDAO.selectNoticeList(pageMap);
      
      Map<String, Object> resultMap=new HashMap<String, Object>();
      resultMap.put("pager", pager);
      resultMap.put("noticeList", noticeList);
      
      return resultMap;
      
   }

}
   /*
   @Override
   public void modifyNotice(Notice notice) {
      noticeDAO.updateNotice(notice);
      
   }

   @Override
   public void removeNotice(int noticeIdx) {
      noticeDAO.deleteNotice(noticeIdx);
      
   }

   @Override
   public Notice getNotice(int noticeIdx) {
      return noticeDAO.selectNotice(noticeIdx);
   }

   @Override
   public Map<String, Object> getNoticeList(int pageNum) {
      // TODO Auto-generated method stub
      return null;
   }
}*/