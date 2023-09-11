package com.moyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.QaReply;
import com.moyeo.mapper.QaReplyMapper;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QaReplyDAOImpl implements QaReplyDAO {
	private final SqlSession sqlSession;
	
	//댓글 등록
	@Override
	public int insertQaReply(QaReply qaReply) {
		return sqlSession.getMapper(QaReplyMapper.class).insertQaReply(qaReply);
	}

	@Override
	public int updateQaReply(QaReply qaReply) {
		return sqlSession.getMapper(QaReplyMapper.class).updateQaReply(qaReply);
	}

	@Override
	public int deleteQaReply(QaReply qaReply) {
		return sqlSession.getMapper(QaReplyMapper.class).deleteQaReply(qaReply);
	}

	@Override
	public List<QaReply> selectQaReplyList(int qaIdx) {
		return sqlSession.getMapper(QaReplyMapper.class).selectQaReplyList(qaIdx);
	}

	@Override
	public QaReply selectQaReply(QaReply qaReply) {
		return sqlSession.getMapper(QaReplyMapper.class).selectQaReply(qaReply);
	}

	@Override
	public int selecQaReplyCount(int qaIdx) {
		return sqlSession.getMapper(QaReplyMapper.class).selecQaReplyCount(qaIdx);
	}
}
