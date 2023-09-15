package com.moyeo.service;

import java.util.List; 

import org.springframework.stereotype.Service;
import com.moyeo.dao.QaDAO;
import com.moyeo.dao.QaReplyDAO;
import com.moyeo.dto.QaReply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QaReplyServiceImpl implements QaReplyService {
	private final QaReplyDAO qaReplyDAO;
	
	private final QaDAO qaDAO;
	
	@Override
	public void addQaReply(QaReply qaReply) {
		qaReplyDAO.insertQaReply(qaReply);
		
		//답변 상태를 1로 업데이트
		int qaIdx = qaReply.getQaIdx();
        qaDAO.updateQaReplyStatusToOne(qaIdx);
	}

	@Override
	public void modifyQaReply(QaReply qaReply) {
		qaReplyDAO.updateQaReply(qaReply);
	}
	
	
	@Override
	public void removeQaReply(QaReply qaReply) {
		qaReplyDAO.deleteQaReply(qaReply);
		
	}
	
	/*검색*/
	
	//전체 댓글 조회
	@Override
	public List<QaReply> getQaReplyList(int qaIdx) {
		return qaReplyDAO.selectQaReplyList(qaIdx);
	}
	
	//단일 댓글 조회
	@Override
	public QaReply getQaReply(QaReply qaReply) {
		return qaReplyDAO.selectQaReply(qaReply);
	}

	@Override
	public int getQaReplyCount(int qaIdx) {
		return qaReplyDAO.selecQaReplyCount(qaIdx);
	}
}
