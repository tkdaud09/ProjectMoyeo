package com.moyeo.service;

import java.util.List;

import com.moyeo.dto.QaReply;

public interface QaReplyService {
	void addQaReply(QaReply qaReply);
	void modifyQaReply(QaReply qaReply);
	void removeQaReply(QaReply qaReply);
	
	List<QaReply> getQaReplyList(int qaIdx);
}
