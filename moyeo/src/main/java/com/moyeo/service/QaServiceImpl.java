package com.moyeo.service;
 
import java.util.HashMap;  
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.moyeo.dao.QaDAO;
import com.moyeo.dto.Qa;
import com.moyeo.util.Pager;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QaServiceImpl implements QaService {
	private final QaDAO qaDAO;
	
	/* 회원 */
	//1:1 문의 등록
	@Override
	public void addQa(Qa qa) {
		qaDAO.insertQa(qa);
	}
	
	//1:1 문의 수정
	@Override
	public void modifyQa(Qa qa) {
		qaDAO.updateQa(qa);
	}
	
	//1:1 문의 삭제
	@Override
	public void removeQa(int qaIdx) {
		qaDAO.deleteQa(qaIdx);
	}

	/* 검색 */
	//1:1 문의 상세 페이지
	@Override
	public Qa getQaInfo(int qaIdx) {
		return qaDAO.selectQaInfo(qaIdx);
	}
	
	//1:1 문의 전체 리스트 검색
	@Override
	public Map<String, Object> getQaList(int pageNum, int pageSize, String searchKeyword, String searchType) {
		int totalBoard = qaDAO.selectQaCount(searchKeyword, searchType);
	
		Pager pager=new Pager(pageNum, totalBoard, pageSize, 5);
		
		Map<String, Object> pageMap=new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("searchKeyword", searchKeyword);
	    pageMap.put("searchType", searchType);
		
		List<Qa> qaList=qaDAO.selectQaList(pageMap);
		
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("qaList", qaList);
		resultMap.put("pager", pager);
		
		return resultMap;
	}

	/*답변관련*/
	@Override
	public void modifyReplyStatusToOne(int qaIdx) {
		qaDAO.updateQaReplyStatusToOne(qaIdx);
		
	}

	@Override
	public void modifyReplyStatusToZero(int qaIdx) {
		qaDAO.updateQaReplyStatusToZero(qaIdx);
		
	}

	@Override
	public Map<String, Object> getMyQaList(int pageNum, String userinfoId) {
		int totalBoard = qaDAO.selectMyQaCount(userinfoId);
		int blockSize = 5;
		int pageSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("userinfoId", userinfoId);
		
		List<Qa> qaList = qaDAO.selectMyQaList(pageMap);
		
		Map<String, Object> qaMap = new HashMap<String, Object>();
		qaMap.put("qaList", qaList);
		qaMap.put("pager", pager);
		
		return qaMap;
	}

	@Override
	public Map<String, Object> getQaList1(int pageNum, int pageSize, String selectKeyword) {
		int totalBoard = qaDAO.selectQaCount1(selectKeyword);
		int blockSize = 10;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		pageMap.put("selectKeyword", selectKeyword);
		
		List<Qa> qaList = qaDAO.selectQaList(pageMap);
		
		Map<String, Object> qaMap = new HashMap<String, Object>();
		qaMap.put("qaList", qaList);
		qaMap.put("pager", pager);
		
		return qaMap;
	}
}