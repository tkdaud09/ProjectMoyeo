package com.moyeo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.moyeo.dto.Qa;
import com.moyeo.mapper.QaMapper;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class QaDAOImpl implements QaDAO {
	private final SqlSession sqlSession;
	
	/*회원*/
	
	//1:1 문의 등록
	@Override
	public int insertQa(Qa qa) {
		return sqlSession.getMapper(QaMapper.class).insertQa(qa);
	}
	
	//1:1 문의 수정
	@Override
	public int updateQa(Qa qa) {
		return sqlSession.getMapper(QaMapper.class).updateQa(qa);
	}
	
	//1:1 문의 삭제
	@Override
	public int deleteQa(int qaIdx) {
		return sqlSession.getMapper(QaMapper.class).deleteQa(qaIdx);
	}

	/* 검색 */
	//상세 페이지 
	@Override
	public Qa selectQaInfo(int qaIdx) {
		return sqlSession.getMapper(QaMapper.class).selectQaInfo(qaIdx);
	}
	
	//전체 레코드 검색
	@Override
	public int selectQaCount(String searchKeyword, String searchType) {
		return sqlSession.getMapper(QaMapper.class).selectQaCount();
	}

	//전체 리스트 검색
	@Override
	public List<Qa> selectQaList(Map<String, Object> map) {
		return sqlSession.getMapper(QaMapper.class).selectQaList(map);
	}
	
	
	/*답변 관련*/
	@Override
	public int updateQaReplyStatusToOne(int qaIdx) {
		return sqlSession.getMapper(QaMapper.class).updateQaReplyStatusToOne(qaIdx);
	}
	
	@Override
	public int updateQaReplyStatusToZero(int qaIdx) {
		return sqlSession.getMapper(QaMapper.class).updateQaReplyStatusToZero(qaIdx);
	}

	@Override
	public int selectMyQaCount(String accountId) {
		return sqlSession.getMapper(QaMapper.class).selectMyQaCount(accountId);
	}

	@Override
	public List<Qa> selectMyQaList(Map<String, Object> map) {
		return sqlSession.getMapper(QaMapper.class).selectMyQaList(map);
	}

	@Override
	public List<Qa> selectQaList1(Map<String, Object> map) {
		return sqlSession.getMapper(QaMapper.class).selectQaList1(map);
	}

	@Override
	public int selectQaCount1(String selectKeyword) {
		return sqlSession.getMapper(QaMapper.class).selectQaCount1(selectKeyword);
	}
	
	/* 마이페이지 */
	//유저별 Qa 목록 조회 - 페이징 X
	@Override
	public List<Qa> selectUserQaListById(String userinfoId) {
		return sqlSession.getMapper(QaMapper.class).selectUserQaListById(userinfoId);
	}

}
