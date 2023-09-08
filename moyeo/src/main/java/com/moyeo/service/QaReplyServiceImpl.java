package com.moyeo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.moyeo.dao.QaReplyDAO;
import com.moyeo.dto.QaReply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QaReplyServiceImpl implements QaReplyService {
	private final QaReplyDAO qaReplyDAO;
	
	
	@Override
	public void addQaReply(QaReply qaReply) {
		qaReplyDAO.insertQaReply(qaReply);
	}

	@Override
	public void modifyQaReply(QaReply qaReply) {
		qaReplyDAO.updateQaReply(qaReply);
	}

	@Override
	public void removeQaReply(QaReply qaReply) {
		qaReplyDAO.deleteQaReply(qaReply);
		
	}

	@Override
	public List<QaReply> getQaReplyList(int qaIdx) {
		return qaReplyDAO.selectQaReplyList(qaIdx);
	}

	

}
