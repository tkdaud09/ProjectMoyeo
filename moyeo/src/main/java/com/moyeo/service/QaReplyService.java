package com.moyeo.service;

import java.util.List;

import com.moyeo.dto.QaReply;

public interface QaReplyService {
	void addQaReply(QaReply qaReply);
	void modifyQaReply(QaReply qaReply);
	void removeQaReply(QaReply qaReply);
	
	List<QaReply> getQaReplyList(int qaIdx);//전체 댓글 조회
	QaReply getQaReply(QaReply qaReply);//단일 댓글 조회
	
	int getQaReplyCount(int qaIdx);//댓글 갯수 조회
}
