package com.moyeo.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dao.NoticeDAO;
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
	public Map<String, Object> selectNoticeList(Map<String, Object> map) {
		int pageNum=1;

		if(map.get("pageNum") != null && !map.get("pageNum").equals("")) {
			pageNum=Integer.parseInt((String)map.get("pageNum"));
		}

		int pageSize=10;
		int totalBoard=noticeDAO.selectNoticeCount(map);
		int blockSize=5;

		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);

		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());

		List<Notice> noticeList=noticeDAO.selectNoticeList(map);

		Map<String, Object> result=new HashMap<String, Object>();
		result.put("pager", pager);
		result.put("noticeList", noticeList);

		return result;
	}

	@Override
	public Map<String, Object> getNoticeList(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = noticeDAO.selectNoticeCount1(selectKeyword);
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);
		
		List<Notice> noticeList = noticeDAO.selectNoticeList1(pageMap);
		
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("noticeList", noticeList);
		noticeMap.put("pager", pager);
		
		return noticeMap;
	}
}